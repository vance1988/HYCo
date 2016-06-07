/**
 * 
 */
package com.mingsoft.basic.action.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mingsoft.basic.action.BaseAction;
import com.mingsoft.basic.biz.IBasicBiz;
import com.mingsoft.basic.biz.IBasicLogBiz;
import com.mingsoft.basic.constant.e.CookieConstEnum;
import com.mingsoft.basic.constant.e.LogEnum;
import com.mingsoft.basic.entity.BasicEntity;
import com.mingsoft.basic.entity.BasicLogEntity;
import com.mingsoft.util.StringUtil;

/**
 * 
 * 
 * 
 * <p>
 * <b>铭飞科技</b>
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2014 - 2015
 * </p>
 * 
 * @author killfen
 * 
 *         <p>
 *         Comments:错误页面定义
 *         </p>
 * 
 *         <p>
 *         Create Date:2015-4-26
 *         </p>
 * 
 *         <p>
 *         Modification history:
 *         </p>
 */
@Controller("webBasicAction")
@RequestMapping("/basic/")
public class BasicAction extends BaseAction {

	/**
	 * 文章解析器
	 */
	@Autowired
	private IBasicBiz basicBiz;

	@Autowired
	private IBasicLogBiz basicLogBiz;

	/**
	 * 更新文章点击数
	 * 
	 * @param basicId
	 *            文章编号
	 *            <dt><span class="strong">返回</span></dt><br/>
	 *            {code:"模块编码",<br/>
	 *            result:"true｜false",<br/>
	 *            resultMsg:"错误信息",<br/>
	 *            resultData:"成功会返回最新点击数"<br/>
	 *            }
	 */
	@RequestMapping(value = "/{basicId}/hit")
	@ResponseBody
	public void hit(@PathVariable int basicId, HttpServletRequest request, HttpServletResponse response) {
		if (basicId <= 0) {
			this.outString(response, "document.write(0)");
			return;
		}
		// 获取文章实体
		BasicEntity basic = (BasicEntity) basicBiz.getEntity(basicId);
		// 判断文章是否存在
		if (basic == null) {
			this.outString(response, "document.write(0)");
			return;
		}

		// 判断该文章是否是改应用下
		if (basic.getBasicAppId() != this.getAppId(request)) {
			this.outString(response, "document.write(0)");
			return;
		}
		boolean isShow = this.getBoolean(request, "isShow");
		if (isShow) {
			this.outString(response, "document.write(" + basic.getBasicHit() + ")");
			return;
		}
		String str = this.getCookie(request, CookieConstEnum.BASIC_HIT);
		if (StringUtil.isBlank(str) || Integer.parseInt(str) != basicId) {
			// 更新点击量
			BasicLogEntity basicLog = new BasicLogEntity();
			basicLog.setBasicLogAppId(this.getAppId(request));
			basicLog.setBasicLogDatetime(new Date());
			basicLog.setBasicLogIp(this.getIp(request));
			basicLog.setBasicLogBasicId(basicId);
			if (this.isMobileDevice(request)) {
				basicLog.setBasicLogIsMobile(LogEnum.MOBILE.toInt());
			}
			int isHit = basicLogBiz.count(basicLog);
			if (isHit > 0) {
				this.outString(response, "document.write(" + basic.getBasicHit() + ")");
				return;
			}
			basicBiz.updateHit(basicId, basic.getBasicHit() + 1);
			basicLogBiz.saveEntity(basicLog);
			this.setCookie(request, response, CookieConstEnum.BASIC_HIT, basicId + "");
			this.outString(response, "document.write(" + (basic.getBasicHit() + 1) + ")");
		} else {
			this.outString(response, "document.write(" + basic.getBasicHit() + ")");
		}

	}
}
