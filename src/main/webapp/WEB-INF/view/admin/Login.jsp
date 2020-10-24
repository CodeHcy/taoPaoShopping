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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>login</title>
	<style>
		body {
			/* 设置边距，可以设置四个方向，分别是 上 右 下 左  */
			margin: 0;
			/* 填充  也是可以设置四个方向，同上 */
			padding: 0;
			/* 设置字体风格 */
			font-family: sans-serif;
			/* 设置背景颜色 */
			background: lightsteelblue;
		}
		.box {
			width: 300px;
			padding: 40px;
			/* 绝对定位，通过这个可以使元素放在页面的任何一个位置上 */
			position: absolute;
			/* 以下三行代码实现了块元素在百分比下居中 可以参考： https://www.cnblogs.com/knuzy/p/9993181.html */
			top: 50%;
			left: 50%;
			transform: translate(-50% , -50%);
			/* 设置登陆界面的背景颜色 */
			background-color: cornflowerblue;
			/* 规定标签中元素属性为 text 的居中 */
			text-align: center;
		}

		.box h1 {
			color: #349;
			/* 控制文本大小写 */
			text-transform: uppercase;
			font-size: 20px;
		}

		/* 选中输入账号密码的框框 */
		.box input[type="text"],
		.box input[type="password"] {
			border: 0;
			background: none;
			display: block;
			/* 第一个参数定上下 20px 第二个auto自动适配 */
			margin: 20px auto;
			/* 文本居中 */
			text-align: center;
			/* 设置边框大小和颜色 */
			border: 2px solid #3498db;
			/* 两个参数分别对应 高 和 宽 */
			padding: 14px 10px;
			/* 设置边框为宽 */
			width: 200px;
			/* 边框对应的属性分别有三个 https://www.w3school.com.cn/cssref/pr_outline.asp */
			outline: none;
			color: white;
			/* 边框的半径 更圆润*/
			border-radius: 24px;
			/* 设置动画的过渡时间 */
			transition: 0.25s;
		}

		/* 设置变化后的界面 */
		.box input[type="text"]:focus,
		.box input[type="password"]:focus {
			width: 280px;
			border-color: #2ecc71;
		}

		.box input[type="submit"] {
			border: 0;
			background: none;
			display: block;
			margin: 20px auto;
			text-align: center;
			border: 2px solid #2ecc71;
			padding: 14px 40px;
			outline: none;
			color: black;
			border-radius: 24px;
			transition: 0.25s;
		}

		.box input[type="button"]:hover {
			background: #2ecc71;
		}

	</style>

</head>
<body>

<form action="admin/test.do" method="get" class="box">
	<h1>登录后台管理系统</h1>
	<h3>${msg}</h3>
	<input type = "text" name ="aname" placeholder="用户名" >
	<input type = "text" name="apwd" placeholder="密码">
	<input type="submit"  value = "登录">
</form>
</body>
</html>

