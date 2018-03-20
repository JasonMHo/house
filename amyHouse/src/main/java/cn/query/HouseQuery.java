package cn.query;
/*
 * @ Copyright (c) Create by JASON  Date:2018-03-13  All rights reserved.
 *
 * @ class description：根据查询房子时的条件封装成的查询对象
 *
 */
public class HouseQuery extends BaseQuery{
	
	private Long typeId;
	private String title;
	private Integer priceType;	//1:0-1000  2:1000-2000 3:2000以上
	private Integer floorageType;	//1:60以下  2:60-100 3:100-150 4:150以上
	private Long districtId;
	private Long streetId;
	private String picUrl;//图片路径
	
	
	
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getPriceType() {
		return priceType;
	}
	public void setPriceType(Integer priceType) {
		this.priceType = priceType;
	}
	public Integer getFloorageType() {
		return floorageType;
	}
	public void setFloorageType(Integer floorageType) {
		this.floorageType = floorageType;
	}
	public Long getDistrictId() {
		return districtId;
	}
	public void setDistrictId(Long districtId) {
		this.districtId = districtId;
	}
	public Long getStreetId() {
		return streetId;
	}
	public void setStreetId(Long streetId) {
		this.streetId = streetId;
	}

}


