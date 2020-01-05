package room.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.pangzl.homestay.room.dao.RoomDao;
import cn.pangzl.homestay.room.entity.Room;


public class RoomDaoTest {
	
	@SuppressWarnings("resource")
	@Test
	public void testFindUserByPhone(){
		ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext(
				"spring-mvc.xml",
				"spring-pool.xml",
				"spring-mybatis.xml");
		RoomDao roomDao = (RoomDao) ctx.getBean("roomDao");
		List<Room> rooms = roomDao.getEmptyRooms();
		for (int i =0 ; i< rooms.size(); i++) {
			System.out.println(rooms.get(i).toString());
		}
		System.out.println(rooms.size());
	}
	
}
