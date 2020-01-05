package user.dao;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.pangzl.homestay.user.dao.UserDao;
import cn.pangzl.homestay.user.entity.User;

public class UserDaoTest {
	
	@SuppressWarnings("resource")
	@Test
	public void testFindUserByPhone(){
		ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext(
				"spring-mvc.xml",
				"spring-pool.xml",
				"spring-mybatis.xml");
		UserDao userDao = (UserDao) ctx.getBean("userDao");
		User user = userDao.findUserByPhone(17868812243L);
		Date now = new Date();
		user.setLastLoginDate(now);
		userDao.updateUser(user);
	}

}
