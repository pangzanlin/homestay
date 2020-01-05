package cn.pangzl.homestay.order.dao;

import java.util.List;

import cn.pangzl.homestay.order.entity.TodayOrder;


public interface TodayOrderDao {
	
	List<TodayOrder> getTodayOrders();

}
