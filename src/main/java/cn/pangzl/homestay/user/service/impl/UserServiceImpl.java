package cn.pangzl.homestay.user.service.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pangzl.homestay.exception.GlobalException;
import cn.pangzl.homestay.result.CodeMsg;
import cn.pangzl.homestay.user.dao.UserDao;
import cn.pangzl.homestay.user.entity.User;
import cn.pangzl.homestay.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	public User findUserByPhone(Long phone) {
		return userDao.findUserByPhone(phone);
	}
	
	public Integer doLogin(HttpServletRequest request, Long phone, String password) {
		if (phone==null){
			throw new GlobalException(CodeMsg.MOBILE_IS_NULL);
		}
		if (password==""){
			throw new GlobalException(CodeMsg.PASSWORD_IS_NULL);
		}
		User user = userDao.findUserByPhone(phone);
		if (user == null) {
			throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
		}
		if(!password.equals(user.getPassword())){
        	throw new GlobalException(CodeMsg.PASSWORD_ERROR);
        }
		HttpSession session = request.getSession();
		session.setAttribute("userPhone", phone);
		Date now = new Date();
		user.setLastLoginDate(now);
		user.setLoginCount(user.getLoginCount()+1);
		updateUser(user);
		return user.getIdentity();
	}

	
	public boolean updateUser(User user) {
		if (user==null) {
			throw new GlobalException(CodeMsg.USER_IS_NULL);
		}
		int count = userDao.updateUser(user);
		if (count < 1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

}













