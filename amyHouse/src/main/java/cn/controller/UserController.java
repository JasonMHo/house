package cn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.entity.TUser;
import cn.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	
	@Resource()
	@Qualifier("userService")
	private UserService userService;

	@RequestMapping(value="/list")
	public String list(Model model){
		
		List<TUser> users = userService.getAllUsers();
		for(TUser user:users){
			System.out.println(user.getRealName()+"\t"+user.getUserName());
		}
		model.addAttribute("users", users);
		//页面跳转 - 返回逻辑视图名
		return "userList";
	}
	
	@RequestMapping(value="/add")
	public String add(Model model, TUser user){
		//接收请求参数 user
		//调用service方法查询用户是否存在，不存在就可以添加，存在就返注册页面重新注册
		
		if(userService.findUser(user)){
			model.addAttribute("registerMsg", "此用户已存在，请重新注册");
		}else{
			userService.addUser(user);
			model.addAttribute("registerMsg", "注册成功,请登录");
			//将查询结果存储到model
			model.addAttribute("user", "user");
		}
		//页面跳转 - 返回逻辑视图名
		return "forward:/login.jsp";
	}
	
}
