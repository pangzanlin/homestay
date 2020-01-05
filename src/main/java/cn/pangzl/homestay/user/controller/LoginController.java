package cn.pangzl.homestay.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pangzl.homestay.result.Result;
import cn.pangzl.homestay.user.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/to_login")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("/do_login")
	@ResponseBody
	public Result<Integer> doLogin(HttpServletRequest request, Long phone, String password) {	
		return Result.success(userService.doLogin(request, phone, password));
	}
	
}
