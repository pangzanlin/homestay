package cn.pangzl.homestay.admin.entity;

public class HomeStay {
	
	private String homeStayCode;
	private String homeStayName;
	private String charge;
	private Integer sex;
	private Long phone;
	private String address;
	private String lastLoginDate;
	private Integer cusNum;
	private String businessStatus;
	public String getHomeStayCode() {
		return homeStayCode;
	}
	public void setHomeStayCode(String homeStayCode) {
		this.homeStayCode = homeStayCode;
	}
	public String getHomeStayName() {
		return homeStayName;
	}
	public void setHomeStayName(String homeStayName) {
		this.homeStayName = homeStayName;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public Integer getCusNum() {
		return cusNum;
	}
	public void setCusNum(Integer cusNum) {
		this.cusNum = cusNum;
	}
	public String getBusinessStatus() {
		return businessStatus;
	}
	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}
	@Override
	public String toString() {
		return "HomeStay [homeStayCode=" + homeStayCode + ", homeStayName=" + homeStayName + ", charge=" + charge
				+ ", sex=" + sex + ", phone=" + phone + ", address=" + address + ", lastLoginDate=" + lastLoginDate
				+ ", cusNum=" + cusNum + ", businessStatus=" + businessStatus + "]";
	}

}
