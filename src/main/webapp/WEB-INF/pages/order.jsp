<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>订单管理</title>
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
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/index.do" id="todayOrder">今日订单</a></li>
      <li class="layui-nav-item layui-this"><a>订单</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/customer/to_customerList.do">旅客</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/room/to_room.do" id="room">房间</a></li>
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
          <a href="javascript:;">退房</a>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <!-- 主体内容 -->
    <div style="padding: 15px;">
       <div class="layui-container">
       <h4>所有订单</h4>
		  <div class="layui-row">
		    <table class="layui-hide" id="test" lay-filter="test"></table>
		  </div>
		</div>
    </div>
  </div>
  
<div class="layui-footer">
已入住房间：3间
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
    elem: '#test'
    ,url:'${pageContext.request.contextPath}/order/listAllOrders.do'
    ,parseData : function(res) {
		return {
			"code" : res.code, //解析接口状态
			"msg" : res.msg, //解析提示文本
			"data" : res.data.allOrder//解析数据列表
		};
	}
    ,cols: [[
    	{field:'id', title: 'ID'}
    	,{field:'orderCode', title: '订单编号'}
    	,{field:'cusName', title: '旅客姓名'}
    	,{field:'sex', title: '性别',
			templet: function(d){
				return d.sex == 0 ? "女" : "男";
			}}
    	,{field:'phone', title: '电话'}
    	,{field:'idCard', title: '身份证号'}
    	,{field:'roomName', title: '房间名'}
    	,{field:'orderStatus', title: '订单状态',
			templet: function(d){
				return d.sex == 0 ? "进行中" : "已结束";
			}}
    	,{field:'amountPaid', title: '已支付'}
    	,{field:'deposit', title: '押金'}
    	,{field:'isDepositReturn', title: '押金退还',
			templet: function(d){
				return d.sex == 0 ? "未退还" : "已退";
			}}
    	,{field:'startDate', title: '开始时间',
			templet: function(d){
			   return new Date(d.startDate).toLocaleString();
			}}
    	,{field:'endDate', title: '结束时间',
			templet: function(d){
			   return new Date(d.startDate).toLocaleString();
			}}
    ]]
  });
});

</script>
</body>
</html>










