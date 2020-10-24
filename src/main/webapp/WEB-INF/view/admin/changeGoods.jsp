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
    <title>selectGoods.jsp</title>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		html{
			background-color: #dbeaff;
		}
		body{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			margin: 0 auto;
			height: 800px;
			width: 800px;
			border: 1px solid #006bd0;
			background-color: #c5e4ff;
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
		.sp{
			color: red;
			font-size: 20px;
		}
		#inp{
			z-index:99;
			position: absolute;
			float: left;
			top: 100px;
			left: 615px;
			display: none;
			width: 337px;
			height: 216px;
			padding: 10px 20px;
			background: #90bfff;
		}
		#inp table{
			width: 310px;
		}
		li input{
			width: 100px;
		}

		#pageDiv{
			padding: 10px 0;
		}
		#pageTxT{
			font-size: 30px;

		}
		.page{
			font-size: 30px;
			border: #3f3f3f 1px solid;
			padding: 0 15px;
			margin: 0 10px;
			background-color: #5e7cbb;
		}
		.txt{
			width: 150px;
			height: 25px;
		}
		.ptxt{
			width: 100px;
			height: 28px;
		}
		.tdx{
			width: 120px;
			color: palevioletred;
			font-size: 15px;
			font-family: "Microsoft YaHei UI";
			text-align: right;
		}
		.bx{
			text-align: right;
			height: 30px;
			width: 150px;
		}
		#cover{
			position: absolute;
			top: 0;
			left: 395px;
			float: left;
			z-index: 99;
			display: none;
			width: 802px;
			height: 800px;
			opacity: .1;
			background-color: lightskyblue;
		}
		#show{
			z-index: 1;
		}
	</style>
	  <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	  <script type="text/javascript">
		  $(function (){
			  var pageMax;
			  var page =parseInt($("#pageTxT").text());
			  var pageSize = 20;
			  $("#last").click(function (){
				  if (page>1){
					  page --;
					  $("#pageTxT").text(page);
					  loadStudent();
				  }
			  })
			  $("#next").click(function (){
				  if (page < pageMax){
					  page ++;
					  $("#pageTxT").text(page);
					  loadStudent();
				  }

			  })
			  loadStudent();
			  $("#btn1").click(function (){
				  loadStudent();
			  })

			  function loadStudent(){
				  $.ajax({
					  url:"goodsInfo.do",
					  dataType:"json",
					  data:{"pageNum":page,"pageSize":pageSize},
					  type:"post",
					  success:function (data){
						  $("#info").html("");
						  $.each(data,function (i,n){
							  $("#info").append("<tr>").
							  append("<td class='gi'>"+n.id+"</td>").
							  append("<td>"+n.gname+"</td>").
							  append("<td align='right' class='del'>"+"<a  href='javascript:;'>删除</a>"+"</td>").
							  append("<td align='right' class='ud'>"+"<a  href='javascript:;'>修改</a>"+"</td>").
							  append("</tr>")
						  })
					  }
				  })
			  }

			  $("#info").on("click",".del",function (){
			  		if (confirm("确定删除")){
						$.ajax({
							url:"deleteGoods.do",
							data:{"id":parseInt($(this).prevAll().eq(1).text())},
							type:"post",
							success:function (data){
								alert(data["msg"]);
								loadStudent();
							}
						})
					}
			  })
			  $("#cans").click(function (){
				  $("#inp").css({
					  display:"none"
				  })
				  $("#cover").css({
					  display:"none"
				  })
			  })
			  $("#info").on("click",".ud",function (){
					$("#inp").css({
						display:"block"
					})
				  $("#cover").css({
					  display:"block"
				  })

				  	$.ajax({
						url:"goodsInfoA.do",
						dataType:"json",
						data:{"id":parseInt($(this).prevAll().eq(2).text())},
						type:"post",
						success:function (data){
							$("#gname").val(data.gname);
							$("#goprice").val(data.goprice);
							$("#grprice").val(data.grprice);
							$("#gstore").val(data.gstore);
							$("#gpicture").val(data.gpicture);
							$("#goodstype_id").val(data.goodstype_id);
						}
					})
			  })
			  getCount();
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
			  $("#submit").click(function (){
			  	if (confirm("确定修改")) {
					var good = {
						"gname": $("#gname").val(),
						"goprice": $("#goprice").val(),
						"grprice": $("#grprice").val(),
						"gstore": $("#gstore").val(),
						"gpicture": $("#gpicture").val(),
						"goodstype_id": $("#goodstype_id").val()
					}

					$.ajax({
						url: "updateGoods.do",
						dataType: "json",
						contentType: 'application/json',
						data: JSON.stringify(good),
						type: "post",
						success: function (data) {
								alert(data["msg"]);
							$("#page-ct").html(Math.ceil(data["count"]/pageSize));
							pageMax = Math.ceil(data["count"]/pageSize);
						}
					})
					$("#cover").css({
						display:"none"
					})
				}
				  $("#inp").css({
					  display:"none"
				  })
			  })
			  $("#back").click(function (){
				  location.href = "main.do";
			  })
		  })
	  </script>
</head>
<body>
<div id="cover"></div>
<h2 align="center" style="margin: 10px 0">变更商品界面</h2>
<div id="inp">
	<table>
			<tr>
				<td class="tdx">商品名<span class="sp">*</span></td>
				<td class="ptxt"><span><input type="text" id="gname" class="txt"></span></td>
			</tr>
			<tr>
				<td class="tdx">原价<span class="sp">*</span></td>
				<td class="ptxt"><span><input type="text" id="goprice" class="txt"></span></td>
			</tr>
			<tr>
				<td class="tdx">折扣价<span class="sp">*</span></td>
				<td class="ptxt"><span><input type="text" id="grprice" class="txt"></span></td>
			</tr>
			<tr>
				<td class="tdx">库存<span class="sp">*</span></td>
				<td class="ptxt"><span><input type="text" id="gstore" class="txt"></span></td>
			</tr>
			<tr>
				<td class="tdx">图片<span class="sp">*</span></td>
				<td class="ptxt"><span><input type="text" id="gpicture" class="txt"></span></td>
				<td class="bx" align="right"><input type="button"  value="提交" id="submit"></td>
			</tr>
			<tr>
				<td class="tdx">
					类型
					<span style="color: red">*</span></td>
				<td class="ptxt">
					<%--				用ajax动态获取--%>
					<select  class="txt" id="goodstype_id">
						<option value="0">商品类型</option>
						<option value="1">水果</option>
						<option value="2">服装</option>
						<option value="3">玩具</option>
						<option value="4">体育用品</option>
						<option value="5">运动鞋</option>
						<option value="6">电子产品</option>
						<option value="7">书籍</option>
					</select>

				</td>
				<td class="bx" align="right"><input type="button"  value="取消" id="cans"></td>

			</tr>
	</table>
</div>
<div align="center" id="show">
	<%--	<input type="button" id="btn1" value="提交查询">--%>
	<table border="1px solid black">
		<thead>
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td align='right'>操作</td>
			<td align='right'>操作</td>
		</tr>
		</thead>
		<tbody id="info">

		</tbody>

	</table>
	<div id="pageDiv">
		<input type="button" id="last" class="page" value="<">
		<span  id="pageTxT">1</span>
		<input type="button" id="next" class="page" value=">">
		<input type="button" id="back" class="page" value="Back">
	</div>

</div>


</body>
</html>