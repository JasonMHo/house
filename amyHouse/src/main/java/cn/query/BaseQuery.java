package cn.query;

import cn.common.Constant;
/*
 * @ Copyright (c) Create by JASON  Date:2018-03-13  All rights reserved.
 *
 * @ class description：查询信息的基类
 *
 */

public class BaseQuery {
	
	private Integer pageNo = 1;
	private Integer pageSize = Constant.PAGA_SIZE;
	
	private Integer firstResult;	//起始位置
	private Integer maxResult;		//显示的条数
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getFirstResult() {
		firstResult = (pageNo - 1) * pageSize;
		return firstResult;
	}
	public Integer getMaxResult() {
		maxResult = pageSize;
		return maxResult;
	}

}
