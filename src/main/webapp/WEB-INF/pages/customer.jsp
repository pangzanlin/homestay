<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>旅客管理</title>
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
      <li class="layui-nav-item layui-this"><a>旅客</a></li>
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
          <a href="javascript:;">退房</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
			<a id="addCustomer">添加旅客</a>
		</li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <!-- 主体内容 -->
    <div style="padding: 15px;">
       <div class="layui-container">
       <h4>旅客信息</h4>
		  <div class="layui-row">
		    <table class="layui-hide" id="test" lay-filter="test"></table>
		  </div>
		</div>
    </div>
  </div>

<div id="myForm" style="display: none; width: 350px;">
	<form class="layui-form" lay-filter="formTest">
		<div class="layui-form-item">
		  <label class="layui-form-label">姓名：</label>
		  <div class="layui-input-block">
		    <input type="text" name="cusName" required  lay-verify="required" placeholder="旅客姓名" autocomplete="off" class="layui-input">
		  </div>
		</div>
		<div class="layui-form-item">
		  <label class="layui-form-label">性别：</label>
		  <div class="layui-input-block">
		    <select name="sex">
		      <option></option>
		      <option value="0">女</option>
		      <option value="1">男</option>
		    </select>
		  </div>
		</div>
		<div class="layui-form-item">
		  <label class="layui-form-label">手机：</label>
		  <div class="layui-input-block">
		    <input type="text" name="phone" required  lay-verify="required|number" placeholder="手机号" autocomplete="off" class="layui-input">
		  </div>
		</div>
		<div class="layui-form-item">
		  <label class="layui-form-label">身份证号：</label>
		  <div class="layui-input-block">
		    <input type="text" name="idCard" required  lay-verify="required|number" placeholder="身份证号码" autocomplete="off" class="layui-input">
		  </div>
		</div>
		
		<div class="layui-form-item">
		  <div class="layui-input-block">
		    <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
		    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		  </div>
		</div>
	</form>
</div>
 
<div class="layui-footer">
已入住房间：3间
</div>
</div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
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
    ,url:'${pageContext.request.contextPath}/customer/list_customers.do'
    ,parseData : function(res) {
		return {
			"code" : res.code, //解析接口状态
			"msg" : res.msg, //解析提示文本
			"data" : res.data.customers//解析数据列表
		};
	}
    ,cols: [[
    	{
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'id',
			title : 'ID',
			fixed : 'left',
			unresize : true,
			sort : true
		}, {
			field : 'cusName',
			title : '姓名'
		},{
			field : 'sex',
			title : '性别',
			templet: function(d){
			   return d.sex == 0 ? "女" : "男";
			}
		},{
			field : 'phone',
			title : '电话'
		},{
			field : 'idCard',
			title : '身份证号'
		},{
			fixed : 'right',
			title : '操作',
			toolbar : '#barDemo'
		}
    ]]
  });
	//监听行工具事件
	table.on('tool(test)', function(obj) {
		var data = obj.data;
		var form = layui.form;
		if (obj.event === 'del') {
			layer.confirm('确定删除？', function(index) {
				deleteCustomer(data.id);
				obj.del();
			});
		} else if (obj.event === 'edit') {
			layer.open({
				type : 1,
				title:'修改旅客信息',
				area: '400px',
				shadeClose:true,
				content : $('#myForm'),
				success: function(layero, index){
					form.val("formTest", {
						"cusName": data.cusName
						,"sex": data.sex
						,"phone": data.phone
						,"idCard": data.idCard
					});
				}
			});
			form.on('submit(*)', function(formData) {
				formData.field.id = data.id;
				addOrUpdateCustomer(formData.field); 
			});
		}
	});
});
function deleteCustomer(id) {
	var baseUrl = "${pageContext.request.contextPath}";
	$.ajax({
		url: baseUrl+"/customer/deleteCustomerById.do",
		type: "POST",
		data:{
			"id": id
		},
		success:function(data){
			if (data.code!=0) {
				layer.msg(data.msg, function() {});
			} else {
				layer.msg("已删除");
			}
		}
	});
}
function addOrUpdateCustomer(data) {
	console.log(data);
	var baseUrl = "${pageContext.request.contextPath}";
	var target = data.id?"/customer/updateCustomer.do":"/customer/addCustomer.do";
	$.ajax({
		url: baseUrl+target,
		type: "POST",
		data:{
			"id": data.id
			,"cusName": data.cusName
			,"sex": data.sex
			,"phone": data.phone
			,"idCard": data.idCard
		},
		success:function(data) {
			if (data.code!=0) {
				layer.msg(data.msg, function() {});
			} else {
				layer.msg("成功");
			}
		}
	});
}
$(function() {
	$("#addCustomer").click(function() {
		var form = layui.form;
		layer.open({
			type : 1,
			title:'添加旅客',
			area: '400px',
			content : $('#myForm'),
			shadeClose:true,
			success: function(layero, index){
				form.val("formTest", {
					"cusName": ""
					,"sex": ""
					,"phone": ""
					,"idCard": ""
				})
			}
		});
		form.on('submit(*)', function(data){
			addOrUpdateCustomer(data.field);
		});
		form = null;
	});
})
</script>
</body>
</html>










