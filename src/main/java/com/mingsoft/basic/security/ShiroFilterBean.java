package com.mingsoft.basic.security;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;

import com.mingsoft.basic.action.web.LoginAction;
import com.mingsoft.basic.constant.Const;

public class ShiroFilterBean extends ShiroFilterFactoryBean {

	
	public ShiroFilterBean() {
		super.setLoginUrl(LoginAction.ADMIN_LOGIN_PATH);
		super.setFilterChainDefinitions("/"+Const.MANAVER+"/**=authc,perms");
	}
	
}