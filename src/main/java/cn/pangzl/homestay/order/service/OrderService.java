package cn.pangzl.homestay.order.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.pangzl.homestay.order.entity.Order;


public interface OrderService {
	
	Map<String, Object> getOrderInfo(HttpServletRequest request);
	
	Map<String, Object> listAllOrder();
	
	Boolean insertOrder(Order order);

	void addOrder(String idCard, Integer roomId, String orderCode, Double amountPaid, Double deposit, Date endDate);
}
