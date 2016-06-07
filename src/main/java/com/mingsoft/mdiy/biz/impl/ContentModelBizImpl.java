package com.mingsoft.mdiy.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mingsoft.base.biz.impl.BaseBizImpl;
import com.mingsoft.base.dao.IBaseDao;
import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.mdiy.dao.IContentModelDao;
import com.mingsoft.mdiy.dao.IContentModelFieldDao;
import com.mingsoft.mdiy.entity.ContentModelEntity;
import com.mingsoft.mdiy.biz.IContentModelBiz;
import com.mingsoft.util.PageUtil;
@Service("contentModelBiz")
public class ContentModelBizImpl extends BaseBizImpl implements IContentModelBiz{
	
	/**
	 * 内容模型管理业务层
	 */
	private IContentModelDao contentModelDao;
	
	/**
	 * 注入模型字段持久层接口
	 */
	private IContentModelFieldDao fieldDao;
	
	/**
	 * 获取内容模型业务层
	 * @return 内容模型业务层
	 */
	public IContentModelDao getContentModelDao() {
		return contentModelDao;
	}

	/**
	 * 设置内容模型业务层
	 * @param contentModelDao 内容模型业务层
	 */
	@Autowired
	public void setContentModelDao(IContentModelDao contentModelDao) {
		this.contentModelDao = contentModelDao;
	}

	
	/**
	 * 根据内容模型的表名查找实体
	 */
	@Override
	public ContentModelEntity getContentModelByTableName(String cmTableName) {
		// TODO Auto-generated method stub
		return (ContentModelEntity) contentModelDao.getContentModelByTableName(cmTableName);
	}
	
	/**
	 * 获取内容模型的dao
	 */
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return contentModelDao;
	}
	
	/**
	 * 根据管理员Id查找内容模型的总数
	 * @param cmManagerId 管理员id
	 * @return 记录总数
	 */
	@Override
	public int getContentModelByManagerId(int cmManagerId) {
		// TODO Auto-generated method stub
		return contentModelDao.getContentModelByManagerId(cmManagerId);
	}
	
	/**
	 * 分页查询指定管理员的表单内容模型
	 * @param entity 实体
	 * @param page Map对象
	 * @param order 排序方式,true:asc;fales:desc
	 * @param cmManagerId 管理员id
	 * @return
	 */
	@Override
	public List<BaseEntity> queryPageByManagerId(PageUtil page,
			String orderBy, boolean order, int cmManagerId) {
		// TODO Auto-generated method stub
		return contentModelDao.queryPageByManagerId(page.getPageNo(), page.getPageSize(), orderBy, order, cmManagerId);
	}
	
	/**
	 * 根据管理员id查找内容模型实体
	 * @param cmManagerId
	 * @return
	 */
	@Override
	public List<BaseEntity> queryByManagerId(int cmManagerId) {
		// TODO Auto-generated method stub
		return contentModelDao.queryByManagerId(cmManagerId);
	}
	
	/**
	 * 根据模型Id把模型及其相关数据清除
	 * @param cmId 模型ID
	 */
	@Override
	public void deleteAllByCmId(int cmId) {
		// TODO Auto-generated method stub
		//获取模型实体
		ContentModelEntity contentModel = (ContentModelEntity) this.contentModelDao.getEntity(cmId);
		//删除模型对应的表
		this.contentModelDao.dropTable(contentModel.getCmTableName());
		//删除模型下的所有的字段
		this.fieldDao.deleteEntityByFieldCmid(cmId);
		//删除模型实体
		this.contentModelDao.deleteEntity(cmId);
	}

	@Override
	public void deleteAllByCmId(int[] cmId) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		for (int i=0;i<cmId.length;i++) {
			//获取模型实体
			ContentModelEntity contentModel = (ContentModelEntity) this.contentModelDao.getEntity(cmId[i]);
			//删除模型对应的表
			try {
			this.contentModelDao.dropTable(contentModel.getCmTableName());
			} catch(Exception e){}
			//删除模型下的所有的字段
			//this.fieldDao.deleteEntityByFieldCmid(cmId[i]);
			//删除模型实体
			this.contentModelDao.deleteEntity(cmId[i]);				
		}
	
	}
	
	
	
}
