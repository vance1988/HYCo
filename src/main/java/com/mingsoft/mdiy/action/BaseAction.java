package com.mingsoft.mdiy.action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mingsoft.base.constant.Const;
import com.mingsoft.basic.action.BasicAction;
import com.mingsoft.basic.biz.ICategoryBiz;
import com.mingsoft.basic.biz.IColumnBiz;
import com.mingsoft.basic.entity.AppEntity;
import com.mingsoft.basic.entity.ColumnEntity;
import com.mingsoft.basic.parser.IGeneralParser;
import com.mingsoft.mdiy.biz.IContentModelBiz;
import com.mingsoft.mdiy.biz.IModelTemplateBiz;
import com.mingsoft.mdiy.biz.ISearchBiz;
import com.mingsoft.mdiy.entity.ContentModelEntity;
import com.mingsoft.mdiy.entity.ModelTemplateEntity;
import com.mingsoft.mdiy.entity.SearchEntity;
import com.mingsoft.mdiy.parser.ListParser;
import com.mingsoft.parser.IParserRegexConstant;
import com.mingsoft.util.FileUtil;
import com.mingsoft.util.PageUtil;
import com.mingsoft.util.StringUtil;

/**
 * 
 * 铭飞 ms-mdiy 模块
 * 
 * @author 会飞
 * @version 300-001-001 版本号：<br/>
 *          创建日期：2016年4月10日<br/>
 *          历史修订：<br/>
 */
public abstract class BaseAction extends com.mingsoft.basic.action.BaseAction {

	protected static String MODEL = "/mdiy";

	/**
	 * 动态生成页面，根据model_template表
	 * 
	 * @param key
	 *            对应表中的key值
	 * @param req
	 *            HttpServletRequest对象
	 * @return 如果没有读到模版返回的是null，没读到的情况有两种原因一种是找不到相应的应用，一种是模版文件不存在
	 */
	protected String generaterPage(String key, IGeneralParser parser, HttpServletRequest req) {
		AppEntity app = this.getApp(req);
		if (app == null) {
			return null;
		}

		IModelTemplateBiz modelTemplateBiz = (IModelTemplateBiz) getBean(req.getServletContext(), "modelTemplateBiz");
		ModelTemplateEntity mte = modelTemplateBiz.getEntity(app.getAppId(), key);
		if (mte == null) {
			return null;
		}
		String templatePath = mte.getModelTemplatePath();
		String path = getRealPath(req, IParserRegexConstant.REGEX_SAVE_TEMPLATE) + File.separator + app.getAppId()
				+ File.separator + app.getAppStyle() + File.separator;
		String content = "";
		if (isMobileDevice(req) && !StringUtil.isBlank(app.getAppMobileStyle())) { // 移动端
			String htmlContent = FileUtil.readFile(path + app.getAppMobileStyle() + File.separator + templatePath); // 读取模版文件内容
			Map map = new HashMap();
			map.put(IGeneralParser.MOBILE, app.getAppMobileStyle());
			content = parser.parse(htmlContent, app, map);
		} else {
			String htmlContent = FileUtil.readFile(path + templatePath);
			content = parser.parse(htmlContent, app);
		}

		if (content == null) {
			return this.getResString("err");
		}
		Map<String, String[]> param = req.getParameterMap();
		// 将get或post提交过来的参数映射到界面上去
		for (Entry<String, String[]> entry : param.entrySet()) {
			if (entry.getValue()==null){
				content = content.replace("{" + entry.getKey() + "/}", "");
				continue;
			}

			String value = entry.getValue()[0]; // 处理由get方法请求中文乱码问题
			if (StringUtil.isBlank(value)) {
				continue;
			}
			if (req.getMethod().equals(RequestMethod.GET)) { // 如果是get方法需要将请求地址参数转吗
				value = StringUtil.isoToUTF8(value);
			}
			content = content.replace("{" + entry.getKey() + "/}", value);
		}
		return content;
	}

	/**
	 * 读取模板文件内容
	 * 
	 * @param fileName
	 *            文件名称
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回模板文件内容
	 */
	protected String readTemplate(String fileName, HttpServletRequest request) {
		AppEntity app = this.getApp(request);
		if (app == null) {
			return null;
		}
		String path = this.getRealPath(request, File.separator) + File.separator
				+ IParserRegexConstant.REGEX_SAVE_TEMPLATE + File.separator + app.getAppId() + File.separator
				+ app.getAppStyle();
		path += File.separator + fileName;
		return FileUtil.readFile(path);
	}


}
