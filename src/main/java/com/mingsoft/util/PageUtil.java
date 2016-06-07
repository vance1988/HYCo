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

package com.mingsoft.util;

/**
 * 分页通用模块
 * @author 王天培QQ:78750478
 * @version 
 * 版本号：100-000-000<br/>
 * 创建日期：2012-03-15<br/>
 * 历史修订：<br/>
 */
public class PageUtil {

	/**
	 * 首页
	 */
	protected int index;

	/**
	 * 首页连接地址
	 */
	protected String indexUrl;

	/**
	 * 上一页
	 */
	protected int previous;

	/**
	 * 上一页连接地址
	 */
	protected String previousUrl;

	/**
	 * 下一页
	 */
	protected int next;

	/**
	 * 下一页连接地址
	 */
	protected String nextUrl;

	/**
	 * 最后一页
	 */
	protected int last;

	/**
	 * 最后一页连接地址
	 */
	protected String lastUrl;
	/**
	 * 总记录数
	 */
	protected int recordCount;

	/**
	 * 连接地址，带http格式
	 */
	protected String linkUrl;

	/**
	 * 当前页码
	 */
	protected int pageNo;

	/**
	 * 保存当前页码数
	 * @param pageNo 当前页数
	 */
	public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    /**
	 * 总页数
	 */
	protected int pageCount;

	/**
	 * 一页显示数量
	 */
	protected int pageSize = 10;
	
	/**
	 * 连接地址是否有参数 false:没有 true:有
	 */
	private boolean hasParams;
	
	
	/**
	 * 获取总页数
	 * @return pageCount 总页数
	 */
	public int getPageCount() {
		return pageCount;
	}

	/**
	 * 保存总页数
	 * @param pageCount 总页数
	 */
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	/**
	 * 只提供给数据查询用。例如导出数据的记录现在，pageSize=9999,表示查询9999条记录，没有分页效果
	 * @param pageSize
	 */
	public PageUtil(int pageSize) {
		this.pageSize = pageSize;
		this.pageNo =0;
	}
	/**
	 * 初始化分页实体类,默认每页10条
	 * 
	 * @param pageNo
	 *            当前页码默认调用BaseAction的getPageNo()方法
	 * @param recordCount
	 *            总记录数
	 * @param linkUrl
	 *            分页连接地址
	 */
	public PageUtil(int pageNo, int recordCount, String linkUrl) {
		this.pageNo = pageNo-1;
		this.recordCount = recordCount;
		this.linkUrl = linkUrl==null?"":linkUrl;
		
		calculatePageCount();
	
	}
	
	/**
	 * 初始化分页实体类,默认每页10条
	 * 
	 * @param pageNo
	 *            当前页码默认调用BaseAction的getPageNo()方法
	 * @param recordCount
	 *            总记录数
	 */
	public PageUtil(int pageNo, int recordCount) {
		this.pageNo = pageNo-1;
		this.recordCount = recordCount;
		calculatePageCount();
	}

	/**
	 * 初始化分页实体类
	 * 
	 * @param pageNo
	 *            当前页码
	 * @param pageSize
	 * 			  一页显示的数量           
	 * @param recordCount
	 *            总记录数
	 * @param linkUrl
	 *            分页连接地址
	 */
	public PageUtil(int pageNo, int pageSize, int recordCount, String linkUrl) {
		this(pageNo,recordCount,linkUrl);
		this.pageSize = pageSize;
		calculatePageCount();
		
		if (this.pageNo+1>this.pageCount && this.pageCount>1) {
			this.pageNo = this.pageCount-1;
		}
	}
	
	/**
	 * 计算总页数
	 */
	private void calculatePageCount() {
		//判读连接地址是否有参数
		if (linkUrl.indexOf("?")>0) {
			hasParams = true;
		}
		//计算总页数
		if (this.recordCount==0) {
			pageCount = 0;
		} else {
			//判断是否有余数
			if(recordCount % pageSize==0){
				pageCount = recordCount / pageSize;
			} else {
				pageCount = recordCount / pageSize + 1;
			}
		}
		
		
	}
	/**
	 * 获取主页页码
	 * @return 主页页码数
	 */
	public int getIndex() {
		return index;
	}

	/**
	 * 保存主页页码
	 * @param index 主页页码数
	 */
	public void setIndex(int index) {
		this.index = index;
	}

	/**
	 * 获取上一页页码数
	 * @return 上一页页码数
	 */
	public int getPrevious() {
		return previous;
	}

	/**
	 * 保存上一页页码数
	 * @param previous 上一页页码数
	 */
	public void setPrevious(int previous) {
		this.previous = previous;
	}

	/**
	 * 获取下一页页码数
	 * @return 下一页的页码
	 */
	public int getNext() {
		return next;
	}

	/**
	 * 保存下一页的页码
	 * @param next 下一页的页码数
	 */
	public void setNext(int next) {
		this.next = next;
	}

	/**
	 * 获取末页的页码数
	 * @return 末页的页码数
	 */
	public int getLast() {
		return last;
	}

	
	/**
	 * 保存末页的页码数
	 * @param last 末页的页码
	 */
	public void setLast(int last) {
		this.last = last;
	}

	/**
	 * 获取总记录数
	 * @return 总记录数
	 */
	public int getRecordCound() {
		return recordCount;
	}
	
	/**
	 * 获取当前页码
	 * @return 返回当前页码
	 */
	public int getPageNo() {
		return pageNo;
	}
	
	/**
	 * 获取首页链接地址
	 * @return 返回首页链接地址
	 */
	public String getIndexUrl() {
		if (pageNo == 0) {
			indexUrl = "#";
		} else {
			indexUrl = this.linkUrl + (hasParams?"&":"?") +"pageNo=1";
		}
		return indexUrl;
	}

	/**
	 * 获取上一页的连接地址
	 * @return 返回上一页地址
	 */
	public String getPreviousUrl() {
		if (pageNo == 0) {
			previousUrl = "#";
		} else {
			previousUrl = this.linkUrl + (hasParams?"&":"?")+"pageNo=" + (pageNo);
		}
		return previousUrl;
	}
	
	/**
	 * 获取下一页的连接地址
	 * @return 返回下一页地址
	 */
	public String getNextUrl() {
		if (pageNo == pageCount) {
			nextUrl = "#";
		} else {
			if (pageNo+2>pageCount) {
				nextUrl = this.linkUrl + (hasParams?"&":"?") +"pageNo=" + pageCount;
			} else {
				nextUrl = this.linkUrl + (hasParams?"&":"?") +"pageNo=" + (pageNo+2);
			}
		}
		return nextUrl;
	}


	/**
	 * 获取最后一页
	 * @return  返回最后一页
	 * http://weburl/?pageNo
	 */
	public String getLastUrl() {
		if (pageNo == pageCount) {
			lastUrl = "#";
		} else {
			lastUrl = this.linkUrl + (hasParams?"&":"?") +"pageNo=" + pageCount;
		}
		return lastUrl;
	}

	/**
	 * 获取分页数量
	 * @return 分页数量
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 获取链接地址
	 * @return 链接地址
	 */
	public String getLinkUrl() {
		return linkUrl+(hasParams?"&":"?");
	}

	/**
	 * 保存链接地址
	 * @param linkUrl 链接地址
	 */
	public void setLinkUrl(String linkUrl) {
		
		this.linkUrl = linkUrl;
	}
	
	/**
	 * 测试主方法
	 * @param args 主方法形参
	 */
	public static void main(String[] args) {
		String url = "http://localhost/mswx/admin/hotel/listHotel.do?1=1";
		System.out.println(url.indexOf("?"));
	}
}