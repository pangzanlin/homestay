package cn.pangzl.homestay.customer.dao;

import java.util.List;

import cn.pangzl.homestay.customer.entity.Customer;

public interface CustomerDao {
	
	int insertCustomer(Customer customer);
	
	int deleteCustomerById(Integer id);
	
	List<Customer> getCustomers();
	
	int updateCustomer(Customer customer);
	
	Customer getCustomerByIdCard(String idCard);

}
