/**
The MIT License (MIT) * Copyright (c) 2016 铭飞科技(mingsoft.net)

 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.mingsoft.basic.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mingsoft.base.biz.IBaseBiz;
import com.mingsoft.basic.entity.BasicEntity;
import com.mingsoft.util.PageUtil;

/**
 * 基本信息的业务层接口
 * @author 荣繁奎
 * @version 
 * 版本号：100-000-000<br/>
 * 创建日期：2012-03-15<br/>
 * 历史修订：<br/>
 */
public interface IBasicBiz extends IBaseBiz {
	
	
	/**
	 * 保存基本信息实体
	 * @param basic basic实体
	 * @return 返回编号，确认是否保存
	 */
    int saveBasic(BasicEntity basic);

    /**
     * 更新基本信息实体
     * @param basic basic实体
     */
    void updateBasic(BasicEntity basic);
    
    /**
     * 删除基本信息实体
     * @param basicId 信息编号
     */
    void deleteBasic(int basicId);
    
    /**
     * 获取基本信息实体
     * @param basicId 信息编号
     * @return 返回基本信息实体
     */
    BasicEntity getBasicEntity(int basicId);
    
    /**
     * 根据点击次数
     * @param basicId 信息编号
     * @param num null:为递增
     */
    void updateHit(int basicId,Integer num);
    
    
    /**
     * 根据分类统计总数
     * @param categoryId　分类编号
     * @return　返回统计总数
     */
    int count(int categoryId);
    
    /**
     * 根据分类与关键子统计总数
     * @param categoryId　分类编号
     * @param keyWord  关键字
     * @return 返回统计总数
     */
    int count(int categoryId,String keyWord);
    
    
    /**
     * 根据分类查询
     * @param categoryId 　分类编号
     * @return 返回信息实体集合
     */
    List<BasicEntity> query(int categoryId);
    
    /**
     * 根据分类与关键子统计总数
     * @param categoryId　分类编号
     * @param keyWord　关键字
     * @return　返回信息实体集合
     */
    List<BasicEntity> query(int categoryId,String keyWord);
    
    
    /**
     * 根据分类与关键子统计总数
     * @param appId　应用编号
     * @param categoryId　分类编号
     * @param keyWord　关键字
     * @param page　分页
     * @param modelId　模块编号
     *  @param where　条件
     * @return 返回信息实体集合
     */
    List<BasicEntity> query(Integer appId,Integer categoryId,String keyWord,PageUtil page,Integer modelId,Map where);
    
    /**
     * 获取当前文章basicId的上一篇与下一篇
     * @param basicId 当前文章
     * @return  返回信息实体集合 list.get(0):上一篇list.get(1): 下一篇
     */
    List<BasicEntity> getPreviousAndNext(int basicId);
    
    /**
     * 根据id集合删除
     * @param basicIds 基本信息实体id集合
     */
    void deletes(String[] basicIds);
}