package cn.entity;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   街道的实体类
 *
 */
public class TStreet implements java.io.Serializable {

	private static final long serialVersionUID = -3006981966296309344L;
	private Long id;
	private Long districtid;
	private String name;

	public TStreet() {
	}

	public TStreet(String name) {
		super();
		this.name = name;
	}

	public TStreet(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDistrictid() {
		return districtid;
	}

	public void setDistrictid(Long districtid) {
		this.districtid = districtid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}