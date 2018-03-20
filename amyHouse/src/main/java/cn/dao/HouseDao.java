package cn.dao;

import java.util.List;


import cn.entity.THouse;
import cn.query.HouseQuery;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-08  All rights reserved.
 *
 * @ class description：房子接口
 *
 */
public interface HouseDao {
	
	public List<THouse> getAllHouse();
	public int getHouseTotalCount();
	
	public THouse getHouseById(long id);
	
	public int addHouse(THouse house);
	
	public int deleteHouse(long id);
	
	public int updateHouse(THouse house);
	
	//分页查询 - 获取总记录数方法
	public int getHouseTotalCountByPage(HouseQuery houseQuery);
	
	//分页查询 - 获取数据集合方法
	public List<THouse> getHousesPage(HouseQuery houseQuery);
	
	
	public boolean findHouse(THouse house);
	

}


