package cn.pangzl.homestay.order.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pangzl.homestay.order.service.OrderService;
import cn.pangzl.homestay.order.service.TodayOrderService;
import cn.pangzl.homestay.result.Result;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Resource
	TodayOrderService todayOrderService;
	@Resource
	OrderService orderService;
	
	@RequestMapping("/to_orderList")
	public String toOrderList() {	
		return "order";
	}
	
	@RequestMapping("/list_todayOrders")
	@ResponseBody
	public Result<Map<String, Object>> listTodayOrders() {	
		return Result.success(todayOrderService.listTodayOrders());
	}
	
	@RequestMapping("/listAllOrders")
	@ResponseBody
	public Result<Map<String, Object>> listAllOrders() {	
		return Result.success(orderService.listAllOrder());
	}
	
	@RequestMapping("/orderInfo")
	@ResponseBody
	public Result<Map<String, Object>> orderInfo(HttpServletRequest request) {		
		return Result.success(orderService.getOrderInfo(request));
	}
	
	@RequestMapping("/addOrder")
	@ResponseBody
	public Result<Boolean> addOrder(HttpServletRequest request, String idCard,Integer roomId,String orderCode,Double amountPaid,Double deposit) {		
		HttpSession session = request.getSession();
		Date endDate = (Date) session.getAttribute("endDate");
		orderService.addOrder(idCard,roomId,orderCode,amountPaid,deposit,endDate);
		return Result.success(true);
	}
	
}
















