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
      <li class="layui-nav-item layui-this"><a>民宿状态</a></li>
      <li class="layui-nav-item"><a>民宿管理</a></li>
      <li class="layui-nav-item"><a>旅客信息</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="">
                         李笨笨
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
          <a id="orderRoom">添加民宿</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">禁用民宿</a>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <!-- 主体内容 -->
    <div style="padding: 15px;">
       <div class="layui-container">
       <h4>延安市所有民宿</h4>
		  <div class="layui-row">
		    <table class="layui-hide" id="todayOrderTable" lay-filter="test"></table>
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
    elem: '#todayOrderTable'
    ,url:'${pageContext.request.contextPath}/admin/listHomeStays.do'
    ,parseData : function(res) {
		return {
			"code" : res.code, //解析接口状态
			"msg" : res.msg, //解析提示文本
			"data" : res.data.homeStays//解析数据列表
		};
	}
    ,cols: [[
      {field:'homeStayCode', title: '民宿编号'}
      ,{field:'homeStayName', title: '民宿名称'}
      ,{field:'charge', title: '负责人'}
      ,{field:'sex', title: '性别',
			templet: function(d){
			   return d.sex == 0 ? "女" : "男";
			}}
      ,{field:'phone', title: '手机号码' }
      ,{field:'address', title: '地址' }
      ,{field:'lastLoginDate', title: '上次登录'}
      ,{field:'cusNum', title: '当前旅客数'}
      ,{field:'businessStatus', title: '营业状态'}
    ]]
  });
});

</script>
<script type="text/html" id="statusTpl">
    <span style="color: #029789;">{{ d.orderStatus == 0 ? "在住" : "结束" }}</span>
</script>
</body>
</html>










