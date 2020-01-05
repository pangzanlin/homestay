package cn.pangzl.homestay.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.pangzl.homestay.customer.dao.CustomerDao;
import cn.pangzl.homestay.customer.entity.Customer;
import cn.pangzl.homestay.customer.service.CustomerService;
import cn.pangzl.homestay.exception.GlobalException;
import cn.pangzl.homestay.result.CodeMsg;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Resource
	CustomerDao customerDao;
	
	public Boolean insertCustomer(Customer customer) {
		if (customer == null) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		if (getCustomerByIdCard(customer.getIdCard()) == null) {
			int count = customerDao.insertCustomer(customer);
			if ( count < 1) {
				throw new GlobalException(CodeMsg.SERVER_ERROR);
			}
		}
		return true;
	}

	public Customer getCustomerByIdCard(String idCard) {
		if (idCard == null || idCard ==  "") {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		Customer customer = customerDao.getCustomerByIdCard(idCard);
		return customer;
	}

	public Map<String, Object> listCustomers() {
		List<Customer> customers = customerDao.getCustomers();
		if (customers.size() < 1) {
			throw new GlobalException(CodeMsg.CUSTOMER_NOT_EXIT);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customers", customers);
		return map;
	}

	public Boolean updateCustomer(Customer customer) {
		if (customer==null) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		int count = customerDao.updateCustomer(customer);
		if (count<1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

	public Boolean deleteCustomerById(Integer id) {
		int count = customerDao.deleteCustomerById(id);
		if (count<1) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		return true;
	}

}














