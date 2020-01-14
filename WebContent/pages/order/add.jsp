<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加订单-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../../static/css/font.css">
		<link rel="stylesheet" href="../../static/css/weadmin.css">
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>

	<body>
		<div class="weadmin-body">
			<form class="layui-form" action="../../AddCompetition" method="post" id="reg_form">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>比赛名称
              </label>
					<div class="layui-input-inline">
						<input type="text" id="competition_name" name="competition_name" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>开始时间
              </label>
					<div class="layui-input-inline">
						<input type="text" id="start" name="start" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label">
                  <span class="we-red">*</span>结束时间
              </label>
					<div class="layui-input-inline">
						<input type="text" id="end" name="end" required="" lay-verify="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>参赛人数
              </label>
					<div class="layui-input-inline">
						<input type="text" id="competition_players_count" name="competition_players_count" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item layui-form-text">
			<label for="desc" class="layui-form-label">比赛描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" id="competition_description" name="competition_description" class="layui-textarea"></textarea>
			</div>
			</div>
		
		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label">
              </label>
			<button class="layui-btn" lay-filter="" lay-submit="" onclick="checkDate()">增加</button>
		</div>
		</form>
		</div>
		<script>
			function checkData() {
			
			//1.获取用户名， 密码   确认密码
		  

		    	//发送请求  form  获取form
		    	var form =  document.getElementById("reg_form");
		    	form.submit();//通过js提交表单 执行action
		 
		    
		}
			layui.extend({
				admin: '{/}../../static/js/admin'
			});
			layui.use(['form', 'admin', 'jquery', 'table', 'layer'], function() {
				var form = layui.form,
					admin = layui.admin,
					$ = layui.jquery,
					table = layui.table,
					layer = layui.layer;

				//自定义验证规则
				form.verify({
					nikename: function(value) {
						if(value.length < 5) {
							return '昵称至少得5个字符啊';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					repass: function(value) {
						if($('#L_pass').val() != $('#L_repass').val()) {
							return '两次密码不一致';
						}
					}
				});

				//监听提交
				form.on('submit(add)', function(data) {
					console.log(data);
					//发异步，把数据提交给php
					layer.alert("增加成功", {
						icon: 6
					}, function() {
						// 获得frame索引
						var index = parent.layer.getFrameIndex(window.name);
						//关闭当前frame
						parent.layer.close(index);
					});
					return false;
				});
				
				var num = 3;

			window.addTable = function() {
				var tableHtml = "";
				tableHtml += '<tr id="tr' + num + '">' +
					'<td>'+num+'</td>' +
					'<td><div class="layui-input-inline"><input type="text" name="canshu1" class="layui-input"></div></td>' +
					'<td><div class="layui-input-inline"><input type="text" name="canshu2" class="layui-input"></div></td>' +
					'<td><a style="cursor: pointer; color: blue;" onclick="removeTr(' + num + ')">删除</a>' +
					'</td>' +
					'</tr>';
//				tableHtml +='<tr>'+
//								'<td>2</td>'+
//								'<td>haier海尔 BC-93TMPF 93升单门冰箱</td>'+
//								'<td>0.01</td>'+
//								'<td>984</td>'+
//								'<td>9.84</td>'+
//								'<td><a style="cursor: pointer; color: blue;" onclick="removeTr(2)">删除</a></td>'+
//							'</tr>';

				var elements = $("#myTable").children().length; //表示id为“mtTable”的标签下的子标签的个数

				$("#myTable").children().eq(elements - 1).after(tableHtml); //在表头之后添加空白行
				num++;
			}
			//删除行
			function removeTr(trNum) {
				$("#tr" + trNum).remove();
			}

			});
		</script>
	</body>

</html>