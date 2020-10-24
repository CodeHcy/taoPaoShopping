<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath =   request.getScheme()+
			"://"+
			request.getServerName()+
			":"+
			request.getServerPort()+
			request.getContextPath()+
			"/";
	String username = (String) request.getSession().getAttribute("username");
	request.getSession().setAttribute("username",username);
%>
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0 ;
	padding: 0 ;
}
html{
	background-color: #dbeaff;
}
body {
	position: relative;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0 auto;
	height: auto;
	width: 800px;
	border: 1px solid #006bd0;
	background-color: #c5e4ff;
}

#header {
	height: 90px;
	width: 800px;
	margin: 0 0 3px 0;
}

#header h1 {
	text-align: center;
	font-family: 华文楷体, serif;
	color: #000000;
	font-size: 30px;
}

#navigator {
	height: 25px;
	width: 800px;
	font-size: 14px;

}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;

}
#navigator li a {
	color: #000000;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 131px;
	height: 22px;
	text-align: center;
	background-color: #5e7cbb;
	margin-left: 2px;
}
#navigator li a:hover {
	background-color: #006bd0;
	color: #FFFFFF;
}
#navigator ul li ul {
   visibility: hidden;
   position: absolute;
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}
#content {
	height: 700px;
	width: 780px;
	padding: 10px;
	display: block;
}
#content1 {
	height: 700px;
	width: 780px;
	padding: 10px;
	display: none;
}
#content2 {
	height: 700px;
	width: 780px;
	padding: 10px;
	display: none;
}
#content3 {
	height: 700px;
	width: 780px;
	padding: 10px;
	display: none;
}
#content4 {
	height: 700px;
	width: 780px;
	padding: 10px;
	display: none;
}

#footer {
	position: absolute;
	bottom: 0;
	height: 30px;
	width: 780px;
	line-height: 2em;
	text-align: center;
	background-color: #5e7cbb;
	padding: 10px;
}
#ftb{
	background: #006acc;
}

</style>
	<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function (){
			$("#ftb").click(function (){
				$(this).parent("li").siblings("li").children("a").css({
					backgroundColor: '#5e7cbb',
					color: '#000000'
				})
				$(this).css({
					backgroundColor: '#006bd0',
					color:	'#FFFFFF'
				})
				$("#content").css({
					display:"block"
				})
				$("#content1").css({
					display:"none"
				})
				$("#content2").css({
					display:"none"
				})
				$("#content3").css({
					display:"none"
				})
				$("#content4").css({
					display:"none"
				})
			})
			$("#type").click(function (){
				$(this).parent("li").siblings("li").children("a").css({
					backgroundColor: '#5e7cbb',
					color: '#000000'
				})
				$(this).css({
					backgroundColor: '#006bd0',
					color:	'#FFFFFF'
				})
				$("#content").css({
					display:"none"
				})
				$("#content1").css({
					display:"block"
				})
				$("#content2").css({
					display:"none"
				})
				$("#content3").css({
					display:"none"
				})
				$("#content4").css({
					display:"none"
				})
			})
			$("#users").click(function (){
				$(this).parent("li").siblings("li").children("a").css({
					backgroundColor: '#5e7cbb',
					color: '#000000'
				})
				$(this).css({
					backgroundColor: '#006bd0',
					color:	'#FFFFFF'
				})
				$("#content").css({
					display:"none"
				})
				$("#content1").css({
					display:"none"
				})
				$("#content2").css({
					display:"block"
				})
				$("#content3").css({
					display:"none"
				})
				$("#content4").css({
					display:"none"
				})
			})
			$("#ddlist").click(function (){
				$(this).parent("li").siblings("li").children("a").css({
					backgroundColor: '#5e7cbb',
					color: '#000000'
				})
				$(this).css({
					backgroundColor: '#006bd0',
					color:	'#FFFFFF'
				})
				$("#content").css({
					display:"none"
				})
				$("#content1").css({
					display:"none"
				})
				$("#content2").css({
					display:"none"
				})
				$("#content3").css({
					display:"block"
				})
				$("#content4").css({
					display:"none"
				})
			})
			$("#gglist").click(function (){
				$(this).parent("li").siblings("li").children("a").css({
					backgroundColor: '#5e7cbb',
					color: '#000000'
				})
				$(this).css({
					backgroundColor: '#006bd0',
					color:	'#FFFFFF'
				})
				$("#content").css({
					display:"none"
				})
				$("#content1").css({
					display:"none"
				})
				$("#content2").css({
					display:"none"
				})
				$("#content3").css({
					display:"none"
				})
				$("#content4").css({
					display:"block"
				})
			})
		})
	</script>
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎${username}进入后台管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a id="ftb" href="javascript:;" style="background-color: #006bd0;color: #FFFFFF;">商品管理</a>
				<ul>
					<li><a href="addGoods.do" target="center">添加商品</a></li>
					<li><a href="GoChangeGoods.do" target="center">变更商品</a></li>

					<li><a href="javascript:;" target="center">查询商品</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" id="type">类型管理</a>
				<ul>
					<li><a href="GoaddType.do" target="center">添加类型</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" id="users">用户管理</a>
				<ul>
					<li><a href="javascript:;" target="center">删除用户</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" id="ddlist">订单管理</a>
				<ul>
					<li><a href="javascript:;" target="center">删除订单</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" id="gglist">公告管理</a>
				<ul>
					<li><a href="GoaddNotice.do" target="center">添加公告</a></li>
				</ul>
			</li>
			<li><a href="exit.do">安全退出</a></li>
		</ul>
		
	</div>

	<div id="content">
	<jsp:include page="goodsDetail.jsp" />
	</div>
	<div id="content1">
		<jsp:include page="goodsTypeDetail.jsp" />
	</div>
	<div id="content2">
		<jsp:include page="userList.jsp" />
	</div>
	<div id="content3">
		<jsp:include page="orderDetail.jsp" />
	</div>
	<div id="content4">
		<jsp:include page="noticeDetail.jsp" />
	</div>
	<div id="footer">©161骑兵连</div>

</body>
</html>


