<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>订单支付</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">民宿信息管理平台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/index.do">今日订单</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/order/to_orderList.do">订单</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/customer/to_customerList.do">旅客</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/room/to_room.do">房间</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="">
                         王多多
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">个人信息</a></dd>
          <dd><a href="">修改信息</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">注销</a></li>
    </ul>
  </div>

<div style="padding: 15px;">
	<form class="layui-form" lay-filter="formTest">
	<h2 style="margin-left: 610px;">订单详情</h2>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>旅客信息</legend>
	</fieldset>
	  <div class="layui-inline">
	    <label class="layui-form-label">姓名：</label>
	    <div class="layui-input-block">
	      <input type="text" name="cusName" class="layui-input" readonly="true" style="border: 0px;">
	    </div>
	  </div>
	  <div class="layui-inline">
	    <label class="layui-form-label">性别：</label>
	    <div class="layui-input-block">
	      <input type="text" name="sex" class="layui-input" readonly="true" style="border: 0px;">
	    </div>
	  </div>
	  <div class="layui-inline">
	    <label class="layui-form-label">手机：</label>
	    <div class="layui-input-block">
	      <input type="text" name="phone" class="layui-input" readonly="true" style="border: 0px;">
	    </div>
	  </div>
	  <div class="layui-inline">
	    <label class="layui-form-label">身份证号：</label>
	    <div class="layui-input-block">
	      <input type="text" name="idCard" class="layui-input" readonly="true" style="border: 0px;">
	    </div>
	  </div>	  
    <fieldset class="layui-elem-field layui-field-title">
	  <legend>账单信息</legend>
    </fieldset>
    <div class="layui-inline">
	    <label class="layui-form-label">房间号：</label>
	    <div class="layui-input-block">
	      <input type="text" name="roomNum" class="layui-input" readonly="true" style="border: 0px;">
	    </div>
	</div>
	<div class="layui-inline">
	   <label class="layui-form-label">房间名称：</label>
	   <div class="layui-input-block">
	     <input type="text" name="roomName" class="layui-input" readonly="true" style="border: 0px;">
	   </div>
	</div>
	<div class="layui-inline">
	   <label class="layui-form-label">入住天数：</label>
	   <div class="layui-input-block">
	     <input type="text" name="dayNum" class="layui-input" readonly="true" style="border: 0px;">
	   </div>
	</div>
	<div class="layui-inline">
	   <label class="layui-form-label">预计退房：</label>
	   <div class="layui-input-block">
	     <input type="text" name="endDate" class="layui-input" readonly="true" style="border: 0px;">
	   </div>
	</div>
    <div class="layui-inline">
      <label class="layui-form-label">价格：</label>
      <div class="layui-input-block">
        <input type="text" name="price" readonly="true" class="layui-input" style="border: 0px;">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">订单编号：</label>
      <div class="layui-input-block">
        <input type="text" name="orderCode" class="layui-input"  autocomplete="off" lay-verify="required">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">押金：</label>
      <div class="layui-input-block">
        <input type="text" onmouseover="HandleDeposit()" onmouseout="HandleDeposit()" name="deposit" class="layui-input"  autocomplete="off" lay-verify="required|number">
      </div>
    </div><br/>
    <div class="layui-inline">
      <label class="layui-form-label">应支付：</label>
      <div class="layui-input-block">
        <input type="text" name="amountPaid" readonly="true" class="layui-input" style="border: 0px;">
      </div>
    </div>
    <div class="layui-form-item">
	  <div class="layui-input-block" style="margin-left: 1050px;">
	    <buttonbutton class="layui-btn" lay-submit lay-filter="*">立即支付</button>
	  </div>
	</div>
</form>
</div>
</div>
<script>
function HandleDeposit() {
	var deposit = $("input[name='deposit']").val();
	var price = $("input[name='price']").val();
	var all = parseFloat(price)+parseFloat(deposit);
	$("input[name='amountPaid']").val(all);
}
layui.use('element', function(){
  var element = layui.element;
});
layui.use('table', function(){
  var table = layui.table;
  
});

layui.use('form', function(){
  var form = layui.form;
  var roomId;
  var endDate;
  
  form.on('submit(*)', function(formData) {
	console.log(formData.field);
	console.log(roomId);
	var data = formData.field;
	layer.confirm('旅客已支付总额?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			url: "${pageContext.request.contextPath}/order/addOrder.do",
			type: "POST",
			data:{
				"idCard": data.idCard
				,"roomId": roomId
				,"orderCode": data.orderCode
				,"amountPaid": data.amountPaid
				,"deposit": data.deposit
				,"endDate": endDate
			},
			success:function(data) {
				if (data.code!=0) {
					layer.msg(data.msg, function() {});
				} else {
					window.location.href="${pageContext.request.contextPath}/index.do";
			    }
		    }
	     });
	    layer.close(index);
	}); 
  });
  
  $.ajax({
		url: "${pageContext.request.contextPath}/order/orderInfo.do",
		type: "POST",
		success:function(data) {
			if (data.code!=0) {
				layer.msg(data.msg, function() {});
			} else {
				var orderFormInfo = data.data.orderPayPage;
				roomId = orderFormInfo.id;
				console.log(orderFormInfo);
				var sex = orderFormInfo.sex = 0? "女":"男";
				endDate = orderFormInfo.endDate;
				form.val("formTest", {
				"cusName": orderFormInfo.cusName
				,"sex": sex
				,"phone": orderFormInfo.phone
				,"idCard": orderFormInfo.idCard
				,"roomNum": orderFormInfo.roomNum
				,"roomName": orderFormInfo.roomName
				,"dayNum": orderFormInfo.dayNum + ' 天'
				,"endDate": new Date(orderFormInfo.endDate).toLocaleString()
				,"price": orderFormInfo.price
			})
		}
	}
  });
});

</script>
</body>
</html>










