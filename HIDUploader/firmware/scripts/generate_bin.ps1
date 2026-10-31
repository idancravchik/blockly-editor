param (
    [string]$IhxPath = "build/ch552_hid_bootloader_v2.1.ihx",
    [string]$BaseName = "ch552_hid_bootloader_v2.1"
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$firmwareDir = Split-Path -Parent $scriptDir
$buildDir = Join-Path $firmwareDir "build"

if (-not [System.IO.Path]::IsPathRooted($IhxPath)) {
    $IhxPath = Join-Path $firmwareDir $IhxPath
}

if (-not (Test-Path $IhxPath)) {
    Write-Error "IHX file not found: $IhxPath"
    exit 1
}

# 1. Parse IHX
$memory = @{}
$lines = Get-Content $IhxPath
foreach ($line in $lines) {
    $line = $line.Trim()
    if (-not $line.StartsWith(':')) { continue }
    $len = [Convert]::ToInt32($line.Substring(1, 2), 16)
    $addr = [Convert]::ToInt32($line.Substring(3, 4), 16)
    $type = [Convert]::ToInt32($line.Substring(7, 2), 16)
    if ($type -eq 0) {
        for ($i = 0; $i -lt $len; $i++) {
            $b = [Convert]::ToByte($line.Substring(9 + $i * 2, 2), 16)
            $memory[$addr + $i] = $b
        }
    } elseif ($type -eq 1) {
        break
    }
}

$sortedAddrs = $memory.Keys | Sort-Object
$minAddr = $sortedAddrs[0]
$maxAddr = $sortedAddrs[-1]
Write-Host "IHX addresses: 0x$($minAddr.ToString('X4')) to 0x$($maxAddr.ToString('X4')) (size $($maxAddr - $minAddr + 1) bytes)"

# Add LJMP 0x2C00 at 0x0000
$memWithVec = @{}
foreach ($k in $memory.Keys) { $memWithVec[$k] = $memory[$k] }
$memWithVec[0] = 0x02
$memWithVec[1] = 0x2C
$memWithVec[2] = 0x00

# 2. Write Intel HEX
function Write-IntelHex($dict, $outPath) {
    $sw = New-Object System.IO.StreamWriter($outPath, $false, [System.Text.Encoding]::ASCII)
    $addrs = $dict.Keys | Sort-Object
    $i = 0
    while ($i -lt $addrs.Count) {
        $chunkAddr = $addrs[$i]
        $chunkBytes = [System.Collections.Generic.List[byte]]::new()
        $chunkBytes.Add($dict[$chunkAddr])
        $i++
        while ($i -lt $addrs.Count -and $chunkBytes.Count -lt 16) {
            if ($addrs[$i] -eq ($chunkAddr + $chunkBytes.Count)) {
                $chunkBytes.Add($dict[$addrs[$i]])
                $i++
            } else {
                break
            }
        }
        $recLen = $chunkBytes.Count
        $recType = 0
        $addrH = ($chunkAddr -shr 8) -band 0xFF
        $addrL = $chunkAddr -band 0xFF
        $sum = $recLen + $addrH + $addrL + $recType
        $hexData = ""
        foreach ($b in $chunkBytes) {
            $sum += $b
            $hexData += $b.ToString("X2")
        }
        $cksum = ((256 - ($sum % 256)) % 256) -band 0xFF
        $sw.WriteLine(":{0:X2}{1:X4}{2:X2}{3}{4:X2}", $recLen, $chunkAddr, $recType, $hexData, $cksum)
    }
    $sw.WriteLine(":00000001FF")
    $sw.Close()
}

$hexPath = Join-Path $buildDir "$BaseName.hex"
Write-IntelHex $memWithVec $hexPath
Write-Host "Created: $hexPath"
$genericHex = Join-Path $buildDir "ch552_hid_bootloader.hex"
Copy-Item -Path $hexPath -Destination $genericHex -Force
Write-Host "Updated: $genericHex"

# 3. 14 KB Flash Image (.bin)
$bin14k = [byte[]]::new(14336)
for ($idx = 0; $idx -lt 14336; $idx++) { $bin14k[$idx] = 0xFF }
$bin14k[0] = 0x02; $bin14k[1] = 0x2C; $bin14k[2] = 0x00
foreach ($a in $memory.Keys) {
    if ($a -lt 14336) { $bin14k[$a] = $memory[$a] }
}
$path14k = Join-Path $buildDir "$BaseName.bin"
[System.IO.File]::WriteAllBytes($path14k, $bin14k)
Write-Host "Created: $path14k (14 KB Flash Image)"
$genericBin = Join-Path $buildDir "ch552_hid_bootloader.bin"
Copy-Item -Path $path14k -Destination $genericBin -Force
Write-Host "Updated: $genericBin"

# 4. 16 KB Full Flash Image (.bin)
$bin16k = [byte[]]::new(16384)
for ($idx = 0; $idx -lt 16384; $idx++) { $bin16k[$idx] = 0xFF }
$bin16k[0] = 0x02; $bin16k[1] = 0x2C; $bin16k[2] = 0x00
foreach ($a in $memory.Keys) {
    if ($a -lt 16384) { $bin16k[$a] = $memory[$a] }
}
$path16k = Join-Path $buildDir "$BaseName`_16k.bin"
[System.IO.File]::WriteAllBytes($path16k, $bin16k)
Write-Host "Created: $path16k (16 KB Full Image)"

# 5. Bootloader Partition Only (0x2C00 to 0x37FF = 3072 bytes)
$binPart = [byte[]]::new(3072)
for ($idx = 0; $idx -lt 3072; $idx++) { $binPart[$idx] = 0xFF }
foreach ($a in $memory.Keys) {
    if ($a -ge 0x2C00 -and $a -lt 0x3800) {
        $binPart[$a - 0x2C00] = $memory[$a]
    }
}
$pathPart = Join-Path $buildDir "$BaseName`_offset_0x2c00.bin"
[System.IO.File]::WriteAllBytes($pathPart, $binPart)
Write-Host "Created: $pathPart (3 KB Partition Image)"

# 6. Packed Bootloader Image
$packedLen = $maxAddr - 0x2C00 + 1
$binPacked = [byte[]]::new($packedLen)
for ($idx = 0; $idx -lt $packedLen; $idx++) { $binPacked[$idx] = 0xFF }
foreach ($a in $memory.Keys) {
    if ($a -ge 0x2C00) {
        $binPacked[$a - 0x2C00] = $memory[$a]
    }
}
$pathPacked = Join-Path $buildDir "$BaseName`_packed.bin"
[System.IO.File]::WriteAllBytes($pathPacked, $binPacked)
Write-Host "Created: $pathPacked (Packed Image)"
