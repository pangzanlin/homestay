package cn.pangzl.homestay.user.service;

import javax.servlet.http.HttpServletRequest;

import cn.pangzl.homestay.user.entity.User;

public interface UserService {
	
	User findUserByPhone(Long phone);
	
	Integer doLogin(HttpServletRequest request, Long phone, String password);
	
	boolean updateUser(User user);

}
