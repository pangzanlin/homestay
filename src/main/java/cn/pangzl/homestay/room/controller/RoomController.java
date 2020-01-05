package cn.pangzl.homestay.room.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pangzl.homestay.result.Result;
import cn.pangzl.homestay.room.entity.Room;
import cn.pangzl.homestay.room.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Resource
	RoomService roomService;
	
	@RequestMapping("/to_room")
	public String toRoomPage() {
		return "roomPage";
	}

	@RequestMapping("/list_rooms")
	@ResponseBody
	public Result<Map<String, Object>> listRooms() {
		return Result.success(roomService.listRooms());
	}
	
	@RequestMapping("/add_room")
	@ResponseBody
	public Result<Boolean> addRoom(Room room) {	
		return Result.success(roomService.addRoom(room));
	}
	
	@RequestMapping("/delete_room")
	@ResponseBody
	public Result<Boolean> deleteRoom(Integer id) {	
		return Result.success(roomService.deleteRoom(id));
	}
	
	@RequestMapping("/update_room")
	@ResponseBody
	public Result<Boolean> updateRoom(Room room) {	
		return Result.success(roomService.updateRoom(room));
	}
	
	@RequestMapping("/getEmptyRooms")
	@ResponseBody
	public Result<Map<String, Object>> getEmptyRooms() {
		return Result.success(roomService.getEmptyRooms());
	}
	
	@RequestMapping("/getFullRooms")
	@ResponseBody
	public Result<Map<String, Object>> getFullRooms() {
		return Result.success(roomService.getFullRooms());
	}
}










