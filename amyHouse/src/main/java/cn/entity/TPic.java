package cn.entity;
/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   图片的实体类
 *
 */
public class TPic implements java.io.Serializable{
	private long id;
	private long houseid;
	private String title;
	private String url;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getHouseid() {
		return houseid;
	}
	public void setHouseid(long houseid) {
		this.houseid = houseid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	

}


