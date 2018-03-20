package cn.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.entity.TUser;
import cn.service.UserService;


@Controller//注解标注该类是一个控制器类
public class LoginController{
	
	@Resource
	@Qualifier("userService")
	private UserService userService;


	//登录 - 通过对象接收请求的参数值
	@RequestMapping(value="/login")
	public String login(TUser loginUser,Model model, HttpServletRequest request,HttpServletResponse response) 
			throws Exception {
		//调用service方法处理，验证用户是不是存在 
		TUser user = userService.login(loginUser);
		if(null != user){
			//把登录的用户保存在session里
			request.getSession().setAttribute("user", user);
			//重定向到list请求
			return "redirect:/house/list";	
		}else{
			//登录失败
			//将错误信息存储到作用域
			model.addAttribute("loginMsg", "用户名或密码错误");	//模型
			//页面跳转回到登录 - 转发
			//视图名 默认转发
			
			return "forward:/login.jsp";
		}
	}
	
	//退出登录
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request){
		
			request.getSession().removeAttribute("user");
			//重定向到list请求
			return "redirect:/house/list";	
	}
	
}
