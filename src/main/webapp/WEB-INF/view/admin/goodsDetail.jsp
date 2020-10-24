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
<title>GoodsInfo</title>

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
		#pageDiv{
			padding: 10px 0;
		}
		#pageTxT{
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

		var page =parseInt($("#pageTxT").text());
		var pageSize = 20;
		$("#last").click(function (){
			if (page>1){
				page --;
				$("#pageTxT").text(page);
				loadTable();

			}
		})
		var pageMax;
		$("#next").click(function (){

			if (page < pageMax){
				page ++;
				$("#pageTxT").text(page);
				loadTable();

			}


		})
		loadTable();
		getCount();
		$("#btn1").click(function (){
			loadTable();
		})
		function getCount(){
			$.ajax({
				url:"goodsCount.do",
				dataType:"json",
				type:"post",
				success:function (data){
					$("#ct").html(data["count"]) ;

					$("#page-ct").html(Math.ceil(data["count"]/pageSize));
					pageMax = Math.ceil(data["count"]/pageSize);
				}
			})
		}
		function loadTable(){
			$.ajax({
				url:"goodsInfo.do",
				dataType:"json",
				data:{"pageNum":page,"pageSize":pageSize},
				type:"post",
				success:function (data){
					$("#info").html("");
					$.each(data,function (i,n){
						$("#info").append("<tr>").
						append("<td>"+n.id+"</td>").
						append("<td>"+n.gname+"</td>").
						append("<td>"+n.goprice+"</td>").
						append("<td>"+n.grprice+"</td>").
						append("<td>"+n.gstore+"</td>").
						append("<td align='right' class='showImage'><a href='javascript:;'>图片</a> </td>").
						append("<td align='right'>"+n.goodstype_id+"</td>").
						append("</tr>")
					})
				}
			})
		}

		$("#info").on("click",".showImage",function (){

			var targetId = $(this).prevAll().eq(4).text();
			$.ajax({
				url:"getImg.do",
				dataType:"json",
				data: {"id":targetId},
				type:"post",
				success:function (data){
					var imPath = data['imPath'];
					$("#SI img").attr('src',"<%=basePath%>"+"statics/images/"+imPath);
					$("#SI").css({
						display:'block'
					})
				}
			})
		})
		$("#SI img").click(function (){
			$("#SI").css({
				display:'none'
			})
		})
	})
</script>
	<style>
		#SI{
			position: absolute;
			top: 180px;
			left: 250px;
			float: left;
			display: none;
			background-color: #90bfff;
			color: red;
			width: 400px;
			height: 300px;
			border: #5e7cbb 2px dashed;
		}
		#SI img{
			width: 400px;
			height: 300px;
			font-size: 10px;
		}
	</style>
</head>
<body>
<div id="SI">
	<img src="" alt="找不到照片">
</div>
<h3 align="center">共<span class="count" id="ct"></span>条&nbsp;&nbsp;&nbsp;&nbsp;
	共<span class="count" id="page-ct"></span>页</h3>
<div align="center">
	<table border="1px solid black">
		<thead>
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>原价</td>
			<td>折扣价</td>
			<td>库存</td>
			<td align='right'>图片</td>
			<td align='right'>类型</td>
		</tr>
		</thead>
		<tbody id="info">

		</tbody>

	</table>
	<div id="pageDiv">
		<input type="button" id="last" class="page" value="<">
		<span  id="pageTxT">1</span>
		<input type="button" id="next" class="page" value=">">

	</div>

</div>

</body>
</html>