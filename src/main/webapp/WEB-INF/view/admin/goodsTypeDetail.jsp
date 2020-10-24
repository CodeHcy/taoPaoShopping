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
<title>GoodsTypeInfo</title>

	<style>
		*{
			margin: 0;
			padding: 0;
		}
		body{
			width: 800px;

		}
		table{
			width: 780px;
		}
		table thead{
			height: 25px;
		}
		table tbody{
			height: 15px;
		}
		#pageDiv1{
			padding: 10px 0;
		}
		#pageTxT1{
			font-size: 30px;

		}
		.page{
			font-size: 28px;
			border: #3f3f3f 1px solid;
			padding: 0 15px;
			margin: 0 10px;
			background-color: #5e7cbb;
		}
		.count{
			padding: 2px 5px;
			margin: 0 5px;
			font-size: 20px;
		}
	</style>
<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function (){

		var page =parseInt($("#pageTxT1").text());
		var pageSize = 20;
		loadTable();
		getCount();
		$("#last1").click(function (){
			if (page>1){
				page --;
				$("#pageTxT1").text(page);
				loadTable();
				getCount();
			}
		})
		var pageMax;
		$("#next1").click(function (){

			if (page < pageMax){
				page ++;
				$("#pageTxT1").text(page);
				loadTable();
				getCount();
			}
		})

		function getCount(){
			$.ajax({
				url:"goodsTypeCount.do",
				dataType:"json",
				type:"post",
				success:function (data){
					$("#ct1").html(data["count"]) ;
					$("#page-ct1").html(Math.ceil(data["count"]/pageSize));
					pageMax = Math.ceil(data["count"]/pageSize);
				}
			})
		}
		function loadTable(){
			$.ajax({
				url:"goodsTypeInfo.do",
				dataType:"json",
				data:{"pageNum":page,"pageSize":pageSize},
				type:"post",
				success:function (data){
					$("#info1").html("");
					$.each(data,function (i,n){
						$("#info1").append("<tr>").
						append("<td>"+n.id+"</td>").
						append("<td>"+n.typename+"</td>").
						append("<td align='right' class='del'>"+"<a href='javascript:;'>删除</a>"+"</td>").
						append("</tr>")
					})
				}
			})
		}
		$("#info1").on("click",".del",function (){
			if (confirm("确定删除")){
				$.ajax({
					url:"deleteType.do",
					data:{"id":parseInt($(this).prevAll().eq(1).text())},
					type:"post",
					success:function (data){
						alert(data["msg"]);
						loadTable();
						getCount();
					}
				})
			}
		})
	})
</script>
</head>
<body>
<h3 align="center">共<span class="count" id="ct1"></span>条&nbsp;&nbsp;&nbsp;&nbsp;
	共<span class="count" id="page-ct1"></span>页</h3>
<div align="center">
<%--	<input type="button" id="btn1" value="提交查询">--%>
	<table border="1px solid black">
		<thead>
		<tr>
			<td>类型编号</td>
			<td>类型名</td>
			<td align="right">操作</td>
		</tr>
		</thead>
		<tbody id="info1">

		</tbody>

	</table>
	<div id="pageDiv1">
		<input type="button" id="last1" class="page" value="<">
		<span  id="pageTxT1">1</span>
		<input type="button" id="next1" class="page" value=">">

	</div>

</div>


</body>
</html>