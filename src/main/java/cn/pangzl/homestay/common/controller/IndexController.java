package cn.pangzl.homestay.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		if (request.getSession().getAttribute("userPhone") == null) {
			return "redirect:/login/to_login.do";
		}
		return "index";
	}
	
	@RequestMapping("/adminIndex")
	public String adminIndex(HttpServletRequest request) {
		if (request.getSession().getAttribute("userPhone") == null) {
			return "redirect:/login/to_login.do";
		}
		return "adminIndex";
	}
	
	@RequestMapping("/cancellation")
	public String cancellation(HttpServletRequest request) {
		request.getSession().setAttribute("userPhone", null);
		return "redirect:/login/to_login.do";
	}
	
}
