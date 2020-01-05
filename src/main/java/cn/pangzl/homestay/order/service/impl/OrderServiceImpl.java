package cn.pangzl.homestay.order.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import cn.pangzl.homestay.customer.entity.OrderFormInfo;
import cn.pangzl.homestay.exception.GlobalException;
import cn.pangzl.homestay.order.dao.OrderDao;
import cn.pangzl.homestay.order.entity.AllOrder;
import cn.pangzl.homestay.order.entity.Order;
import cn.pangzl.homestay.order.entity.OrderPayPage;
import cn.pangzl.homestay.order.service.OrderService;
import cn.pangzl.homestay.result.CodeMsg;
import cn.pangzl.homestay.room.entity.Room;
import cn.pangzl.homestay.room.service.RoomService;

@Service
public class OrderServiceImpl implements OrderService{

	@Resource
	RoomService roomService;
	
	@Resource
	OrderDao orderDao;
	
	public Map<String, Object> getOrderInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		OrderFormInfo orderFormInfo = (OrderFormInfo) session.getAttribute("orderFormInfo");
		Room room = roomService.getRoomById(orderFormInfo.getId());
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.DATE, orderFormInfo.getDayNum());
		ca.set(Calendar.HOUR_OF_DAY, 14);
		ca.set(Calendar.MINUTE, 0);
		ca.set(Calendar.SECOND, 0);
		ca.set(Calendar.MILLISECOND, 0);
		Date endDate = ca.getTime();
		OrderPayPage orderPayPage = new OrderPayPage();
		orderPayPage.setRoomNum(room.getRoomNum());
		orderPayPage.setEndDate(endDate);
		orderPayPage.setCusName(orderFormInfo.getCusName());
		orderPayPage.setSex(orderFormInfo.getSex());
		orderPayPage.setPhone(orderFormInfo.getPhone());
		orderPayPage.setIdCard(orderFormInfo.getIdCard());
		orderPayPage.setId(orderFormInfo.getId());
		orderPayPage.setRoomName(orderFormInfo.getRoomName());
		orderPayPage.setDayNum(orderFormInfo.getDayNum());
		orderPayPage.setPrice(orderFormInfo.getPrice());
		session.setAttribute("endDate", endDate);
		map.put("orderPayPage", orderPayPage);
		return map;
	}

	public Boolean insertOrder(Order order) {
		if (order == null) {
			throw new GlobalException(CodeMsg.SERVER_ERROR);
		}
		orderDao.insertOrder(order);
		return true;
	}

	public void addOrder(String idCard, Integer roomId, String orderCode, Double amountPaid, Double deposit, Date endDate) {
		Order order = new Order();
		order.setOrderCode(orderCode);
		order.setCusIdCard(idCard);
		order.setRoomId(roomId);
		order.setOrderStatus(0);
		order.setAmountPaid(amountPaid);
		order.setDeposit(deposit);
		order.setIsDepositReturn(0);
		order.setStartDate(new Date());
		order.setEndDate(endDate);
		insertOrder(order);
	}

	public Map<String, Object> listAllOrder() {
		List<AllOrder> allOrder = orderDao.listAllOrder();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("allOrder", allOrder);
		return map;
	}
	
	

}














