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

package com.mingsoft.util.proxy;

import java.util.HashMap;
import java.util.Map;


/**
 * 头部自定义，部分网站会对头部的信息进行安全检查。<br>
 * 独立出头部类方便对头部信息进行自定义，<br>
 * 在使用Proxy代理工具类是必须传递头部信息对象
 * 
 * @author killfen
 * @version 1.0.0
 */
public class Header {
	private Map headers;

	/**
	 * 构造 host:要访问的网站域名 code:访问网站的编码格式
	 */
	public Header(String host, String code) {
		headers = new HashMap();

		headers.put("Host", host);
		headers.put("Connection", "keep-alive");
		headers.put("Referer", "http://" + host);
		headers.put("Cache-Control", "max-age=0");
		headers.put("User-Agent","Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.186 Safari/535.1");
		headers.put("Content-Type", "application/x-www-form-urlencoded");
		headers.put("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		headers.put("Accept-Language", "zh-CN,zh;q=0.8");
		headers.put("Accept-Charset", "GBK,utf-8;q=0.7,*;q=0.3");
		headers.put("Cookie", getCookie());
		// headers.put("Accept-Encoding", "gzip,deflate,sdch");
		// headers.put("Origin", "http://localhost");
	}


	/**
	 * 从头部内容获取cookie值
	 * 
	 * @return 字符串，如果没有cookie返回null
	 */
	public String getCookie() {
		if (headers.get("Cookie") != null)
			return (String) headers.get("Cookie");
		return null;
	}

	/**
	 * 将自定义的cookie设置到请求头部
	 * 
	 * @param cookie
	 *            字符串
	 */
	public void setCookie(String cookie) {
		headers.put("Cookie", cookie);
	}

	/**
	 * 设置头信息
	 * 
	 * @param key
	 *            头部参数名称<br>
	 * @param value
	 *            参数对应的值
	 */
	public void setHeader(String key, String value) {
		headers.put(key, value);
	}

	/**
	 * 返回所以头部信息
	 * @return Map对象
	 */
	public Map getHeaders() {
		return headers;
	}
}