package customer.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.pangzl.homestay.order.dao.OrderDao;
import cn.pangzl.homestay.order.entity.AllOrder;

public class TestCustomer {
	
	@SuppressWarnings("resource")
	@Test
	public void testFindUserByPhone(){
		ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext(
				"spring-mvc.xml",
				"spring-pool.xml",
				"spring-mybatis.xml");
		OrderDao orderDao = (OrderDao) ctx.getBean("orderDao");
		
		List<AllOrder> list = orderDao.listAllOrder();
		System.out.println(list.size());
	}

}
