package cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.common.Pages;
import cn.dao.HouseDao;
import cn.entity.THouse;
import cn.query.HouseQuery;
import cn.service.HouseService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-08  All rights reserved.
 *
 * @ class description：房子service的实现类
 *
 */
@Service("houseService")
public class HouseServiceImpl implements HouseService{

	@Resource
	private HouseDao houseDao;
	
	@Resource
	@Qualifier("pages")
	private Pages<THouse> pages;
	
	@Override
	public List<THouse> getAllHouse() {
		return houseDao.getAllHouse();
	}
	
	@Override
	public int getHouseTotalCount() {
		return houseDao.getHouseTotalCount();
	}
	
	@Override
	public THouse getHouseById(long id){
		return houseDao.getHouseById(id);
	}
	
	@Override
	public int addHouse(THouse house){
		return  houseDao.addHouse(house);
	}
	
	@Override
	public int deleteHouse(long id){
		return houseDao.deleteHouse(id);
	}
	

	@Override
	public Pages<THouse> getHousePages(HouseQuery houseQuery) {
		
		//将分页的五个数据封装成 pages 对象
		pages.setPageSize(houseQuery.getPageSize());
		pages.setPageNo(houseQuery.getPageNo());
		pages.setTotalInfos(houseDao.getHouseTotalCountByPage(houseQuery));
		pages.setContentList(houseDao.getHousesPage(houseQuery));

		return pages;
	}

	@Override
	public boolean findHouse(THouse house) {
		return houseDao.findHouse(house);
	}

	@Override
	public int updateHouse(THouse house) {
		return houseDao.updateHouse(house);
	}


}


