package com.blockly.android.model;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class BlockSpecParser {

    public static List<BlockDef> parseBlocks(String jsonString) throws JSONException {
        List<BlockDef> list = new ArrayList<>();
        JSONArray arr = new JSONArray(jsonString);
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String type = obj.getString("type");
            String message = obj.optString("message", type);

            int color = parseColor("#4CAF50");
            if (obj.has("color")) {
                try {
                    color = parseColor(obj.getString("color"));
                } catch (Exception ignored) {}
            }

            List<FieldDef> fields = new ArrayList<>();
            if (obj.has("fields")) {
                JSONArray fieldsArr = obj.getJSONArray("fields");
                for (int j = 0; j < fieldsArr.length(); j++) {
                    JSONObject fObj = fieldsArr.getJSONObject(j);
                    String fName = fObj.getString("name");
                    String fType = fObj.optString("type", "text");
                    String fDefault = fObj.optString("default", "");
                    List<String> options = new ArrayList<>();
                    if (fObj.has("options")) {
                        JSONArray optArr = fObj.getJSONArray("options");
                        for (int k = 0; k < optArr.length(); k++) {
                            options.add(optArr.getString(k));
                        }
                    }
                    fields.add(new FieldDef(fName, fType, fDefault, options));
                }
            }

            boolean hasStatements = false;
            String statementName = "DO";
            if (obj.has("statements")) {
                JSONArray stmts = obj.getJSONArray("statements");
                if (stmts.length() > 0) {
                    hasStatements = true;
                    statementName = stmts.getJSONObject(0).optString("name", "DO");
                }
            }

            boolean previousStatement = obj.optBoolean("previousStatement", true);
            boolean nextStatement = obj.optBoolean("nextStatement", true);
            String code = obj.optString("code", "");

            list.add(new BlockDef(type, message, color, fields, hasStatements,
                    statementName, previousStatement, nextStatement, code));
        }
        return list;
    }

    public static List<CategoryDef> parseCategories(String jsonString) throws JSONException {
        List<CategoryDef> list = new ArrayList<>();
        JSONArray arr = new JSONArray(jsonString);
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String id = obj.getString("id");
            String name = obj.optString("name", id);
            int color = parseColor("#607D8B");
            if (obj.has("color")) {
                try {
                    color = parseColor(obj.getString("color"));
                } catch (Exception ignored) {}
            }
            List<String> blockTypes = new ArrayList<>();
            if (obj.has("blocks")) {
                JSONArray bArr = obj.getJSONArray("blocks");
                for (int k = 0; k < bArr.length(); k++) {
                    blockTypes.add(bArr.getString(k));
                }
            }
            list.add(new CategoryDef(id, name, color, blockTypes));
        }
        return list;
    }

    public static int parseColor(String colorStr) {
        if (colorStr == null || colorStr.isEmpty()) return 0xFF4CAF50;
        if (colorStr.startsWith("#")) colorStr = colorStr.substring(1);
        try {
            if (colorStr.length() == 6) {
                return (int) (0xFF000000L | Long.parseLong(colorStr, 16));
            } else if (colorStr.length() == 8) {
                return (int) Long.parseLong(colorStr, 16);
            }
        } catch (Exception ignored) {}
        return 0xFF4CAF50;
    }
}
