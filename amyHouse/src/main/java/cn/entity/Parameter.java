package cn.entity;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 * 使用单例模式，读取xml文件时，做为参数的一个类
 */
public class Parameter implements java.io.Serializable{

	private String key;
	private String value;
	
	public Parameter(String key, String value) {
		super();
		this.key = key;
		this.value = value;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
