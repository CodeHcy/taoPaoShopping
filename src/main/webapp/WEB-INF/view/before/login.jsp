<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath =   request.getScheme()+
			"://"+
			request.getServerName()+
			":"+
			request.getServerPort()+
			request.getContextPath()+
			"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/before/style.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/favicon.ico">
	<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">

	</script>
</head>
<body>
<section>

	<!-- 登录 -->

	<div class="container">
		<div class="user singinBx">
			<div class="imgBx"><img src="<%=basePath%>/statics/images/1.png" alt=""></div>
			<div class="formBx">
				<form action="index/loginTest.do" method="post">
					<h2>登录</h2>
					<h3>${msg}</h3>
					<input type="text" name="bemail" placeholder="邮箱">
					<input type="password" name="bpwd" placeholder="密码">
					<input type="submit" id="login" value="登录">
					<p class="signup">没有账号？<a href="javascript:;" onclick="topggleForm();">注册</a></p>
				</form>
			</div>
		</div>

		<!-- 注册 -->

		<div class="user singupBx">
			<div class="formBx">
				<form action="index/register.do" >
					<h2>注册</h2>
					<h3>${msg}</h3>
					<input type="email" name="bemail" placeholder="邮箱地址">
					<input type="password" name="bpwd" placeholder="密码">
					<input type="password" name="rebpwd" placeholder="再次输入密码">
					<input type="submit" id="zhuCe" value="注册">
					<p class="signup">已有账号？<a href="javascript:;" onclick="topggleForm();">登录</a></p>
				</form>
			</div>
			<div class="imgBx"><img src="<%=basePath%>/statics/images/2.png" alt=""></div>
		</div>

	</div>
</section>
<script type="text/javascript">
	function topggleForm(){
		var container = document.querySelector('.container');
		container.classList.toggle('active');
	}
</script>
</body>
</html>


