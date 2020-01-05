package cn.pangzl.homestay.room.entity;

public class Room {
	private Integer id;
	private Integer roomNum;
	private String roomName;
	private Integer availableNum;
	private Integer bedType;
	private Integer bedNum;
	private Integer window;
	private Double price;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Integer getAvailableNum() {
		return availableNum;
	}
	public void setAvailableNum(Integer availableNum) {
		this.availableNum = availableNum;
	}
	public Integer getBedType() {
		return bedType;
	}
	public void setBedType(Integer bedType) {
		this.bedType = bedType;
	}
	public Integer getBedNum() {
		return bedNum;
	}
	public void setBedNum(Integer bedNum) {
		this.bedNum = bedNum;
	}
	public Integer getWindow() {
		return window;
	}
	public void setWindow(Integer window) {
		this.window = window;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String toString() {
		return "Room [id=" + id + ", roomNum=" + roomNum + ", roomName=" + roomName + ", availableNum=" + availableNum
				+ ", bedType=" + bedType + ", bedNum=" + bedNum + ", window=" + window + ", price=" + price + "]";
	}
}
