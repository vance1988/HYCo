package com.mingsoft.mdiy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mingsoft.base.constant.e.TableEnum;
import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.basic.biz.IColumnBiz;
import com.mingsoft.basic.constant.Const;
import com.mingsoft.basic.entity.ColumnEntity;
import com.mingsoft.mdiy.constant.e.ContentModelFieldEnum;
import com.mingsoft.mdiy.entity.ContentModelEntity;
import com.mingsoft.mdiy.biz.IContentModelBiz;
import com.mingsoft.mdiy.biz.IContentModelFieldBiz;
import com.mingsoft.mdiy.entity.ContentModelFieldEntity;
import com.mingsoft.util.StringUtil;

/**
 * 
 * ms-basic 自定义模型字段
 * 
 * @author 会飞的猪
 * @version 版本号：<br/>
 *          创建日期：2016年1月15日<br/>
 *          历史修订：<br/>
 */
@Controller
@RequestMapping("/manager/mdiy/contentModel/contentModelField")
public class ContentModelFieldAction extends BaseAction {

	@Autowired
	private IContentModelFieldBiz contentModelFieldBiz;

	@Autowired
	private IContentModelBiz contentModelBiz;
	
	@Autowired
	private IColumnBiz columnBiz;

	/**
	 * 表单列表
	 * 
	 * @return 返回表单列表页面
	 */
	@RequestMapping("/{contentModelId}/list")
	public String list(@PathVariable int contentModelId, HttpServletRequest request, ModelMap model,
			HttpServletResponse response) {
		
		List list = contentModelFieldBiz.queryListByCmid(contentModelId);
		// 获取字段属性
		model.put("fieldTypes", ContentModelFieldEnum.toMap());
		model.put("contentModelId", contentModelId);
		model.addAttribute("contentModelFieldList", list);
		return Const.VIEW+"/mdiy/content_model/content_model_field_list";
	}

	/**
	 * 保存内容模型实体
	 * 
	 * @param contentModel
	 * @param response
	 */
	@RequestMapping("/save")
	@ResponseBody
	public void save(@ModelAttribute ContentModelFieldEntity field, HttpServletRequest request,
			HttpServletResponse response) {
		// 判断是否存在表单
		ContentModelEntity contentModel = (ContentModelEntity)contentModelBiz.getEntity(field.getFieldCmid());
		// 更新前判断数据是否合法
		if(!StringUtil.checkLength(field.getFieldTipsName(), 1,30)){
			this.outJson(response, null, false,getResString("err.length",this.getResString("content.model.field.tips.name"),"1","30"));
			return ;
		}
		if(!StringUtil.checkLength(field.getFieldFieldName(), 1,30)){
			this.outJson(response, null, false,getResString("err.length",this.getResString("content.model.field.column.ame"),"1","30"));
			return ;
		}
		
		if (contentModelFieldBiz.getEntityByCmId(field.getFieldCmid(),field.getFieldFieldName())!=null) {
			this.outJson(response, null, false,getResString("err.exist",this.getResString("content.model.field")));
			return;
		}
		
		contentModelFieldBiz.saveEntity(field);
		//动态的修改表结构
		//获取字段信息
		Map fileds = new HashMap();
		//压入字段名
		fileds.put("fieldName", field.getFieldFieldName());
		//字段的数据类型
		fileds.put("fieldType",field.getFieldColumnType());
		//字段的默认值
		fileds.put("default", field.getFieldDefault());
		
		contentModelFieldBiz.alterTable(contentModel.getCmTableName(), fileds,TableEnum.ALTER_ADD);
		this.outJson(response, null, true, null);
	}

	/**
	 * 删除表单类型
	 * 
	 * @param cmId
	 *            表单ID
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String fieldIds = request.getParameter("fieldId");
		if (!StringUtil.isBlank(fieldIds) && StringUtil.isIntegers(fieldIds.split(","))) {
			int[] ids = StringUtil.stringsToInts(fieldIds.split(","));
			for (int i=0;i<ids.length;i++) {
				//获取要删除的字段实体
				ContentModelFieldEntity field = (ContentModelFieldEntity) contentModelFieldBiz.getEntity(ids[i]);
				contentModelFieldBiz.deleteEntity(ids[i]);
				//获取内容模型实体
				ContentModelEntity contentModel = (ContentModelEntity) contentModelBiz.getEntity(field.getFieldCmid());
				if(contentModel != null){
					Map<String,Object> fields = new HashMap<String, Object>();
					// 要删除的字段名
					fields.put("fieldName",field.getFieldFieldName());
					//删除列
					contentModelFieldBiz.alterTable(contentModel.getCmTableName(),fields,TableEnum.ALTER_DROP);
				}
			}
			this.outJson(response, true);
		}
	}

	/**
	 * 编辑表单
	 * 
	 * @param cmId
	 *            表单ID
	 * @return 编辑表单页面
	 */
	@RequestMapping("/{filedId}/edit")
	@ResponseBody
	public void edit(@PathVariable int filedId,HttpServletResponse response) {
		// 获取表单实体
		ContentModelFieldEntity contentModelField = (ContentModelFieldEntity) contentModelFieldBiz.getEntity(filedId);
		this.outJson(response, contentModelField);
	}

	/**
	 * 更新内容模型实体
	 * 
	 * @param contentModel
	 *            内容模型实体
	 * @param request
	 * @param response
	 */
	@RequestMapping("/update")
	@ResponseBody
	public void update(@ModelAttribute ContentModelFieldEntity contentModelFieldEntity, HttpServletRequest request,
			HttpServletResponse response) {
		contentModelFieldBiz.updateEntity(contentModelFieldEntity);
		this.outJson(response, true);
	}
	
	/**
	 * 返回cms模块的自定义模型的html页面（适用于cms模块）
	 * 
	 * @param columnId
	 * @param model
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/{columnId}/queryField")
	public String queryField(@PathVariable int columnId, ModelMap model, HttpServletRequest request) {
		// 获取栏目信息
		ColumnEntity column = (ColumnEntity) columnBiz.getEntity(columnId);
		if (column != null) {
			// 获取表单类型的id
			int fieldCmid = column.getColumnContentModelId();
			// 根据表单类型id查找出所有的字段信息
			List<BaseEntity> listField = contentModelFieldBiz.queryListByCmid(fieldCmid);
			int basicId = this.getInt(request, "basicId");

			if (basicId != 0) {
				// 根据表单id查找内容模型
				ContentModelEntity contentModel = (ContentModelEntity) contentModelBiz.getEntity(fieldCmid);
				// 判断内容模型是否存在
				if (contentModel != null) {
					// 遍历所有的字段实体,得到字段名列表信息
					List<String> listFieldName = new ArrayList<String>();

					for (int i = 0; i < listField.size(); i++) {
						ContentModelFieldEntity field = (ContentModelFieldEntity) listField.get(i);
						listFieldName.add(field.getFieldFieldName());
					}
					// 组织where条件
					Map<String, Integer> where = new HashMap<String, Integer>();
					where.put("basicId", basicId);
					// 获取各字段的值
					List fieldLists = contentModelFieldBiz.queryBySQL(contentModel.getCmTableName(), listFieldName, where);
					if (fieldLists != null && fieldLists.size() > 0) {
						Map filedValue = (Map) fieldLists.get(0);
						model.addAttribute("filedValue", filedValue);
					}
				}
			}
			model.addAttribute("listField", listField);
			model.addAttribute("appId", this.getAppId(request));
		}
		return Const.VIEW+"/mdiy/content_model/content_model_field";
	}
}
