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

package com.mingsoft.basic.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mingsoft.base.constant.e.BaseCookieEnum;
import com.mingsoft.base.constant.e.BaseSessionEnum;
import com.mingsoft.basic.biz.IAppBiz;
import com.mingsoft.basic.constant.e.SessionConstEnum;
import com.mingsoft.basic.entity.AppEntity;
import com.mingsoft.util.StringUtil;

/**
 * 基础拦截器
 * 
 * @author 王天培QQ:78750478
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
public abstract class BaseInterceptor extends HandlerInterceptorAdapter {
	protected static String BASE = "base";

	protected static String BASE_PATH = "basePath";

	protected static String MODEL_ID = "modelId";

	protected static String BASE_URL = "baseUrl";

	protected static String BASE_MANAGER_PATH = "baseManager";
	
	protected static String MANAGER_PATH = "managerPath";

	protected Logger logger = Logger.getLogger(this.getClass());
	protected static boolean IS_WINDOWS = false;

	static {
		if (System.getProperty("os.name").toLowerCase().indexOf("windows") > 0) {
			IS_WINDOWS = true;
		}
	}

	/**
	 * 通过spring的webapplicationcontext上下文对象读取bean对象
	 * 
	 * @param sc
	 *            上下文servletConext对象
	 * @param beanName
	 *            要读取的bean的名称
	 * @return 获取到返回对象，否则返回null
	 */
	protected Object getBean(ServletContext sc, String beanName) {
		return WebApplicationContextUtils.getWebApplicationContext(sc).getBean(beanName);
	}

	/**
	 * 设置session
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            键SessionConst里面定义
	 * @param obj
	 *            对象
	 */
	protected void setSession(HttpServletRequest request, BaseSessionEnum key, Object obj) {
		if (StringUtil.isBlank(obj.toString())) {
			return;
		}
		request.getSession().setAttribute(key.toString(), obj);
	}

	/**
	 * 获取session
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            键SessionConst里面定义
	 */
	protected Object getSession(HttpServletRequest request, BaseSessionEnum key) {
		return request.getSession().getAttribute(key.toString());
	}
	

	/**
	 * 设置Cookie值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param response
	 *            HttpServletResponse对象
	 * @param key
	 *            枚举类中的值
	 * @param value
	 *            存储对象
	 */
	protected void setCookie(HttpServletRequest request, HttpServletResponse response, BaseCookieEnum key,
			Object value) {
		request.getSession().setAttribute(key.toString(), value);
		Cookie cookie = new Cookie(key.toString(), (String) value);
		cookie.setPath("/");
		cookie.setValue((String) value);
		response.addCookie(cookie);
	}


	/**
	 * 设置Cookie值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param response
	 *            HttpServletResponse对象
	 * @param key
	 *            枚举类中的值
	 * @param value
	 *            存储对象
	 * @param maxAge
	 *            cookie生命周期 以秒为单位
	 */
	protected void setCookie(HttpServletRequest request, HttpServletResponse response, BaseCookieEnum key, Object value,
			int maxAge) {
		request.getSession().setAttribute(key.toString(), value);
		Cookie cookie = new Cookie(key.toString(), value.toString());
		cookie.setPath("/");
		cookie.setValue(value.toString());
		cookie.setMaxAge(maxAge);
		response.addCookie(cookie);
	}
	

	/**
	 * 获取Cookie的值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            枚举类中的值
	 * @return Cookie中获取的对象
	 */
	protected String getCookie(HttpServletRequest request, BaseCookieEnum key) {
		if (request.getCookies() != null) {
			for (Cookie c : request.getCookies()) {
				if (c.getName().equals(key.toString())) {
					return c.getValue();
				}
			}
		}
		return null;
	}

	/**
	 * 输出json数据字符串
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param jsonDataStr
	 *            字符串
	 */
	protected void outJson(HttpServletResponse response, Object jsonDataStr) {
		try {
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonDataStr);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取当前模块对应的appid , appid主要根据用户的请求地址获得
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回appId，找不到对应app,返回0
	 */
	protected int getAppId(HttpServletRequest request) {
		return this.getApp(request).getAppId();
	}

	/**
	 * 获取当前模块对应的appid , appid主要根据用户的请求地址获得
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回appId，找不到对应app,返回0
	 */
	protected AppEntity getApp(HttpServletRequest request) {
		AppEntity app = new AppEntity();
		// 获取用户所请求的域名地址
		IAppBiz appBiz = (IAppBiz) getBean(request.getServletContext(), "appBiz");
		AppEntity website = appBiz.getByUrl(this.getDomain(request));
		if (website == null) {
			return null;
		}
		BeanUtils.copyProperties(website, app);
		return app;
	}
	
	/**
	 * 获取请求域名，域名不包括http请求协议头
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回域名地址
	 */
	private String getDomain(HttpServletRequest request) {
		String path = request.getContextPath();
		String domain = request.getServerName();
		if (request.getServerPort() == 80) {
			domain += path;
		} else {
			domain += ":" + request.getServerPort() + path;
		}
		return domain;
	}


}