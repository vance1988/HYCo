package com.mingsoft.basic.constant.e;


import com.mingsoft.base.constant.e.BaseEnum;

/**
 * cookie枚举类
 * @author 王天培QQ:78750478
 * @version 
 * 版本号：100-000-000<br/>
 * 创建日期：2012-03-15<br/>
 * 历史修订：<br/>
 */
public enum LogEnum implements BaseEnum{
	
	/**
	 * QQ登录保存当前用户点击地址的session
	 */
	MOBILE("移动端",1),
	PC("PC端",0);
	
	
	/**
	 * 设置CookieConst的常量
	 * @param attr 常量
	 */
	LogEnum(String attr,int id) {
		this.attr = attr;
		this.id = id;
	}
	
	private String attr;
	
	private int id;

	/**
	 * 返回该CookieConst常量的字符串表示
	 * @return 字符串
	 */
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return attr;
	}

	@Override
	public int toInt() {
		// TODO Auto-generated method stub
		return id;
	}
	
	
}
