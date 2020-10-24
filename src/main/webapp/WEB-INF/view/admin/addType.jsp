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
	<base href="<%=basePath%>" />
<title>addGoods.jsp</title>
	<style type="text/css">
		* {
			margin: 0px;
			padding: 0px;
		}
		html{
			background-color: #dbeaff;
		}
		body {
			width: 750px;
			height: 450px;
			background-color: #c5e4ff;
			font-family: Arial, Helvetica, sans-serif;
			font-size: 15px;
			margin: 0px auto;
			<%--background-image: url(<%=basePath%>/statics/images/admin/bb.jpg);--%>
		}
		div{
			position: relative;
			top: 55px;
			width: 450px;
			height: 300px;
			margin: 0 auto;
			border: 1px lightskyblue solid;
		}
		table{
			width: 450px;
			height: 300px;
		}
		.btn{
			width: 100px;
			height: 25px;
			background-color: #90bfff;

		}
		.btn:hover{
			background-color: #0f97ed;
		}
		.txt{
			width: 300px;
			height: 28px;
		}
		.ptxt{
			width: 300px;
			height: 28px;
		}
		.tdx{
			color: palevioletred;
			font-size: 15px;
			font-family: "Microsoft YaHei UI";
			text-align: right;
		}
		.bx{
			text-align: right;
			height: 30px;
		}
	</style>
	<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function (){
			$("#back").click(function (){
				location.href = "main.do";
			})
			$("#submit").click( function (){
				var typename1 = {
					"typename":$("#typename").val()
				}
				$.ajax({
					url:"addType.do",
					dataType:"json",
					contentType:'application/json',
					data:JSON.stringify(typename1),
					type:"post",
					success:function (data){
							alert(data["msg"]);
						$("#typename").val("");
					}
				})
			})

		})
	</script>
</head>    
<body>
<h2 align="center">添加商品</h2>
<div>
	<form action="" method="post" >
		<table>
			<tr>
				<td class="tdx">类型名称<span style="color: red">*</span></td>
				<td class="ptxt">
					<input type="text" class="txt" id="typename">
				</td>

			</tr>


			<tr>
				<td colspan="2" class="bx">
					<input type="button" class="btn"  id="submit" value="提交"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="bx">
					<input  type="button" class="btn" id="back" value="返回"/>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>
