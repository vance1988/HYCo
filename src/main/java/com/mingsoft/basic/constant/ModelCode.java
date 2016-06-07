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

package com.mingsoft.basic.constant;

import com.mingsoft.base.constant.e.BaseEnum;

public enum ModelCode implements BaseEnum{
	/**
	 * 登录模块编号
	 */
	ADMIN_LOGIN("00000000"),
	/**
	 * 权限管理:角色权限模块编号
	 */
	ROLE("01010000"),
	
	/**
	 * 城市
	 */
	CITY("10990000"),

	/**
	 * 管理员管理
	 */
	ROLE_MANAGER("01020000"),

	/**
	 * 内容：站点模块编号
	 */
	APP("02010000"),

	/**
	 * 内容：栏目模块编号
	 */
	CMS_COLUMN("02990000"),
	
	/**
	 * 学校
	 */
	SCHOOL("10980000");
	
	
	/**
	 * 设置modelCode的常量
	 * @param code 常量
	 */
	ModelCode(String code) {
		this.code = code;
	}

	private String code;

	/**
	 * 返回该modelCode常量的字符串表示
	 * @return 字符串
	 */
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return code;
	}

	/**
	 * 返回该modelCode常量的整型表示
	 * @return 整型
	 */
	public int toInt() {
		// TODO Auto-generated method stub
		return Integer.parseInt(code);
	}

}