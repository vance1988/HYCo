/**
The MIT License (MIT) * Copyright (c) 2016 铭飞科技(mingsoft.net)

 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.mingsoft.basic.aop;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mingsoft.base.constant.e.BaseSessionEnum;
import com.mingsoft.basic.biz.IAppBiz;
import com.mingsoft.basic.entity.AppEntity;
import com.mingsoft.util.AESUtil;
import com.mingsoft.util.StringUtil;

/**
 * 切面基础
 * 
 * @author 王天培QQ:78750478
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
public abstract class BaseAop {
	/*
	 * log4j日志记录
	 */
	protected final Logger LOG = Logger.getLogger(this.getClass());

	protected final <T> T getType(JoinPoint jp, Class<T> clazz) {
		Object[] objs = jp.getArgs();
		for (Object obj : objs) {
			if (obj.getClass() == clazz) {
				return (T) obj;
			}
		}
		return null;
	}

	protected String getCode(HttpServletRequest request) {
		return request.getParameter("mail_code");
	}

	/**
	 * AES加密字符串,key值为当前应用编号
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param str
	 *            需要加密的字符串
	 * @return 返回加密后的字符串
	 */
	protected String encryptByAES(int appId, String str) {
		if (StringUtil.isBlank(str)) {
			return "";
		}
		return AESUtil.encrypt(str, StringUtil.Md5(appId + "").substring(16));
	}

	/**
	 * 获取当前模块对应的appid , appid主要根据用户的请求地址获得
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回appId，找不到对应app,返回0
	 */
	protected int getAppId(HttpServletRequest request) {
		AppEntity app = this.getApp(request);
		if (app!=null) {
			return app.getAppId();
		}
		return 0;
	}

	/**
	 * 获取当前模块对应的appid , appid主要根据用户的请求地址获得
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回appId，找不到对应app,返回0
	 */
	protected AppEntity getApp(HttpServletRequest request) {

		// 获取用户所请求的域名地址
		IAppBiz websiteBiz = (IAppBiz) getBean(request.getServletContext(), "appBiz");
		AppEntity website = websiteBiz.getByUrl(this.getDomain(request));
		return website;
	}
	/**
	 * 通过spring的webapplicationcontext上下文对象读取bean对象
	 * 
	 * @param sc
	 *            上下文servletConext对象
	 * @param beanName
	 *            要读取的bean的名称
	 * @return 返回获取到的对象。获取不到返回null
	 */
	protected Object getBean(ServletContext sc, String beanName) {
		return WebApplicationContextUtils.getWebApplicationContext(sc).getBean(beanName);
	}

	/**
	 * 获取请求域名，域名不包括http请求协议头
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回域名地址
	 */
	protected String getDomain(HttpServletRequest request) {
		String path = request.getContextPath();
		String domain = request.getServerName();
		if (request.getServerPort() == 80) {
			domain += path;
		} else {
			domain += ":" + request.getServerPort() + path;
		}
		return domain;
	}
	
	/**
	 * 获取session的值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            枚举类中的值
	 * @return session中获取的对象
	 */
	protected Object getSession(HttpServletRequest request, BaseSessionEnum key) {
		return request.getSession().getAttribute(key.toString());
	}


}