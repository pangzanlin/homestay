package cn.pangzl.homestay.order.entity;

import java.util.Date;

public class AllOrder {

	private Integer Id;
	private String orderCode;
	private String cusName;
	private Integer sex;
	private Long phone;
	private String idCard;
	private String roomName;
	private Integer orderStatus;
	private Double amountPaid;
	private Double deposit;
	private Integer isDepositReturn;
	private Date startDate;
	private Date endDate;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Double getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(Double amountPaid) {
		this.amountPaid = amountPaid;
	}
	public Double getDeposit() {
		return deposit;
	}
	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
	public Integer getIsDepositReturn() {
		return isDepositReturn;
	}
	public void setIsDepositReturn(Integer isDepositReturn) {
		this.isDepositReturn = isDepositReturn;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String toString() {
		return "AllOrder [Id=" + Id + ", orderCode=" + orderCode + ", cusName=" + cusName + ", sex=" + sex + ", phone="
				+ phone + ", idCard=" + idCard + ", roomName=" + roomName + ", orderStatus=" + orderStatus
				+ ", amountPaid=" + amountPaid + ", deposit=" + deposit + ", isDepositReturn=" + isDepositReturn
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
