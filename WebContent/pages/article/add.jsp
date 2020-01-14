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
			<form class="layui-form" action="../../AddProblem" method="post" id="reg_form">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>题目名称
              </label>
					<div class="layui-input-inline">
						<input type="text" id="problem_name" name="problem_name" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>时间限制
              </label>
					<div class="layui-input-inline">
						<input type="text" id="time_limit" name="time_limit" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label">
                  <span class="we-red">*</span>内存限制
              </label>
					<div class="layui-input-inline">
						<input type="text" id="memory_limit" name="memory_limit" required="" lay-verify="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>题目难度
              </label>
					<div class="layui-input-inline">
						<input type="text" id="problem_difficulty" name="problem_difficulty" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>题目价值
              </label>
					<div class="layui-input-inline">
						<input type="text" id="problem_value" name="problem_value" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  <span class="we-red">*</span>题目类别
              </label>
					<div class="layui-input-inline">
						<select name="contrller">
							<option>基础</option>
							<option>动态规划</option>
							<option>搜索</option>
							<option>贪心</option>
							<option>其他</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
			<label for="desc" class="layui-form-label">题目描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
			</div>
			</div>
				<div class="layui-form-item layui-form-text">
					<label for="desc" class="layui-form-label">测试数据
						<a class="layui-btn layui-btn-sm layui-btn-primary" onclick="addTable();"><i class="layui-icon">&#xe608;</i> 添加</a>
					</label>
				<div class="layui-input-block">
					<table class="layui-table" id="myTable">
						<thead>
							<tr>
								<th>id</th>
								<th>输入样例</th>
								<th>输出样例</th>
								<th>操作</th>
							</tr>
							
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>1 2</td>
								<td>3</td>
								<td>
									<a style="cursor: pointer; color: blue;" onclick="removeTr(1)">删除</a>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>4 5</td>
								<td>9</td>

								<td>
									<a style="cursor: pointer; color: blue;" onclick="removeTr(2)">删除</a>
								</td>
							</tr>
						</tbody>
					</table>
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