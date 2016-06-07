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

package com.mingsoft.base.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSONObject;
import com.mingsoft.base.constant.Const;
import com.mingsoft.base.constant.e.BaseCookieEnum;
import com.mingsoft.base.constant.e.BaseEnum;
import com.mingsoft.base.constant.e.BaseSessionEnum;
import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.base.entity.ResultJson;
import com.mingsoft.base.entity.SessionEntity;
import com.mingsoft.util.Base64Util;
import com.mingsoft.util.StringUtil;

/**
 * 基础控制类
 * 
 * @author 王天培QQ:78750478
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public abstract class BaseAction {

	/*
	 * log4j日志记录
	 */
	protected final Logger LOG = Logger.getLogger(this.getClass());

	/**
	 * 默认页码参数
	 */
	private final String PAGE_NO = "pageNo";

	/**
	 * 默认一页显示数量
	 */
	private final String PAGE_SIZE = "pageSize";

	/** Wap网关Via头信息中特有的描述信息 */
	private static String mobileGateWayHeaders[] = new String[] { "ZXWAP", // 中兴提供的wap网关的via信息，例如：Via=ZXWAP
																			// GateWayZTE
																			// Technologies，
			"chinamobile.com", // 中国移动的诺基亚wap网关，例如：Via=WTP/1.1
								// GDSZ-PB-GW003-WAP07.gd.chinamobile.com (Nokia
								// WAP Gateway 4.1 CD1/ECD13_D/4.1.04)
			"monternet.com", // 移动梦网的网关，例如：Via=WTP/1.1
								// BJBJ-PS-WAP1-GW08.bj1.monternet.com. (Nokia
								// WAP
								// Gateway 4.1 CD1/ECD13_E/4.1.05)
			"infoX", // 华为提供的wap网关，例如：Via=HTTP/1.1 GDGZ-PS-GW011-WAP2
						// (infoX-WISG
						// Huawei Technologies)，或Via=infoX WAP Gateway V300R001
						// Huawei Technologies
			"XMS 724Solutions HTG", // 国外电信运营商的wap网关，不知道是哪一家
			"wap.lizongbo.com", // 自己测试时模拟的头信息
			"Bytemobile",// 貌似是一个给移动互联网提供解决方案提高网络运行效率的，例如：Via=1.1 Bytemobile OSN
							// WebProxy/5.1
	};
	/** 电脑上的IE或Firefox浏览器等的User-Agent关键词 */
	private static String[] pcHeaders = new String[] { "Windows 98", "Windows ME", "Windows 2000", "Windows XP",
			"Windows NT", "Ubuntu" };
	/** 手机浏览器的User-Agent里的关键词 */
	private static String[] mobileUserAgents = new String[] { "Nokia", // 诺基亚，有山寨机也写这个的，总还算是手机，Mozilla/5.0
																		// (Nokia5800
																		// XpressMusic)UC
																		// AppleWebkit(like
																		// Gecko)
																		// Safari/530
			"SAMSUNG", // 三星手机
						// SAMSUNG-GT-B7722/1.0+SHP/VPP/R5+Dolfin/1.5+Nextreaming+SMM-MMS/1.2.0+profile/MIDP-2.1+configuration/CLDC-1.1
			"MIDP-2", // j2me2.0，Mozilla/5.0 (SymbianOS/9.3; U; Series60/3.2
						// NokiaE75-1 /110.48.125 Profile/MIDP-2.1
						// Configuration/CLDC-1.1 ) AppleWebKit/413 (KHTML like
						// Gecko) Safari/413
			"CLDC1.1", // M600/MIDP2.0/CLDC1.1/Screen-240X320
			"SymbianOS", // 塞班系统的，
			"MAUI", // MTK山寨机默认ua
			"UNTRUSTED/1.0", // 疑似山寨机的ua，基本可以确定还是手机
			"Windows CE", // Windows CE，Mozilla/4.0 (compatible; MSIE 6.0;
							// Windows CE; IEMobile 7.11)
			"iPhone", // iPhone是否也转wap？不管它，先区分出来再说。Mozilla/5.0 (iPhone; U; CPU
						// iPhone OS 4_1 like Mac OS X; zh-cn) AppleWebKit/532.9
						// (KHTML like Gecko) Mobile/8B117
			"iPad", // iPad的ua，Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X;
					// zh-cn) AppleWebKit/531.21.10 (KHTML like Gecko)
					// Version/4.0.4 Mobile/7B367 Safari/531.21.10
			"Android", // Android是否也转wap？Mozilla/5.0 (Linux; U; Android
						// 2.1-update1; zh-cn; XT800 Build/TITA_M2_16.22.7)
						// AppleWebKit/530.17 (KHTML like Gecko) Version/4.0
						// Mobile Safari/530.17
			"BlackBerry", // BlackBerry8310/2.7.0.106-4.5.0.182
			"UCWEB", // ucweb是否只给wap页面？ Nokia5800
						// XpressMusic/UCWEB7.5.0.66/50/999
			"ucweb", // 小写的ucweb貌似是uc的代理服务器Mozilla/6.0 (compatible; MSIE 6.0;)
						// Opera ucweb-squid
			"BREW", // 很奇怪的ua，例如：REW-Applet/0x20068888 (BREW/3.1.5.20; DeviceId:
					// 40105; Lang: zhcn) ucweb-squid
			"J2ME", // 很奇怪的ua，只有J2ME四个字母
			"YULONG", // 宇龙手机，YULONG-CoolpadN68/10.14 IPANEL/2.0 CTC/1.0
			"YuLong", // 还是宇龙
			"COOLPAD", // 宇龙酷派YL-COOLPADS100/08.10.S100 POLARIS/2.9 CTC/1.0
			"TIANYU", // 天语手机TIANYU-KTOUCH/V209/MIDP2.0/CLDC1.1/Screen-240X320
			"TY-", // 天语，TY-F6229/701116_6215_V0230 JUPITOR/2.2 CTC/1.0
			"K-Touch", // 还是天语K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223
						// Release/30.07.2008 Browser/WAP2.0
			"Haier", // 海尔手机，Haier-HG-M217_CMCC/3.0 Release/12.1.2007
						// Browser/WAP2.0
			"DOPOD", // 多普达手机
			"Lenovo", // 联想手机，Lenovo-P650WG/S100 LMP/LML Release/2010.02.22
						// Profile/MIDP2.0 Configuration/CLDC1.1
			"LENOVO", // 联想手机，比如：LENOVO-P780/176A
			"HUAQIN", // 华勤手机
			"AIGO-", // 爱国者居然也出过手机，AIGO-800C/2.04 TMSS-BROWSER/1.0.0 CTC/1.0
			"CTC/1.0", // 含义不明
			"CTC/2.0", // 含义不明
			"CMCC", // 移动定制手机，K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223
					// Release/30.07.2008 Browser/WAP2.0
			"DAXIAN", // 大显手机DAXIAN X180 UP.Browser/6.2.3.2(GUI) MMP/2.0
			"MOT-", // 摩托罗拉，MOT-MOTOROKRE6/1.0 LinuxOS/2.4.20 Release/8.4.2006
					// Browser/Opera8.00 Profile/MIDP2.0 Configuration/CLDC1.1
					// Software/R533_G_11.10.54R
			"SonyEricsson", // 索爱手机，SonyEricssonP990i/R100 Mozilla/4.0
							// (compatible; MSIE 6.0; Symbian OS; 405) Opera
							// 8.65 [zh-CN]
			"GIONEE", // 金立手机
			"HTC", // HTC手机
			"ZTE", // 中兴手机，ZTE-A211/P109A2V1.0.0/WAP2.0 Profile
			"HUAWEI", // 华为手机，
			"webOS", // palm手机，Mozilla/5.0 (webOS/1.4.5; U; zh-CN)
						// AppleWebKit/532.2 (KHTML like Gecko) Version/1.0
						// Safari/532.2 Pre/1.0
			"GoBrowser", // 3g GoBrowser.User-Agent=Nokia5230/GoBrowser/2.0.290
							// Safari
			"IEMobile", // Windows CE手机自带浏览器，
			"WAP2.0"// 支持wap 2.0的
	};

	/**
	 * 获取当前页码,默认参数名称pageNo
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 默认1,如果存在pageNo参数就返回相应的值
	 */
	protected Integer getPageNo(HttpServletRequest request) {
		return this.getInt(request, PAGE_NO, 1);
	}

	/**
	 * 获取当前一页显示数量,默认参数名称pageSize
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 默认10,如果存在pageNo参数就返回相应的值
	 */
	protected Integer getPageSize(HttpServletRequest request) {
		return this.getInt(request, PAGE_SIZE, 10);
	}

	/**
	 * 获取整型值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param param
	 *            参数名称
	 * @return 返回整型值，没找到返回null
	 */
	protected Integer getInt(HttpServletRequest request, String param) {
		String value = request.getParameter(param);
		if (StringUtil.isInteger(value)) {
			return Integer.parseInt(value);
		} else {
			return 0;
		}
	}

	/**
	 * 获取整型值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param param
	 *            参数名称
	 * @param def
	 *            默认值，如果参数不存在或不符合规则就用默认值替代
	 * @return 返回整型值
	 */
	protected Integer getInt(HttpServletRequest request, String param, int def) {
		String value = request.getParameter(param);
		if (StringUtil.isInteger(value)) {
			return Integer.parseInt(value);
		} else {
			return def;
		}
	}

	/**
	 * 获取base64机密的整型值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param param
	 *            参数名称
	 * @return 返回base64的整型值,没找到返回null
	 */
	protected Integer getIntBase64(HttpServletRequest request, String param) {
		String value = request.getParameter(param);
		if (StringUtil.isInteger(value)) {
			return Integer.parseInt(new String(Base64Util.decode(value)));
		} else {
			return null;
		}
	}

	/**
	 * 获取布尔值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param param
	 *            参数名称
	 * @return 返回布尔值，没找到返回null
	 */
	protected Boolean getBoolean(HttpServletRequest request, String param) {
		String value = request.getParameter(param);
		try {
			return Boolean.parseBoolean(value);
		} catch (Exception e) {
			return false;
		}
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


	/**
	 * 设置session的值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            枚举类中的值
	 */
	protected void setSession(HttpServletRequest request, BaseSessionEnum key, Object value) {
		request.getSession().setAttribute(key.toString(), value);
	}


	/**
	 * 移除session的值
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param key
	 *            枚举类中的值
	 */
	protected void removeSession(HttpServletRequest request, BaseSessionEnum key) {
		request.getSession().removeAttribute(key.toString());
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
	 * 输出json数据
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param code
	 *            模块编号<br/>
	 * @param flag
	 *            成功状态,true:成功、false:失败
	 * @param msg
	 *            提示信息
	 * @param data
	 *            数据
	 */
	protected void outJson(HttpServletResponse response, BaseEnum code, boolean flag, String msg, String data) {
		try {
			ResultJson result = new ResultJson();
			if (code != null) {
				result.setCode(code.toString());
			}
			result.setResult(flag);
			result.setResultMsg(msg);
			result.setResultData(data);
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(JSONObject.toJSON(result));
			LOG.debug(JSONObject.toJSON(result));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			LOG.error(e);
		}
	}

	/**
	 * 输出json数据
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param code
	 *            模块编号<br/>
	 * @param flag
	 *            成功状态,true:成功、false:失败
	 * @param msg
	 *            提示信息
	 */
	protected void outJson(HttpServletResponse response, BaseEnum code, boolean flag, String msg) {
		this.outJson(response, code, flag, msg, null);
	}

	/**
	 * 输出json数据
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param code
	 *            模块编号<br/>
	 * @param flag
	 *            成功状态,true:成功、false:失败
	 */
	protected void outJson(HttpServletResponse response, BaseEnum code, boolean flag) {
		this.outJson(response, code, flag, null, null);
	}

	/**
	 * 输出json数据
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param flag
	 *            成功状态,true:成功、false:失败
	 */
	protected void outJson(HttpServletResponse response, boolean flag) {
		this.outJson(response, null, flag, null, null);
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
			LOG.error(e);
		}
	}

	/**
	 * 将BaseEntity以json字符串格式输出
	 * 
	 * @param response
	 * @param entity
	 *            实体对象
	 */
	protected void outJson(HttpServletResponse response, BaseEntity entity) {
		this.outJson(response, JSONObject.toJSONString(entity));
	}

	/**
	 * 将list以json字符串格式输出
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param list
	 *            记录集合
	 */
	protected void outJson(HttpServletResponse response, List list) {
		this.outJson(response, JSONObject.toJSONString(list));
	}

	/**
	 * 输出String数据字符串
	 * 
	 * @param response
	 *            HttpServletResponse对象
	 * @param dataStr
	 *            字符串
	 */
	protected void outString(HttpServletResponse response, Object dataStr) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(dataStr);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			LOG.error(e);
		}
	}

	/**
	 * 获取项目路径
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回项目路径，例如：http://www.ip.com/projectName 后面没有反斜杠，后面接地址或参数必须加/
	 */
	protected String getUrl(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() == 80) {
			basePath += path;
		} else {
			basePath += ":" + request.getServerPort() + path;
		}
		return basePath;
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
	 * 读取服务器主机信息
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回主机信息
	 */
	protected String getHost(HttpServletRequest request) {
		String basePath = request.getServerName();
		if (request.getServerPort() != 80) {
			basePath += ":" + request.getServerPort();
		}
		return basePath;
	}

	/**
	 * 读取服务器主机ip信息
	 * 
	 * @return 返回主机IP，异常将会获取不到ip
	 */
	protected String getHostIp() {
		InetAddress addr;
		try {
			addr = InetAddress.getLocalHost();
			return addr.getHostAddress().toString();// 获得本机IP
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 读取国际化资源文件
	 * 
	 * @param key
	 *            键值
	 * @return 返回获取到的字符串
	 */
	protected String getResString(String key) {
		return Const.RESOURCES.getString(key);
	}

	/**
	 * 读取国际化资源文件，优先模块对应的资源文件，如果模块资源文件找不到就会优先基础层
	 * 
	 * @param key
	 *            键值
	 * @param rb
	 *            模块对应资源文件
	 * @return 返回获取到的字符串
	 */
	protected String getResString(String key, ResourceBundle rb) {
		try {
			return rb.getString(key);
		} catch (MissingResourceException e) {
			return Const.RESOURCES.getString(key);
		}
	}

	/**
	 * 读取国际化资源文件
	 * 
	 * @param key
	 *            键值
	 * @param fullStrs
	 *            需填充的值
	 * @return 返回获取到的字符串
	 */
	protected String getResString(String key, String... fullStrs) {
		String temp = this.getResString(key);
		for (int i = 0; i < fullStrs.length; i++) {
			temp = temp.replace("{" + i + "}", fullStrs[i]);
		}
		return temp;
	}

	/**
	 * 读取国际化资源文件，优先模块对应的资源文件，如果模块资源文件找不到就会优先基础层
	 * 
	 * @param key
	 *            键值
	 * @param rb
	 *            模块对应资源文件
	 * @return 返回获取到的字符串
	 */
	protected String getResString(String key, ResourceBundle rb, String... fullStrs) {
		String temp = "";
		try {
			temp = rb.getString(key);
		} catch (MissingResourceException e) {
			temp = getResString(key);
		}
		for (int i = 0; i < fullStrs.length; i++) {
			temp = temp.replace("{" + i + "}", fullStrs[i]);
		}
		return temp;
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
	 * 通过spring的webapplicationcontext上下文对象读取bean对象
	 * 
	 * @param beanName
	 *            要读取的bean的名称
	 * @return 返回获取到的对象。获取不到返回nul
	 */
	protected Object getBean(String beanName) {
		return com.mingsoft.base.constant.Const.CONTEXT.getBean(beanName);
	}



	/**
	 * 根据当前请求的特征，判断该请求是否来自手机终端，主要检测特殊的头信息，以及user-Agent这个header
	 * 
	 * @param request
	 *            HttpServletRequest对象,http请求
	 * @return 如果命中手机特征规则，则返回对应的特征字符串
	 */
	public boolean isMobileDevice(HttpServletRequest request) {
		boolean b = false;
		boolean pcFlag = false;
		boolean mobileFlag = false;
		String via = request.getHeader("Via");
		String userAgent = request.getHeader("user-agent");
		for (int i = 0; via != null && !via.trim().equals("") && i < mobileGateWayHeaders.length; i++) {
			if (via.contains(mobileGateWayHeaders[i])) {
				mobileFlag = true;
				break;
			}
		}
		for (int i = 0; !mobileFlag && userAgent != null && !userAgent.trim().equals("")
				&& i < mobileUserAgents.length; i++) {
			if (userAgent.contains(mobileUserAgents[i])) {
				mobileFlag = true;
				break;
			}
		}
		for (int i = 0; userAgent != null && !userAgent.trim().equals("") && i < pcHeaders.length; i++) {
			if (userAgent.contains(pcHeaders[i])) {
				pcFlag = true;
				break;
			}
		}
		if (mobileFlag == true && pcFlag == false) {
			b = true;
		}
		return b;// false pc true shouji

	}

	/**
	 * 根据属性配置文件返回map
	 * 
	 * @return 返回Map
	 */
	protected Map<String, String> getMapByProperties(String filePath) {
		if (StringUtil.isBlank(filePath)) {
			return null;
		}
		ResourceBundle rb = ResourceBundle.getBundle(filePath);
		return this.getMapByProperties(rb);
	}

	protected Map<String, String> getMapByProperties(ResourceBundle rb) {
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> en = rb.getKeys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			map.put(key, rb.getString(key));
		}
		return map;
	}

	/**
	 * 获取当期项目物理路径
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @param filePath
	 *            相对路径文件夹
	 * @return 返回当期项目物理路径
	 */
	protected String getRealPath(HttpServletRequest request, String filePath) {
		return request.getServletContext().getRealPath("") + File.separator + filePath;
	}





	/**
	 * 将请求的request的参数重新组装。主要是将空值的替换成null,因为requestMap空值是"",这样处理有利于外部判断,
	 * 同时将获取到的值映射到页面上
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回处理过后的数据
	 */
	protected Map<String, Object> assemblyRequestMap(HttpServletRequest request) {
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String[]> map = request.getParameterMap();
		Iterator<String> key = map.keySet().iterator();
		while (key.hasNext()) {
			String k = (String) key.next();
			String[] value = map.get(k);

			if (value.length == 1) {
				String temp = null;
				if (!StringUtil.isBlank(value[0])) {
					temp = value[0];
				}
				params.put(k, temp);
				request.setAttribute(k, temp);
			} else if (value.length == 0) {
				params.put(k, null);
				request.setAttribute(k, null);
			} else if (value.length > 1) {
				params.put(k, value);
				request.setAttribute(k, value);
			}
		}
		return params;
	}

	/**
	 * 获取请求的数据流，主要提供给微信平台接口使用
	 * 
	 * @param request
	 *            HttpServletRequest对象
	 * @return 返回请求的数据流字符串，例如：微信平台会返回JSON或xml字符串
	 */
	protected String readStreamParameter(HttpServletRequest request) {
		StringBuilder buffer = new StringBuilder();
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "utf-8"));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != reader) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return buffer.toString();
	}


	/**
	 * 获取请求客户端ip
	 * 
	 * @param request
	 * @return ip地址
	 */
	public String getIp(HttpServletRequest request) {
		String ipAddress = null;
		// ipAddress = this.getRequest().getRemoteAddr();
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}

	/**
	 * 获取对应ip地址的mac地址
	 * 
	 * @param ip
	 * @return mac地址
	 */
	public String getMACAddress(String ip) {
		String str = "";
		String macAddress = "";
		try {
			Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
			InputStreamReader ir = new InputStreamReader(p.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			for (int i = 1; i < 100; i++) {
				str = input.readLine();
				if (str != null) {
					if (str.indexOf("MAC Address") > 1) {
						macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
						break;
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace(System.out);
		}
		return macAddress;
	}

	
}