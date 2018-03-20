package cn.common;

import java.util.List;

import org.springframework.stereotype.Service;


/*
 * @ Copyright (c) Create by JASON  Date:2018-03-09  All rights reserved.
 *
 * @ class description：分页工具类
 * 
 *    计算总页数，==总数量/每页显示的数量
 *   使用步骤：1，在数据库里查List<T>总数量
 *           2.设置List<T>总数量时同时计算并设置页面数量
 *           3.总页数
 *
 */
@Service("pages")
public class Pages<T> {
	
	private int totalPages = 1;//总页数
	private int pageNo = 1;//当前页码数

	private int totalInfos;//总信息数
	private int pageSize;//一个页面显示几条信息
	
	private List<T> contentList;//一个页面显示的信息列表
	
	
	
	public List<T> getContentList() {
		return contentList;
	}
	public void setContentList(List<T> contentList) {
		this.contentList = contentList;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		if(pageNo > 0){
			this.pageNo = pageNo;
		}
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize > 0) {
			this.pageSize = pageSize;
		}
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalInfos() {
		return totalInfos;
	}
	//在设置总信息数的时候，就可以设置好总页面数
	public void setTotalInfos(int totalInfos) {
		if(totalInfos >= 0){
			this.totalInfos = totalInfos;
		}
		//在查出总信息数的时候，设置总页面数
		if(this.totalInfos % this.pageSize == 0){
			this.totalPages = this.totalInfos / this.pageSize;
		}else if(this.totalInfos % this.pageSize != 0){
			this.totalPages = this.totalInfos / this.pageSize + 1;
		}else{
			this.totalPages = 0;
		}
	}

}


