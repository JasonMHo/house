package cn.entity;

import java.util.Date;
/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   房子的实体类
 *
 */

public class THouse implements java.io.Serializable {
	private static final long serialVersionUID = -6811466740095854772L;
	private Long id;
	private Long userid;
	private Long typeid;
	private Long streetid;
	private String title;
	private String description;
	private Double price;
	private Date pubdate;
	private Date adddate;
	private Double floorage;
	private String contact;
	
    private TType ttype;
    private TUser user;
    private TDistrict district;
    private TStreet street;
    private TPic picture ;


	public TPic getPicture() {
		return picture;
	}

	public void setPicture(TPic picture) {
		this.picture = picture;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public TDistrict getDistrict() {
		return district;
	}

	public void setDistrict(TDistrict district) {
		this.district = district;
	}

	public TStreet getStreet() {
		return street;
	}

	public void setStreet(TStreet street) {
		this.street = street;
	}

	public TType getTtype() {
		return ttype;
	}

	public void setTtype(TType ttype) {
		this.ttype = ttype;
	}

	public THouse() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Long getTypeid() {
		return this.typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}

	public Long getStreetid() {
		return this.streetid;
	}

	public void setStreetid(Long streetid) {
		this.streetid = streetid;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Date getAdddate() {
		return this.adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

	public Double getFloorage() {
		return this.floorage;
	}

	public void setFloorage(Double floorage) {
		this.floorage = floorage;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}