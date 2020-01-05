<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/index.do">今日订单</a>
				</li>
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/order/to_orderList.do">订单</a>
				</li>
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/customer/to_customerList.do">旅客</a>
				</li>
				<li class="layui-nav-item layui-this">
					<a>房间</a>
				</li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href=""> 王多多 </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">个人信息</a>
						</dd>
						<dd>
							<a href="">修改信息</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/cancellation.do">注销</a>
				</li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域 -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed">
						<a>订房</a>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a>退房</a>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a id="addRoom">添加房间</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 主体内容 -->
			<div style="padding: 15px;">
				<table class="layui-hide" id="test" lay-filter="test"></table>
			</div>
		</div>

		<div class="layui-footer">已入住房间：3间</div>
	</div>
	<div id="myForm" style="display: none; width: 350px;">
		<form class="layui-form" lay-filter="formTest">
			<div class="layui-form-item">
			  <label class="layui-form-label">房间号：</label>
			  <div class="layui-input-block">
			    <input type="text" name="roomNum" required  lay-verify="required|number" placeholder="房间号" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">房间名称：</label>
			  <div class="layui-input-block">
			    <input type="text" name="roomName" required  lay-verify="required" placeholder="房间名称" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">可住人数：</label>
			  <div class="layui-input-block">
			    <input type="text" name="availableNum" required  lay-verify="required|number" placeholder="可住人数" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">床型：</label>
			  <div class="layui-input-block">
			    <select name="bedType">
			      <option value="1">单人床</option>
			      <option value="2">大床</option>
			    </select>
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">床的数量：</label>
			  <div class="layui-input-block">
			    <input type="text" name="bedNum" required  lay-verify="required|number" placeholder="有几张床" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">窗户：</label>
			  <div class="layui-input-block">
			    <input type="text" name="window" required  lay-verify="required|number" placeholder="窗户数量" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-form-item">
			  <label class="layui-form-label">价格：</label>
			  <div class="layui-input-block">
			    <input type="text" name="price" required  lay-verify="required|number" placeholder="单价（元/天）" autocomplete="off" class="layui-input">
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
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script>
	function addOrUpdateRoom(data) {
		var baseUrl = "${pageContext.request.contextPath}";
		var target = data.id?"/room/update_room.do":"/room/add_room.do";
		$.ajax({
			url: baseUrl+target,
			type: "POST",
			data:{
				"id": data.id
				,"roomNum": data.roomNum
				,"roomName": data.roomName
				,"availableNum": data.availableNum
				,"bedType": data.bedType
				,"bedNum": data.bedNum
				,"window": data.window
				,"price": data.price
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
		layui.use('element', function() {
			var element = layui.element;

		});
		layui.use('table', function() {
			var table = layui.table;
			var bed = ["单人床", "大床"];

			table.render({
				elem : '#test',
				url : '${pageContext.request.contextPath}/room/list_rooms.do',
				toolbar : '<div>房间管理</div>',
				title : '房间管理',
				parseData : function(res) {
					return {
						"code" : res.code, //解析接口状态
						"msg" : res.msg, //解析提示文本
						"data" : res.data.rooms//解析数据列表
					};
				},
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : 'ID',
					fixed : 'left',
					unresize : true,
					sort : true
				}, {
					field : 'roomNum',
					title : '房间号'
				}, {
					field : 'roomName',
					title : '名称'
				}, {
					field : 'availableNum',
					title : '可住人数',
					templet: function(d){
					   return d.availableNum + '人';
					}
				}, {
					field : 'bedType',
					title : '床型',
					templet: function(d){
					   return bed[d.bedType-1];
					}
				}, {
					field : 'bedNum',
					title : '几张床',
					templet: function(d){
					   return d.bedNum + '张';
					}
				}, {
					field : 'window',
					title : '窗户',
					templet: function(d){
						return d.window + '扇';
					}
				}, {
					field : 'price',
					title : '价格（元/日）'
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo'
				} ] ],
				page : true
			});

			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				var form = layui.form;
				if (obj.event === 'del') {
					layer.confirm('确定删除？', function(index) {
						deleteRoom(data.id);
						obj.del();
						layer.close(index);
					});
				} else if (obj.event === 'edit') {
					layer.open({
						type : 1,
						title:'修改房间信息',
						area: '400px',
						content : $('#myForm'),
						success: function(layero, index){
							form.val("formTest", {
								"roomNum": data.roomNum
								,"roomName": data.roomName
								,"availableNum": data.availableNum
								,"bedType": data.bedType
								,"bedNum": data.bedNum
								,"window": data.window
								,"price": data.price
							});
						}
					});
					form.on('submit(*)', function(formData) {
						formData.field.id = data.id;
						console.log(formData.field);
						addOrUpdateRoom(formData.field); 
					});
					/* form = null; */
				}
			});
			function deleteRoom(id) {
				var baseUrl = "${pageContext.request.contextPath}";
				$.ajax({
					url: baseUrl+"/room/delete_room.do",
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
		});
	$(function() {
			$("#addRoom").click(function() {
				var form = layui.form;
				layer.open({
					type : 1,
					title:'添加房间',
					area: '400px',
					content : $('#myForm'),
					shadeClose:true,
					success: function(layero, index){
						form.val("formTest", {
							"roomNum": ""
							,"roomName": ""
							,"availableNum": ""
							,"bedType": ""
							,"bedNum": ""
							,"window": ""
							,"price": ""
						})
					}
				});
				form.on('submit(*)', function(data){
					addOrUpdateRoom(data.field);
				});
				form = null;
			});
		})
</script>
</body>
</html>





















