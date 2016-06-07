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

import java.util.ResourceBundle;
import org.springframework.context.ApplicationContext;

/**
 * 基础枚举类
 * 
 * @author 王天培QQ:78750478
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
public final class Const {
	/**
	 * action层对应的国际化资源文件
	 */
	public final static ResourceBundle RESOURCES = ResourceBundle.getBundle("com.mingsoft.basic.resources.resources");

	/**
	 * 默认系统管理员所对应的角色ID为1
	 */
	public final static int DEFAULT_SYSTEM_MANGER_ROLE_ID = 1;

	/**
	 * 默认站点管理员所对应的角色ID为2
	 */
	public final static int DEFAULT_WEBSITE_MANGER_ROLE_ID = 2;

	/**
	 * 默认CMS所对应的模块ID为1
	 */
	public final static int DEFAULT_CMS_MODEL_ID = 1;

	/**
	 * 顶级栏目的父栏目ID为0
	 */
	public final static int COLUMN_TOP_CATEGORY_ID = 0;

	/**
	 * 后台文件存放文件夹
	 */
	public final static String VIEW = "/manager";

	/**
	 * 后台管理路径
	 */
	public final static String MANAVER = "/manager";


}