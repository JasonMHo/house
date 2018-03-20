package cn.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.dao.PicDao;
import cn.entity.TPic;
import cn.service.PicService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *
 * @ class description：图片service的实现类
 *
 */
@Service("picService")
public class PicServiceImpl implements PicService {
	@Resource
	private PicDao picDao;

	@Override
	public int addPic(TPic pic) {
		return picDao.addPic(pic);
	}

}


