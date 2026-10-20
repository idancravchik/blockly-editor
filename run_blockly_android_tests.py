import os
import subprocess
import glob

JAVA_HOME = r"C:\Program Files\Android\Android Studio\jbr"
JAVA = os.path.join(JAVA_HOME, "bin", "java.exe")

junit_jars = glob.glob(os.path.expanduser("~/.gradle/caches/modules-2/files-2.1/**/junit-4.13.2.jar"), recursive=True)
hamcrest_jars = glob.glob(os.path.expanduser("~/.gradle/caches/modules-2/files-2.1/**/hamcrest-core-1.3.jar"), recursive=True)
json_jars = glob.glob(os.path.expanduser("~/.gradle/caches/modules-2/files-2.1/**/json-*.jar"), recursive=True)

junit_jar = junit_jars[0]
hamcrest_jar = hamcrest_jars[0]
json_jar = json_jars[0]

main_classes = os.path.abspath(r"blockly-android\build\intermediates\javac\debug\compileDebugJavaWithJavac\classes")
test_classes_dir = os.path.abspath(r"blockly-android\build\intermediates\javac\debugUnitTest\compileDebugUnitTestJavaWithJavac\classes")

classpath = f"{test_classes_dir};{main_classes};{junit_jar};{hamcrest_jar};{json_jar}"

test_classes = [
    "com.blockly.android.BlockSpecParserTest",
    "com.blockly.android.CodeGeneratorTest",
    "com.blockly.android.WorkspaceTest",
    "com.blockly.android.WorkspaceSerializerTest"
]

run_cmd = [
    JAVA,
    "-cp", classpath,
    "org.junit.runner.JUnitCore"
] + test_classes

res = subprocess.run(run_cmd, capture_output=True, text=True)
print(res.stdout)
if res.stderr:
    print(res.stderr)
