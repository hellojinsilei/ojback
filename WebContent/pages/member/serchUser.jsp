<%@page import="java.util.List"%>
<%@page import="domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>后台管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/weadmin.css">
		<script src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
		
	</head>


	<body>
		<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">学生管理</a>
        <a>
          <cite>学生列表</cite></a>
      </span>
			<a class="layui-btn layui-btn-sm" href="ListUser" style="line-height:1.6em;margin-top:3px;float:right"  title="">
				<i class="layui-icon" style="line-height:30px" >&#x1002;</i></a>
		</div>
		<div id="testText">
		</div>
		<div class="weadmin-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search" action="SerchUser" method="post" id="reg_form">
					搜索
					<div class="layui-inline">
						<input class="layui-input" placeholder="学生ID" id="user_id" name="user_id">
					</div>
					<div class="layui-inline">
						<input class="layui-input" placeholder="邮箱" id="email" name="email">
					</div>
					<div class="layui-inline">
						<input type="text" id="account" name="account" placeholder="请输入用户名" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
					
				</form>
			</div>
			<div class="weadmin-block">
				<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
				<button class="layui-btn" onclick="WeAdminShow('添加用户','/ojback/pages/member/add.jsp',600,400)"><i class="layui-icon"></i>添加</button>
				<span class="fr" style="line-height:40px">共有数据88条</span>
			</div>
			
			<table class="layui-table" id="memberList">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
						</th>
						<th>id</th>
						<th>用户名</th>
						<th>昵称</th>
						<th>提交正确题数</th>
						<th>总完成题目数</th>
						<th>邮箱</th>
						<th>学校</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				

					<c:forEach var="U" items="${serchUser}"  > 

       <tr data-id="${U.user_id}">
						<td>
							<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1"><i class="layui-icon">&#xe605;</i></div>
						</td>
   					<td>${U.user_id}</td>
	       <td>${U.account}</td>
	       <td>${U.nickname}</td>
	       <td>${U.right_problem_count}</td>
	       <td>${U.have_done_problem}</td>
	       <td>${U.email}</td>
	       <td>台州学院</td>
			<td>2019-01-01 11:11:42</td>
	      <td class="td-status">
							<span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
						<td class="td-manage">
							<a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
								<i class="layui-icon">&#xe601;</i>
							</a>
							<a title="编辑" onclick="WeAdminEdit('编辑','/ojback/pages/member/edit.jsp', 1, 600, 400)" href="javascript:;">
								<i class="layui-icon">&#xe642;</i>
							</a>
							<a onclick="WeAdminShow('修改密码','/ojback/pages/member/password.jsp',600,400)" title="修改密码" href="javascript:;">
								<i class="layui-icon">&#xe631;</i>
							</a>
							<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
								<i class="layui-icon">&#xe640;</i>
							</a>
						</td>
	   </tr>

    </c:forEach> 

					
						
					
				</tbody>
			</table>
			<div class="page">
				<div>
					<a class="prev" href="">&lt;&lt;</a>
					<a class="num" href="">1</a>
					<span class="current">2</span>
					<a class="num" href="">3</a>
					<a class="num" href="">489</a>
					<a class="next" href="">&gt;&gt;</a>
				</div>
			</div>
		</div>
		
		
		<script>
			layui.extend({
				admin: '{/}../../static/js/admin'
			});
			layui.use(['laydate','jquery','admin'], function() {
				var laydate = layui.laydate,
					$ = layui.jquery,
					admin = layui.admin;
				//执行一个laydate实例
				laydate.render({
					elem: '#start' //指定元素
				});
				//执行一个laydate实例
				laydate.render({
					elem: '#end' //指定元素
				});
				
				/*用户-停用*/
	
				/*用户-删除*/
				function member_del(obj, id) {
					layer.confirm('确认要删除吗？', function(index) {
						//发异步删除数据
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon: 1,
							time: 1000
						});
					});
				}
	
				function delAll(argument) {
					var data = tableCheck.getData();
					layer.confirm('确认要删除吗？' + data, function(index) {
						//捉到所有被选中的，发异步进行删除
						layer.msg('删除成功', {
							icon: 1
						});
						$(".layui-form-checked").not('.header').parents('tr').remove();
					});
				}
			});
			
		</script>
		
	</body>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
</html>