package cn.pangzl.homestay.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pangzl.homestay.admin.entity.HomeStay;
import cn.pangzl.homestay.result.Result;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/listHomeStays")
	@ResponseBody
	public Result<Map<String, Object>> listHomeStays() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<HomeStay> homeStays = new ArrayList<HomeStay>();
		String homeStayCode = "2019052500";
		String homeStayName = "的家";
		String charge = "张无忌";
		Integer sex = 0;
		Long phone = 17868812242L;
		String address = "延安市宝塔区诚合大厦";
		String lastLoginDate = "2019-05-25 14:35:24";
		Integer cusNum = 5;
		String businessStatus = "营业中";
		for (int i =0 ; i<5; i++) {
			HomeStay homeStay = new HomeStay();
			homeStay.setAddress(address + i + "单元");
			homeStay.setBusinessStatus(businessStatus);
			homeStay.setCharge(charge + i);
			homeStay.setCusNum(cusNum + i);
			homeStay.setHomeStayCode(homeStayCode + i);
			homeStay.setHomeStayName(charge + i + homeStayName);
			homeStay.setLastLoginDate(lastLoginDate);
			homeStay.setPhone(phone + i);
			homeStay.setSex(sex);
			homeStays.add(homeStay);
		}
		map.put("homeStays", homeStays);
		return Result.success(map);
	}
	
}











