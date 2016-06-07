package com.mingsoft.mdiy.constant.e;

import java.util.HashMap;
import java.util.Map;

import com.mingsoft.base.constant.e.BaseEnum;

/**
 * 自定义表单类型
 * 
 * @author 王天培QQ:78750478
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
public enum DiyFormFieldEnum implements BaseEnum {
	TEXT(1, "字符"), 
	DATE(2, "日期"),

	/**
	 * HTML
	 */
	TEXTAREA(3, "文本"),

	/**
	 * 整型
	 */
	INT(4, "整型"),

	/**
	 * 小數
	 */
	FLOAT(5, "小数");

	/**
	 * 构造方法
	 * 
	 * @param code
	 *            传入的枚举类型
	 */
	DiyFormFieldEnum(int id, Object code) {
		this.code = code;
		this.id = id;
	}

	/**
	 * 枚举类型
	 */
	private Object code;

	private int id;

	@Override
	public int toInt() {
		// TODO Auto-generated method stub
		return id;

	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return code.toString();

	}

	public static Map toMap() {
		Map<String, String> map = new HashMap<String, String>();
		for (DiyFormFieldEnum e : DiyFormFieldEnum.values()) {
			map.put(e.toInt() + "", e.toString());
		}
		return map;
	}

	public static DiyFormFieldEnum get(int id) {
		for (DiyFormFieldEnum e : DiyFormFieldEnum.values()) {
			if (e.toInt() == id) {
				return e;
			}
		}
		return null;
	}

	public static DiyFormFieldEnum get(String str) {
		for (DiyFormFieldEnum e : DiyFormFieldEnum.values()) {
			if (e.toString().equals(str)) {
				return e;
			}
		}
		return null;
	}

}
