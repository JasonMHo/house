package cn.service;

import java.util.List;

import cn.entity.TDistrict;
import cn.entity.TStreet;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   区service接口
 *
 */
public interface DistrictService {
	
	public List<TDistrict> queryAllDistrict();
	
	public List<TStreet> getStreetsByDistrictId(Long districtId);

}
