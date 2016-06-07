package com.mingsoft.mdiy.constant;

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
