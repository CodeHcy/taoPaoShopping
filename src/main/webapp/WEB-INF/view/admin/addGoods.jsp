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
			loadType();
			$("#back").click(function (){
				location.href = "main.do";
			})
			$("#reset").click(function (){
				$("#gname").val("");
				$("#goprice").val("");
				$("#grprice").val("");
				$("#gstore").val("");
				$("#gpicture").val("");
				$("#GoodsType").val(0);
			})
			$("#submit").click( function (){
				var good = {
					"gname":$("#gname").val(),
					"goprice":$("#goprice").val(),
					"grprice":$("#grprice").val(),
					"gstore":$("#gstore").val(),
					"gpicture":$("#gpicture").val(),
					"goodstype_id":$("#GoodsType").val()
				}
				$.ajax({
					url:"addGoodsInfo.do",
					dataType:"json",
					contentType:'application/json',
					data:JSON.stringify(good),
					type:"post",
					success:function (data){
						if(data["res"]==1){
							alert(data["msg"]);

						}else if(data["res"]==0){
							alert(data["msg"]);

						}else {
							alert(data["msg"]);

						}
					}
				})

			})
			function loadType(){
				$.ajax({
					url:"loadType.do",
					dataType:"json",
					type:"post",
					success:function (data){

						$.each(data,function (i,n){
							$("#GoodsType").append("<option value="+n.id+">"+n.typename+"</option>")
						})
					}
				})
			}

		})
	</script>
</head>    
<body>
<h2 align="center">添加商品</h2>
<div>
	<form action="" method="post" >
		<table>
			<tr>
				<td class="tdx">名称<span style="color: red">*</span></td>
				<td class="ptxt">
					<input type="text" class="txt" id="gname">

				</td>
			</tr>
			<tr>
				<td class="tdx">原价<span style="color: red">*</span></td>
				<td class="ptxt">
					<input type="text" class="txt" id="goprice">
				</td>

			</tr>
			<tr>
				<td class="tdx">折扣价<span style="color: red">*</span></td>
				<td class="ptxt">
					<input type="text" class="txt" id="grprice">


				</td>

			</tr>
			<tr>
				<td class="tdx">库存<span style="color: red">*</span></td>
				<td class="ptxt">
					<input type="text" class="txt" id="gstore">


				</td>

			</tr>
			<tr>
				<td class="tdx">图片<span style="color: red">*</span></td>
				<td class="ptxt">

					<input type="text" id="gpicture" class="txt">
				</td>

			</tr>
			<tr>
				<td class="tdx">类型<span style="color: red">*</span></td>
				<td class="ptxt">
					<%--				用ajax动态获取--%>
					<select name="GoodsType" class="txt" id="GoodsType">
						<option value="0">商品类型</option>

					</select>

				</td>

			</tr>

			<tr>

				<td class="bx">
					<input type="button"  class="btn" id="reset" value="重置"/>
				</td>
				<td class="bx">
					<input type="button" class="btn"  id="submit" value="提交"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="bx">
					<input type="button" class="btn" id="back" value="返回"/>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>
