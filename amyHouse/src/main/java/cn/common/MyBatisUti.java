package cn.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-08  All rights reserved.
 *
 * @ class description：测试用
 *    使用单例模式，创建唯一的对象，
 *    单例四步骤：1、私有静态变量 
 *             2、私有构造 
 *             3、公有静态方法，获取实例对象 
 *             4、公有业务方法
 *             
 *             session是操作增、删、改、查的对象，要获取到这个对象，只用 MyBatisUti.getInstance().getMySession();
 *
 */  
public class MyBatisUti {
	
	//1、私有静态变量
	private static MyBatisUti myBatisUtil;
	private SqlSessionFactory factory ;
	
	//2、私有构造,在构造时，同时创建
	private MyBatisUti(){
		try {
			//读取 MyBatisr 的配置文件
			InputStream is = Resources.getResourceAsStream("myBatisConfig.xml");
			 factory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//3、公有静态方法，获取实例对象 
	public static synchronized MyBatisUti getInstance(){
		if(null == myBatisUtil){
			myBatisUtil = new MyBatisUti();
		}
		return myBatisUtil;
	}
	//4、公有业务方法
	public SqlSession getMySession(){
		return factory.openSession();
	}
	

}


