package cn.pangzl.homestay.customer.entity;

public class Customer {
	
	private Integer id;
	private String cusName;
	private Integer sex;
	private Long phone;
	private String idCard;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "Customer [id=" + id + ", cusName=" + cusName + ", sex=" + sex + ", phone=" + phone + ", idCard="
				+ idCard + "]";
	}
	
}
