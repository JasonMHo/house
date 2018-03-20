package cn.service;

import java.util.List;

import cn.common.Pages;
import cn.entity.THouse;
import cn.query.HouseQuery;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   房子service接口
 *
 */
public interface HouseService {
	
	List<THouse> getAllHouse();
	public int getHouseTotalCount();
	
	public THouse getHouseById(long id);
	
	public int addHouse(THouse house);
	
	public int deleteHouse(long id);
	
	public int updateHouse(THouse house);
	
	//分页查询 - 获取分页信息
	public Pages<THouse> getHousePages(HouseQuery houseQuery);
	
	public boolean findHouse(THouse house);
	

}


