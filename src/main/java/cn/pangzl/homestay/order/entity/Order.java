package cn.pangzl.homestay.order.entity;

import java.util.Date;

public class Order {
	
	private Integer Id;
	private String orderCode;
	private String cusIdCard;
	private Integer roomId;
	private Integer orderStatus;
	private Double amountPaid;
	private Double deposit;
	private Integer isDepositReturn;
	private Date startDate;
	private Date endDate;
	private String followCusId;
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
	public String getCusIdCard() {
		return cusIdCard;
	}
	public void setCusIdCard(String cusIdCard) {
		this.cusIdCard = cusIdCard;
	}
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
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
	public String getFollowCusId() {
		return followCusId;
	}
	public void setFollowCusId(String followCusId) {
		this.followCusId = followCusId;
	}
	@Override
	public String toString() {
		return "Order [Id=" + Id + ", orderCode=" + orderCode + ", cusIdCard=" + cusIdCard + ", roomId=" + roomId
				+ ", orderStatus=" + orderStatus + ", amountPaid=" + amountPaid + ", deposit=" + deposit
				+ ", isDepositReturn=" + isDepositReturn + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", followCusId=" + followCusId + "]";
	}

}
