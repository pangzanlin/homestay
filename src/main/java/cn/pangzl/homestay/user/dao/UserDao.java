package cn.pangzl.homestay.user.dao;

import cn.pangzl.homestay.user.entity.User;

public interface UserDao {
	
	User findUserByPhone(Long phone);
	
	int updateUser(User user);
	
}
