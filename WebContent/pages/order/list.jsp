<%@page import="java.util.List"%>
<%@page import="domain.Competition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>订单列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/weadmin.css">
		<script src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>

	<body>
		<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">比赛管理</a>
        <a><cite>比赛列表</cite></a>
      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="weadmin-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search" action="SerchCompetition" method="post" id="reg_form">
				<div class="layui-inline">
						<input class="layui-input" placeholder="比赛名称" name="competition_name" id="competition_name" type="text">
					</div>
				<div class="layui-inline">
						<input class="layui-input" placeholder="开始日" name="start" id="start">
					</div>
					
					<div class="layui-inline">
						<input class="layui-input" placeholder="截止日" name="end" id="end">
					</div>
					
					<div class="layui-inline">
						<input type="text" id="competition_id" name="competition_id" placeholder="请输入比赛ID" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
				</form>
			</div>
			<div class="weadmin-block">
				<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
				<button class="layui-btn" onclick="WeAdminShow('创建比赛','/ojback/pages/order/add.jsp')"><i class="layui-icon"></i>添加</button>
			
			</div>
			<table class="layui-table">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
						</th>
						<th>赛程编号</th>
						<th>赛程名称</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>参赛人数</th>
						<th>赛程状态</th>
						<th>创建时间</th>					
						<th>发布状态</th>
						<th>创建人</th>
						<th>赛程描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="U" items="${competitionAll}"  > 

      			 <tr data-id="${U.competition_id}">
						<td>
							<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1"><i class="layui-icon">&#xe605;</i></div>
						</td>
   			 <td>${U.competition_id}</td>		
	       <td>${U.competition_name}</td>
	       <td>${U.start}</td>
	       <td>${U.end}</td>
	       <td>${U.competition_players_count}</td>
	       <td>未开始</td>
	       <td>2019-05-10 11:11:42</td>
			<td>已发布</td>
			<td>1</td>
			<td>${U.competition_description}</td>
	     	<td class="td-manage">
							
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
					
					<span class="current">1</span>

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
				function member_stop(obj, id) {
					layer.confirm('确认要停用吗？', function(index) {
						if($(obj).attr('title') == '启用') {
							//发异步把用户状态进行更改
							$(obj).attr('title', '停用')
							$(obj).find('i').html('&#xe62f;');
	
							$(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
							layer.msg('已停用!', {
								icon: 5,
								time: 1000
							});
	
						} else {
							$(obj).attr('title', '启用')
							$(obj).find('i').html('&#xe601;');
	
							$(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
							layer.msg('已启用!', {
								icon: 5,
								time: 1000
							});
						}
					});
				}
	
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
		<script src="${pageContext.request.contextPath }/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
</html>