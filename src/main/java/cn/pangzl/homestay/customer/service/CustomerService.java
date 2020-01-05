package cn.pangzl.homestay.customer.service;

import java.util.Map;

import cn.pangzl.homestay.customer.entity.Customer;

public interface CustomerService {
	
	Boolean insertCustomer(Customer customer);
	
	Customer getCustomerByIdCard(String idCard);
	
	Map<String, Object> listCustomers();

	Boolean updateCustomer(Customer customer);
	
	Boolean deleteCustomerById(Integer id);
	
}
