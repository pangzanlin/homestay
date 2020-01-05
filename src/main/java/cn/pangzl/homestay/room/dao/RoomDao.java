package cn.pangzl.homestay.room.dao;

import java.util.List;

import cn.pangzl.homestay.room.entity.Room;

public interface RoomDao {

	int insertRoom(Room room);
	
	List<Room> getEmptyRooms();
	
	int deleteRoom(Integer id);
	
	List<Room> getRooms();
	
	int updateRoom(Room room);
	
	Room getRoomById(Integer id);

	List<Room> getFullRooms();
	
}
