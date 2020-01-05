<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>民宿信息管理平台</title>
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
      <li class="layui-nav-item layui-this"><a>今日订单</a></li>
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
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/cancellation.do">注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域 -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a id="orderRoom">订房</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a id="checkOut">退房</a>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <!-- 主体内容 -->
    <div style="padding: 15px;">
       <div class="layui-container">
       <h4>当前在住订单</h4>
       <!-- <table class="layui-hide" id="todayOrderTable" lay-filter="test"></table> -->
		  <div class="layui-row">
		    <div class="layui-col-md9" id="mainBody">
		       <table class="layui-hide" id="todayOrderTable" lay-filter="test"></table>
		    </div>
		       <div class="layui-col-md3"  style="padding-top: 40px; padding-bottom: 30px; background-color: #F2F2F2;margin-top: 10px;">
		          <div class="layui-card">
			        <div class="layui-card-header">记事本
			        <button style="margin-left: 130px;" class="layui-btn layui-btn-sm"><i class="layui-icon"></i></button>
			        </div>
			        <div class="layui-card-body">
			           1. 1001号房的王大锤借了充电器<br/>
			           2. 2013号房的李冬梅需要吹风<br/>
			           3. 叫醒3010号房的马化腾要赶13:30的车<br/>
			           4. 给2101号房间换房间用品<br/>
			        </div>
                 </div>
			   </div>
		  </div>
		</div>
    </div>
  </div>
  
<div class="layui-footer">
已入住房间：3间
</div>
<div id="checkOutForm" style="display: none; width: 700px;">
	<form class="layui-form" method="post" lay-filter="formTest1" style="padding: 10px;">
		<div style="padding-left: 20px; color: blue;">选择在住房间</div>
	    <hr class="layui-bg-blue">
	    <div class="layui-inline">
	      <label class="layui-form-label">选择房间：</label>
	      <div class="layui-input-inline">
	      <select name="id" lay-filter="selectCheckOutRoom" id="selectCheckOutRoomID">
		        <option value=""></option>
		  </select>
	      </div>
	    </div>
	    <div style="padding-left: 20px; color: blue;">入住信息</div>
	    <hr class="layui-bg-blue">
	    <div class="layui-inline"  style="width: 200px;">
	      <label class="layui-form-label">旅客姓名：</label>
	      <input type="text" name="cusName" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
	    </div>
	    <div class="layui-inline"  style="width: 200px;">
	      <label class="layui-form-label">入住房间：</label>
	      <input type="text" name="roomName" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
	    </div>
	    <div class="layui-inline"  style="width: 200px;">
	      <label class="layui-form-label">已支付：</label>
	      <input type="text" name="amonutPaid" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
	    </div>
	    <div class="layui-inline"  style="width: 200px;">
	      <label class="layui-form-label">押金：</label>
	      <input type="text" name="deposit" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
	    </div>
	    <div class="layui-inline"  style="width: 200px;">
	      <label class="layui-form-label">应退：</label>
	      <input type="text" name="returnDeposit" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
	    </div>
	    <div class="layui-form-item">
		  <div class="layui-input-block" style="margin-left: 532px;">
		    <buttonbutton class="layui-btn" lay-submit lay-filter="return">退还押金</button>
		  </div>
		</div>
	</form>
</div>
<div id="myForm" style="display: none; width: 700px;">
	<form class="layui-form" method="post" lay-filter="formTest" style="padding: 10px;" action="${pageContext.request.contextPath}/customer/orderFormInfo.do">
		<div class="layui-form-item">
			<div style="padding-left: 20px; color: blue;">旅客信息</div>
		    <hr class="layui-bg-blue">
		    <div class="layui-inline">
		      <label class="layui-form-label">姓名：</label>
		      <div class="layui-input-inline">
		        <input type="tel" name="cusName" lay-verify="required" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">性别：</label>
		      <div class="layui-input-inline">
		      <select name="sex">
			        <option value=""></option>
			        <option value="1">男</option>
			        <option value="0">女</option>
			      </select>
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">手机号码</label>
		      <div class="layui-input-inline">
		        <input type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">身份证号码</label>
		      <div class="layui-input-inline">
		        <input type="text" name="idCard" lay-verify="required" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div style="padding-left: 20px; color: blue;">选择房间</div>
		    <hr class="layui-bg-blue">
		    <div class="layui-inline">
		      <label class="layui-form-label">选择房间：</label>
		      <div class="layui-input-inline">
		      <select name="id" lay-filter="selectRoom" id="selectRoomID">
			        <option value=""></option>
			  </select>
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">入住天数</label>
		      <div class="layui-input-inline">
		        <input type="text" name="dayNum" lay-verify="required|number" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div style="padding-left: 20px; color: blue;">房间信息</div>
		    <hr class="layui-bg-blue">
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label">房间名称：</label>
		      <input type="text" name="roomName" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label">可住人数：</label>
		      <input type="text" name="availableNum" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label">床型：</label>
		      <input type="text" name="bedType" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label">床数：</label>
		      <input type="text" name="bedNum" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label" >窗户：</label>
		      <input type="text" name="window" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-inline"  style="width: 200px;">
		      <label class="layui-form-label">价格：</label>
		      <input type="text" name="price" autocomplete="off" readonly="true" class="layui-input" style="border: 0px; width:90px;">
		    </div>
		    <div class="layui-form-item">
			  <div class="layui-input-block" style="margin-left: 532px;">
			    <button class="layui-btn" lay-submit lay-filter="*">提交订单</button>
			  </div>
			</div>
		  </div>
	</form>
</div>
</div>
<script>
layui.use('element', function(){
  var element = layui.element;
});
layui.use('table', function(){
  var table = layui.table;
  Date.prototype.toLocaleString = function() {
     return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + " " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
  };
  table.render({
    elem: '#todayOrderTable'
    ,url:'${pageContext.request.contextPath}/order/list_todayOrders.do'
    ,parseData : function(res) {
		return {
			"code" : res.code, //解析接口状态
			"msg" : res.msg, //解析提示文本
			"data" : res.data.todayOrders//解析数据列表
		};
	}
    ,cols: [[
      {field:'roomNum', title: '房间号', width:72}
      ,{field:'peopleNum', title: '入住人数', width:88}
      ,{field:'cusName', title: '姓名', width:99}
      ,{field:'sex', title: '性别', width:63,
			templet: function(d){
			   return d.sex == 0 ? "女" : "男";
			}}
      ,{field:'phone', title: '手机号码', width:120}
      ,{field:'startDate', title: '入住时间', width:162,
			templet: function(d){
			   return new Date(d.startDate).toLocaleString();
			}}
      ,{field:'endDate', title: '预计退房', width:162,
			templet: function(d){
				return new Date(d.endDate).toLocaleString();
			}}
      ,{field:'orderStatus', title: '状态', width:80, templet: '#statusTpl'}
    ]]
  });
});

$(function() {
	$("#checkOut").click(function() {
		var form = layui.form;
		var fullRooms ;
		layer.open({
			type : 1,
			title:'退房',
			area: '720px',
			content : $('#checkOutForm'),
			shadeClose:true,
			success: function(layero, index){
				form.val("formTest1", {
					"selectCheckOutRoom": ""
					,"cusName": ""
					,"roomName":""
					,"amonutPaid":""
					,"deposit":""
					,"returnDeposit":""
				})
			}
		});
		$.ajax({
			url: "${pageContext.request.contextPath}/room/getFullRooms.do",
			type: "POST",
			success:function(data) {
				if (data.code!=0) {
					layer.msg(data.msg, function() {});
				} else {
					fullRooms = data.data.fullRooms;
					console.log(fullRooms)
					$("#selectCheckOutRoomID").empty();
					$("#selectCheckOutRoomID").append("<option value=''></option>");
					for (var i = 0; i < fullRooms.length; i++) {
						$("#selectCheckOutRoomID").append("<option value="+fullRooms[i].id+">"+fullRooms[i].roomNum+"</option>");
					}
					form.render();
				}
			}
		});
		form.on('select(selectCheckOutRoom)', function(data){
		  console.log("hekko")
		  var selectId = data.value;
		  var currentRoom;
		  for (var i = 0; i < fullRooms.length; i++) {
			 if (selectId == fullRooms[i].id) {
				 currentRoom = fullRooms[i];
			 }
		  }
		  form.val("formTest1", {
			    "cusName": "马小小"
				,"roomName":"王多多主卧"
				,"amonutPaid":"229.99"
				,"deposit":"100"
				,"returnDeposit":"100"
			})
		});
		form.on('submit(return)', function() {
		layer.confirm('已退还旅客押金?', {icon: 3, title:'提示'}, function(index){
			$.ajax({
				url: "${pageContext.request.contextPath}/order/disableOrder.do",
				type: "POST",
				data:{
					"orderId": 1
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
	}); 
	$("#orderRoom").click(function() {
		var form = layui.form;
		var emptyRooms;
		layer.open({
			type : 1,
			title:'订房',
			area: '720px',
			content : $('#myForm'),
			shadeClose:true,
			success: function(layero, index){
				form.val("formTest", {
					"cusName": ""
					,"sex": ""
					,"phone": ""
					,"idCard": ""
					,"selectRoom": ""
					,"dayNum": ""
					,"roomName": ""
					,"availableNum": ""
					,"bedType": ""
					,"bedNum": ""
					,"window": ""
					,"price": ""
				})
			}
		});
		$.ajax({
			url: "${pageContext.request.contextPath}/room/getEmptyRooms.do",
			type: "POST",
			success:function(data) {
				if (data.code!=0) {
					layer.msg(data.msg, function() {});
				} else {
					emptyRooms = data.data.emptyRooms;
					console.log(emptyRooms)
					$("#selectRoomID").empty();
					$("#selectRoomID").append("<option value=''></option>");
					for (var i = 0; i < emptyRooms.length; i++) {
						$("#selectRoomID").append("<option value="+emptyRooms[i].id+">"+emptyRooms[i].roomNum+"</option>");
					}
					form.render();
				}
			}
		});
		form.on('select(selectRoom)', function(data){
		  var selectId = data.value;
		  var currentRoom;
		  for (var i = 0; i < emptyRooms.length; i++) {
			 if (selectId == emptyRooms[i].id) {
				 currentRoom = emptyRooms[i];
			 }
		  }
		  form.val("formTest", {
				"roomName": currentRoom.roomName
				,"availableNum": currentRoom.availableNum
				,"bedType": currentRoom.bedType
				,"bedNum": currentRoom.bedNum
				,"window": currentRoom.window
				,"price": currentRoom.price
			})
		});
	});
})

</script>
<script type="text/html" id="statusTpl">
    <span style="color: #029789;">{{ d.orderStatus == 0 ? "在住" : "结束" }}</span>
</script>
</body>
</html>










