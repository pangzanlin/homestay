package cn.pangzl.homestay.room.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.pangzl.homestay.exception.GlobalException;
import cn.pangzl.homestay.result.CodeMsg;
import cn.pangzl.homestay.room.dao.RoomDao;
import cn.pangzl.homestay.room.entity.Room;
import cn.pangzl.homestay.room.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	@Resource
	RoomDao roomDao;
	
	public Map<String, Object> listRooms() {
		List<Room> rooms = roomDao.getRooms();
		if (rooms.size() < 1) {
			throw new GlobalException(CodeMsg.NO_ROOM);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rooms", rooms);
		return map;
	}

	public boolean addRoom(Room room) {
		if (room==null) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		int count = roomDao.insertRoom(room);
		if (count<1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

	public boolean deleteRoom(Integer id) {
		int count = roomDao.deleteRoom(id);
		if (count<1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

	public boolean updateRoom(Room room) {
		if (room==null) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		int count = roomDao.updateRoom(room);
		if (count<1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

	public Map<String, Object> getEmptyRooms() {
		List<Room> emptyRooms = roomDao.getEmptyRooms();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emptyRooms", emptyRooms);
		return map;
	}

	public Room getRoomById(Integer id) {
		return roomDao.getRoomById(id);
	}

	public Map<String, Object> getFullRooms() {
		List<Room> fullRooms = roomDao.getFullRooms();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullRooms", fullRooms);
		return map;
	}

}













