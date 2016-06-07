/**
 * 
 */
package com.mingsoft.basic.action.web;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mingsoft.basic.entity.AppEntity;
import com.mingsoft.basic.parser.BaseParser;
import com.mingsoft.parser.IParserRegexConstant;
import com.mingsoft.util.FileUtil;
import com.mingsoft.util.StringUtil;
import com.mingsoft.basic.action.BaseAction;

/**
 * 
 * 
 * 
 * <p>
 * <b>铭飞科技</b>
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2014 - 2015
 * </p>
 * 
 * @author killfen
 * 
 * <p>
 * Comments:错误页面定义
 * </p>
 * 
 * <p>
 * Create Date:2015-4-26
 * </p>
 * 
 * <p>
 * Modification history:
 * </p>
 */
@Controller("errorAction")
@RequestMapping("/error")
public class ErrorAction extends  BaseAction{
	
	
	/**
	 *文章解析器
	 */
	@Autowired
	private BaseParser baseParser;

	/**
	 * 返回404页面
	 */
	@RequestMapping("/{code}")
	@ResponseBody
	public void code(@PathVariable("code") String code, HttpServletRequest req, HttpServletResponse resp){
		String tmpFilePath = this.getTemplatePath(req) + File.separator + code+".htm";
		String content = 	FileUtil.readFile(tmpFilePath);
		if (StringUtil.isBlank(content)) {
			 content = FileUtil.readFile(this.getRealPath(req,"/errors/"+code+".htm"));
			 if (StringUtil.isBlank(content)) {
				 content = FileUtil.readFile(this.getRealPath(req,"/errors/error.htm"));
			 }
			 content = content.replace("{code/}", code);
		} else {
			content = this.parserMsTag(content,baseParser, req);
		}
		this.outString(resp, content);
	}
}
