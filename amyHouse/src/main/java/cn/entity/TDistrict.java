package cn.entity;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   区的实体类
 *
 */
public class TDistrict implements java.io.Serializable {
	private static final long serialVersionUID = -772977775295966421L;
	private Long id;
	private String name;
	

	public TDistrict() {
	}

	public TDistrict(String name) {
		this.name = name;
	}

	
	public TDistrict(Long id, String name) {
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}