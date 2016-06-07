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


import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.zip.GZIPInputStream;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.util.EntityUtils;

/**
 * 结果封装类
 * 
 * @author killfen
 * @author killfen
 * @version 1.0.0
 */
public class Result {
	private String cookie; // 返回的cookie值

	private int statusCode; // 请求网页返回状态代码如果是200，则请求页面成功。

	@SuppressWarnings("rawtypes")
	private HashMap headerAll;

	private HttpEntity httpEntity;


	/**
	 * 读取返回的cookie值
	 * 
	 * @return 字符串
	 */
	public String getCookie() {
		return cookie;
	}

	/**
	 * 网站的访问状态
	 * 
	 * @return 200为访问页面成功。详细请查阅http协议的材料
	 */
	public int getStatusCode() {
		return statusCode;
	}

	/**
	 * 获取放回的头部信息
	 * 
	 * @return 头部信息集合
	 */
	@SuppressWarnings("rawtypes")
	public HashMap getHeaders() {
		return headerAll;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setHeaders(Header[] headers) {
		headerAll = new HashMap();
		for (int i=0;i<headers.length;i++) {
			Header header = headers[i];
			headerAll.put(header.getName(), header.getValue());
		}
	}

	public HttpEntity getHttpEntity() {
		return httpEntity;
	}

	public void setHttpEntity(HttpEntity httpEntity) {
		this.httpEntity = httpEntity;
	}

	/**
	 * 返回页面内容
	 * 
	 * @param charset
	 *            页面编码
	 * @return 字符串。如果异常返回null
	 */
	public String getContent(String charset) {
		try {
			return EntityUtils.toString(httpEntity, charset);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 返回页面内容
	 * 
	 * @return 字符串。如果异常返回null
	 */
	public String getContent() {
		try {
			return EntityUtils.toString(httpEntity);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 如果页面是通过gzip压缩过的。可以使用该方法进行解压
	 * 
	 * @param charSet
	 *            字符编码
	 * @return InputStreamReade对象;
	 */
	public String getContentForGzip(String charset) {
		if (httpEntity.getContentEncoding().getValue().indexOf("gzip") > -1) {
			try {
				GZIPInputStream gzipis = new GZIPInputStream(httpEntity
						.getContent());

				InputStreamReader isr = new InputStreamReader(gzipis, charset); // 设置读取流的编码格式，自定义编码
				java.io.BufferedReader br = new java.io.BufferedReader(isr);
				String tempbf;
				StringBuffer sb = new StringBuffer();
				while ((tempbf = br.readLine()) != null) {
					sb.append(tempbf);
					sb.append("\r\n");
				}
				gzipis.close();
				isr.close();
				return sb.toString();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}

	public void setStatusCode(int statusCode2) {
		this.statusCode = statusCode2;
	}
}