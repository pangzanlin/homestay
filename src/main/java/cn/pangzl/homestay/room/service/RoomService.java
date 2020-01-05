package cn.pangzl.homestay.room.service;

import java.util.Map;

import cn.pangzl.homestay.room.entity.Room;


public interface RoomService {

	Map<String, Object> listRooms();
	
	Map<String, Object> getEmptyRooms();
	
	boolean addRoom(Room room);
	
	boolean deleteRoom(Integer id);
	
	boolean updateRoom(Room room);

	Room getRoomById(Integer id);

	Map<String, Object> getFullRooms();
	
}
