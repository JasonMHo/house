package cn.dao;

import java.util.List;

import cn.entity.TStreet;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-08  All rights reserved.
 *
 * @ class description：街道接口
 *
 */
public interface StreetDao {
	
	List<TStreet> getStreetsByDistrictId(long id);

}


