package cn.pangzl.homestay.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.pangzl.homestay.order.dao.TodayOrderDao;
import cn.pangzl.homestay.order.entity.TodayOrder;
import cn.pangzl.homestay.order.service.TodayOrderService;

@Service
public class TodayOrderServiceImpl implements TodayOrderService{

	@Resource
	TodayOrderDao todayOrderDao;
	
	public Map<String, Object> listTodayOrders() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<TodayOrder> todayOrders =todayOrderDao.getTodayOrders();
		for (int i =0; i< todayOrders.size(); i++) {
			TodayOrder todayOrder = todayOrders.get(i);
			String followCusId  = todayOrder.getFollowCusId();
			if (followCusId == null) {
				todayOrder.setPeopleNum("1人");
			} else if (followCusId.indexOf(",") == -1 ){
				todayOrder.setPeopleNum("2人");
			} else {
				String[] strs = followCusId.split(",");
				todayOrder.setPeopleNum(strs.length + 1 + "人");
			}
		}
		map.put("todayOrders", todayOrders);
		return map;
	}

}











