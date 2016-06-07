package com.mingsoft.ueditor;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

import com.baidu.ueditor.ActionEnter;
import com.baidu.ueditor.ConfigManager;

public class MsUeditorActionEnter extends ActionEnter {
	public MsUeditorActionEnter(HttpServletRequest request, String rootPath, String jsonConfig) {
		super(request, rootPath);

		if ((jsonConfig == null) || (jsonConfig.trim().equals("")) || (jsonConfig.length() < 0)) {
			return;
		}
		ConfigManager config = getConfigManager();

		JSONObject _jsonConfig = new JSONObject(jsonConfig);

		JSONObject jsonObject = config.getAllConfig();

		Iterator iterator = _jsonConfig.keys();
		List keyListstr = new ArrayList();
		while (iterator.hasNext()) {
			String key = (String) iterator.next();

			jsonObject.put(key, _jsonConfig.get(key));
		}
	}
}
