package cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.dao.UserDao;
import cn.entity.TUser;
import cn.service.UserService;
/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *
 * @ class description：用户service的实现类
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	
	
	@Resource
	private UserDao userDao;

	@Override//用户是不是已存在 
	public boolean findUser(TUser user) {
		return userDao.findUser(user);
	}

	@Override
	public TUser login(TUser user) {
		return  userDao.logins(user);
	}

	@Override
	public int addUser(TUser user) {
		return userDao.addUser(user);
	}

	@Override
	public List<TUser> getAllUsers() {
		return userDao.getAllUsers();
	}


	
}
