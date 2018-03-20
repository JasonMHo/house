package cn.service;

import java.util.List;

import cn.entity.TUser;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-17  All rights reserved.
 *   用户service接口
 *
 */
public interface UserService {

	public boolean findUser(TUser regUser);//查询用户是不是已存在
	
	public TUser login(TUser user);
	
	public int addUser(TUser user);//添加用户
	
	public List<TUser> getAllUsers();
}
