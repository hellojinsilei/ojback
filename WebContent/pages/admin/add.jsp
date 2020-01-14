<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加会员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../../static/css/font.css">
		<link rel="stylesheet" href="../../static/css/weadmin.css">
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>

	<body>
		<div class="weadmin-body">
			<form class="layui-form" action="../../Addmanager" method="post" id="reg_form">
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label">
		                <span class="we-red">*</span>用户名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="account" name="account" lay-verify="" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请设置至少5个字符，将会成为您唯一的登录名
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label">
		                <span class="we-red">*</span>昵称
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="nickname" name="nickname" lay-verify="" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请设置至少5个字符，将会成为您唯一的登录名
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
		                <span class="we-red">*</span>电话
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="tel" name="tel" lay-verify="" autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
		                <span class="we-red">*</span>邮箱
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="email" name="email" autocomplete="off" class="layui-input">
					</div>

				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label">
                  <span class="we-red">*</span>密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="password" name="password" lay-verify="required|pass" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						6到16个字符
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
                  <span class="we-red">*</span>确认密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="L_repass" name="repass" lay-verify="required|repass" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
              </label>
					<button class="layui-btn" lay-filter="" lay-submit="" onclick="checkDate()">确定</button>
				</div>
			</form>
		</div>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
		
		<script>
			function checkData() {
			
			//1.获取用户名， 密码   确认密码
		    var username =  document.getElementById("username");
		    var pwd =  document.getElementById("password");
		    var pwd2 =  document.getElementById("L_repass");
		    
		    //2.判断输入的内容不能为空
		    if(username.value==""){
		    	alert("请输入用户名");
		    	return;
		    }
		    if(pwd.value==""){
		    	alert("请输入密码");
		    	return;
		    }
		    if(pwd2.value==""){
		    	alert("请再次输入密码");
		    	return;
		    }
		    
		    //3。两次密码是否一样
		    if(pwd.value == pwd2.value){
		    	//发送请求  form  获取form
		    	var form =  document.getElementById("reg_form");
		    	form.submit();//通过js提交表单 执行action
		    }else{
		    	alert("两次输入的密码不一样");
		    }
		    
		}
			layui.extend({
				admin: '{/}../../static/js/admin'
			});
			layui.use(['form', 'jquery','util','admin', 'layer'], function() {
				var form = layui.form,
					$ = layui.jquery,
					util = layui.util,
					admin = layui.admin,
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
						if($('#password').val() != $('#L_repass').val()) {
							return '两次密码不一致';
						}
						else
							{
							form.submit();//通过js提交表单 执行action
							alert("添加成功");
							}
					}
				});
				//失去焦点时判断值为空不验证，一旦填写必须验证
				$('input[name="email"]').blur(function(){
					//这里是失去焦点时的事件
					if($('input[name="email"]').val()){
						$('input[name="email"]').attr('lay-verify','email');
					}else{
						$('input[name="email"]').removeAttr('lay-verify');
					}
				});

				//监听提交
				

			});
		</script>
	</body>

</html>