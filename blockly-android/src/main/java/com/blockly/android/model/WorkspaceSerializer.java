package com.blockly.android.model;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class WorkspaceSerializer {

    public static String serializeToJson(Workspace workspace) throws JSONException {
        JSONArray arr = new JSONArray();
        for (BlockInstance b : workspace.getAllBlocks()) {
            JSONObject obj = new JSONObject();
            obj.put("id", b.getId());
            obj.put("type", b.getDef().getType());
            obj.put("x", (double) b.x);
            obj.put("y", (double) b.y);

            JSONObject vals = new JSONObject();
            for (Map.Entry<String, String> entry : b.getFieldValues().entrySet()) {
                vals.put(entry.getKey(), entry.getValue());
            }
            obj.put("values", vals);

            if (b.next != null) {
                obj.put("nextId", b.next.getId());
            }
            if (b.statementChild != null) {
                obj.put("statementChildId", b.statementChild.getId());
            }
            arr.put(obj);
        }
        return arr.toString(2);
    }

    public static void deserializeFromJson(String json, Workspace workspace, Map<String, BlockDef> blockMap) throws JSONException {
        workspace.clear();
        JSONArray arr = new JSONArray(json);

        Map<String, BlockInstance> instanceMap = new HashMap<>();
        Map<String, String> nextMap = new HashMap<>();
        Map<String, String> stmtMap = new HashMap<>();

        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String id = obj.getString("id");
            String type = obj.getString("type");
            float x = (float) obj.optDouble("x", 0.0);
            float y = (float) obj.optDouble("y", 0.0);

            BlockDef def = blockMap.get(type);
            if (def == null) continue;

            BlockInstance block = new BlockInstance(id, def, x, y);
            if (obj.has("values")) {
                JSONObject vals = obj.getJSONObject("values");
                Iterator<String> keys = vals.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    block.setFieldValue(k, vals.getString(k));
                }
            }

            if (obj.has("nextId")) {
                nextMap.put(id, obj.getString("nextId"));
            }
            if (obj.has("statementChildId")) {
                stmtMap.put(id, obj.getString("statementChildId"));
            }

            instanceMap.put(id, block);
            workspace.addBlock(block);
        }

        for (Map.Entry<String, String> entry : nextMap.entrySet()) {
            BlockInstance current = instanceMap.get(entry.getKey());
            BlockInstance next = instanceMap.get(entry.getValue());
            if (current != null && next != null) {
                current.next = next;
                next.previous = current;
            }
        }

        for (Map.Entry<String, String> entry : stmtMap.entrySet()) {
            BlockInstance current = instanceMap.get(entry.getKey());
            BlockInstance stmt = instanceMap.get(entry.getValue());
            if (current != null && stmt != null) {
                current.statementChild = stmt;
                stmt.parentStatement = current;
            }
        }

        for (BlockInstance root : workspace.getRootBlocks()) {
            root.updateChainPositions();
        }
    }
}
