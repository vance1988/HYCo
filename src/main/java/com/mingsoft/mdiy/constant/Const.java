package com.mingsoft.mdiy.constant;

import java.util.ResourceBundle;
import org.springframework.context.ApplicationContext;


/**
 * 基础枚举类
 * @author 王天培QQ:78750478
 * @version 
 * 版本号：100-000-000<br/>
 * 创建日期：2012-03-15<br/>
 * 历史修订：<br/>
 */
public final class Const {
	/**
	 * action层对应的国际化资源文件
	 */
	public final static  ResourceBundle RESOURCES = ResourceBundle.getBundle("com.mingsoft.mdiy.resources.resources");
	public final static  ResourceBundle BASIC_ATTRIBUTE = ResourceBundle.getBundle("com.mingsoft.mdiy.resources.search_basic_attribute");
	public final static  ResourceBundle BASIC_FIELD = ResourceBundle.getBundle("com.mingsoft.mdiy.resources.search_basic_field");

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
}
