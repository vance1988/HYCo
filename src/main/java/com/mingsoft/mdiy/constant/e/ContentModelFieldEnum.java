package com.mingsoft.mdiy.constant.e;

import java.util.HashMap;
import java.util.Map;

import com.mingsoft.base.constant.e.BaseEnum;

/**
 * 自定义模型类型
 * 
 * @author 猪
 * @version 版本号：100-000-000<br/>
 *          创建日期：2012-03-15<br/>
 *          历史修订：<br/>
 */
public enum ContentModelFieldEnum implements BaseEnum {
	TEXT(1, "单行"), TEXTAREA(2, "多行"), HTML(3, "html"), INT(4, "整型"), FLOAT(5, "小数"), DATE(6, "日期"), IMAGE(7,
			"图片"), ATTACH(8, "附件"), OPTION(9, "下拉框"), RADIO(10, "单选"), CHECKBOX(11, "多选");

	/**
	 * 构造方法
	 * 
	 * @param code
	 *            传入的枚举类型
	 */
	ContentModelFieldEnum(int id, String text) {
		this.id = id;
		this.text = text;
	}

	/**
	 * 枚举类型
	 */
	private int id;

	private String text;

	@Override
	public int toInt() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return text;
	}

	public static Map toMap() {
		Map<String, String> map = new HashMap<String, String>();
		for (ContentModelFieldEnum e : ContentModelFieldEnum.values()) {
			map.put(e.toInt() + "", e.toString());
		}
		return map;
	}

	public static ContentModelFieldEnum get(int id) {
		for (ContentModelFieldEnum e : ContentModelFieldEnum.values()) {
			if (e.toInt() == id) {
				return e;
			}
		}
		return null;
	}

	public static ContentModelFieldEnum get(String str) {
		for (ContentModelFieldEnum e : ContentModelFieldEnum.values()) {
			if (e.toString().equals(str)) {
				return e;
			}
		}
		return null;
	}
}
