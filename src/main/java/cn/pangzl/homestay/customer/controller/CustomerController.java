package cn.pangzl.homestay.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pangzl.homestay.customer.entity.Customer;
import cn.pangzl.homestay.customer.entity.OrderFormInfo;
import cn.pangzl.homestay.customer.service.CustomerService;
import cn.pangzl.homestay.result.Result;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Resource
	CustomerService customerService;
	
	@RequestMapping("/to_customerList")
	public String toOrderList() {	
		return "customer";
	}
	
	@RequestMapping("/addCustomer")
	@ResponseBody
	public Result<Boolean> addCustomer(Customer customer) {
		return Result.success(customerService.insertCustomer(customer));
	}
	
	@RequestMapping("/updateCustomer")
	@ResponseBody
	public Result<Boolean> updateCustomer(Customer customer) {
		return Result.success(customerService.updateCustomer(customer));
	}
	
	@RequestMapping("/deleteCustomerById")
	@ResponseBody
	public Result<Boolean> deleteCustomer(Integer id) {
		return Result.success(customerService.deleteCustomerById(id));
	}
	
	@RequestMapping("/list_customers")
	@ResponseBody
	public Result<Map<String, Object>> listCustomers() {
		return Result.success(customerService.listCustomers());
	}
	
	@RequestMapping("orderFormInfo")
	public String orderFormInfo(HttpServletRequest request, Customer customer, OrderFormInfo orderFormInfo) {
		HttpSession session = request.getSession();
		session.setAttribute("orderFormInfo", orderFormInfo);
		customerService.insertCustomer(customer);
		return "orderPay";
	}

}













