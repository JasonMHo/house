package cn.dao;

import java.util.List;

import cn.entity.TUser;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-08  All rights reserved.
 *
 * @ class description：用户接口
 *
 */
public interface UserDao {
	
	public boolean findUser(TUser user);
	
	public int addUser(TUser user);
	
	public TUser logins(TUser user);
	
	public List<TUser> getAllUsers();

}


