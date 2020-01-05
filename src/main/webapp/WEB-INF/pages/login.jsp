<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css" type="text/css">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<style>
#login-form {
	width: 250px;
}
#login-head {
	float:right;
	width: 330px;
	margin-right: 160px;
	margin-top: 230px;
}
body {
	background:url(${pageContext.request.contextPath}/static/img/001.jpg) no-repeat;
	background-size: 100%;
}
</style>
<body>
<div class="panel panel-primary" style="margin:0;">
   <div class="panel-heading"><h3>民宿信息管理平台</h3></div> 
</div>
<div id="page-body">
<div class="panel panel-primary" id="login-head">
<div class="panel-heading">用户登录</div>
  <div class="panel-body">
    <div id="login-form">
	<form>
	  <div class="form-group">
	    <label for="exampleInputEmail1">用户名：</label>
	    <input type="userName" lay-verify="required|phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="请输入手机号">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">密码：</label>
	    <input type="password" lay-verify="required" class="form-control" id="password" placeholder="请输入密码">
	  </div>
	  <button type="submit" lay-submit class="btn btn-primary" id="loginBtn">登录</button>
	</form>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	$("#loginBtn").click(function(){
		var baseUrl = "${pageContext.request.contextPath}";
		$.ajax({
			url: baseUrl+"/login/do_login.do",
			type: "POST",
			data:{
				phone: $("#phone").val(),
				password: $("#password").val()
			},
			success:function(data){
				console.log(data);
				if (data.code!=0) {
					layer.msg(data.msg, function() {});
				} else {
					layer.msg("登陆成功");
					console.log(data.data);
					if (data.data == 0) {
						window.location.href=baseUrl+"/index.do";
					} else if (data.data == 1) {
						window.location.href=baseUrl+"/adminIndex.do";
					}
				}
			},
			error:function(data){
				console.log(data);
				layer.msg('服务异常', function() {});
			}
		});
		return false;
	})
});
</script>
</html>