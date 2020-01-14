<%@page import="java.util.List"%>
<%@page import="domain.Problem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>文章列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="Description" content="基于layUI数据表格操作"/>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
		<script src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
		<style type="text/css">
			.layui-form-switch {
				width: 55px;
			}			
			.layui-form-switch em {
				width: 40px;
			}			
			.layui-form-onswitch i {
				left: 45px;
			}
			body{overflow-y: scroll;}
		</style>
	</head>

	<body>
		<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">题目管理</a>
        <a>
          <cite>题目列表</cite></a>
      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="ListProblem" title="刷新">
				<i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
		</div>
		<div class="weadmin-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search" action="SerchProblem" method="post" id="reg_form">
					题目搜索：
					
					<div class="layui-inline">
						<input class="layui-input" type="text" placeholder="题目名称" id="problem_name" name="problem_name">
					</div>
					<div class="layui-inline">
						<input class="layui-input" placeholder="创建者ID" id="problem_creator_id" name="problem_creator_id">
					</div>
					<div class="layui-inline">
						<input type="text" name="keyword" placeholder="请输入关键字" autocomplete="off" class="layui-input" id="problem_name" name="problem_name">
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
				</form>
			</div>
			<div class="weadmin-block demoTable">
				<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>

				<button class="layui-btn" onclick="WeAdminShow('添加用户','/ojback/pages/article/add.jsp',1200,700)"><i class="layui-icon">&#xe61f;</i>添加</button>
				<span class="fr" style="line-height:40px">共有数据：88 条</span>
			</div>
			<table class="layui-hide" id="articleList"></table>

<table class="layui-table" id="memberList">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
						</th>
						<th>题目名称</th>
						<th>题目创建者编号</th>
						<th>题目难度</th>
						<th>题目价值</th>
						<th>总答对人数</th>	
						<th>总提交人数</th>				
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				

					<c:forEach var="U" items="${serchProblem}"> 

       		<tr data-id="${U.problem_id}">
						<td>
							<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1"><i class="layui-icon">&#xe605;</i></div>
						</td>
   					
	       <td>${U.problem_name}</td>
	       <td>${U.problem_creator_id}</td>
	       <td>${U.problem_difficulty}</td>
	       <td>${U.problem_value}</td>
	        <td>${U.total_right_count}</td>
	       <td>${U.total_submit_count}</td>      
	      <td class="td-status">
							<span class="layui-btn layui-btn-normal layui-btn-xs">已上传</span></td>
						<td class="td-manage">
							<a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 2, 600, 400)" href="javascript:;">
					<i class="layui-icon">&#xe642;</i>
				</a>
				<a title="查看" onclick="WeAdminShow('查看文章','./show.html',600,400)" href="javascript:;">
					<i class="layui-icon">&#xe63c;</i>
				</a>
				<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
					<i class="layui-icon">&#xe640;</i>
				</a>
						</td>
	   </tr>

    </c:forEach> 

					
						
					
				</tbody>
			</table>
			<script type="text/html" id="recommendTpl">
				<input type="checkbox" name="zzz" lay-skin="switch" lay-text="已推荐|未推荐" {{d.recommend}}>
			</script>
			<script type="text/html" id="topTpl">
				<input type="checkbox" name="show" lay-skin="switch" lay-text="已置顶|未置顶" {{d.top}}>
			</script>
			<script type="text/html" id="reviewTpl">
			  <!-- 这里的 checked 的状态只是演示 -->
			  <input type="checkbox" name="lock" value="{{d.id}}" title="锁定" lay-filter="lockDemo" {{ d.id == 1 ? 'checked' : '' }}>
			</script>

			<script type="text/html" id="operateTpl">
				<a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 2, 600, 400)" href="javascript:;">
					<i class="layui-icon">&#xe642;</i>
				</a>
				<a title="查看" onclick="WeAdminShow('查看文章','./show.html',600,400)" href="javascript:;">
					<i class="layui-icon">&#xe63c;</i>
				</a>
				<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
					<i class="layui-icon">&#xe640;</i>
				</a>
			</script>
		

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
	
		<script src="${pageContext.request.contextPath }/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
			<script src="list.js" type="text/javascript" charset="utf-8"></script>
</html>