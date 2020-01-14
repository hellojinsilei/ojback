<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
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
        <form class="layui-form" action="../../UpdateManager" method="post" id="reg_form">
         <div class="layui-form-item">
					<label for="account" class="layui-form-label">
		                <span class="we-red">*</span>用户名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="account" name="account" lay-verify="" autocomplete="" class="layui-input" value="123123">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请设置至少5个字符，将会成为您唯一的登录名
					</div>
				</div>

				<div class="layui-form-item">
					<label for="school" class="layui-form-label">
		                <span class="we-red">*</span>电话
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="tel" name="tel" lay-verify="" autocomplete="" class="layui-input" value="1781234016">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
		                <span class="we-red">*</span>邮箱
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="email" name="email" autocomplete="" class="layui-input" value="61123333@qq.com">
					</div>

				</div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="we-red">*</span>管理员密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  	请输入管理员密码6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="" lay-submit="">
                  修改信息
              </button>
          </div>
      </form>
    </div>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
    	layui.extend({
				admin: '{/}../../static/js/admin'
			});
	    layui.use(['form','layer','admin'], function(){
	      var form = layui.form,
	      	admin = layui.admin,
	      	layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("修改成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
        });
    </script>
  </body>

</html>