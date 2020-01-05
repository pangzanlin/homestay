package cn.pangzl.homestay.order.dao;

import java.util.List;

import cn.pangzl.homestay.order.entity.AllOrder;
import cn.pangzl.homestay.order.entity.Order;

public interface OrderDao {
	
	int insertOrder(Order order);
	
	List<AllOrder> listAllOrder();

}
