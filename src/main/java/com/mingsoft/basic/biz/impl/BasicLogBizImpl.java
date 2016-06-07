package com.mingsoft.basic.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mingsoft.base.biz.impl.BaseBizImpl;
import com.mingsoft.base.dao.IBaseDao;
import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.basic.biz.IBasicLogBiz;
import com.mingsoft.basic.dao.IBasicLogDao;
import com.mingsoft.basic.entity.BasicLogEntity;
import com.mingsoft.util.PageUtil;

@Service("basicLogBiz")
public class BasicLogBizImpl extends BaseBizImpl implements IBasicLogBiz {

	/**
	 * 声明IAppDao持久化层
	 */
	@Autowired
	private IBasicLogDao basicLogDao;

	@Override
	protected IBaseDao getDao() {
		return basicLogDao;
	}

	@Override
	public List<BaseEntity> query(BasicLogEntity basicLog,PageUtil page,String orderBy,boolean order) {
		// TODO Auto-generated method stub
		return basicLogDao.query(basicLog, page.getPageNo(), page.getPageSize(), orderBy, order);
	}

	@Override
	public int count(BasicLogEntity basicLog) {
		// TODO Auto-generated method stub
		return basicLogDao.count(basicLog);
	}


}
