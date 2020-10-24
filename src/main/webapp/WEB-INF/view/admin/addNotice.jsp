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
<title>addNotice</title>
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

		#headText{
			width: 300px;
			height: 28px;
		}
		#contentText{
			width: 274px;
			height: 210px;
		}
		.tdx{
			color: palevioletred;
			font-size: 15px;
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

            function Now() {
                var nowTime = new Date();
                var nowYear= nowTime.getFullYear() ;
                var nowMonth = nowTime.getMonth();
                var nowDate = nowTime.getDate();
                var nowH = nowTime.getHours() ;
                var nowM = nowTime.getMinutes();
                var nowS = nowTime.getSeconds() ;
                var Y =nowYear;
                var M = nowMonth<9 ? '0' + (nowMonth+1): (nowMonth);
                var D = nowDate<10 ? '0' + nowDate: nowDate;
                var H = nowH<10 ? '0' + nowH: nowH;
                var m = nowM<10? '0' + nowM:nowM;
                var s = nowS<10 ? '0' + nowS: nowS;
                var fomatTime = Y+'-'+M+'-'+D+' '+H+':'+ m+':'+ s;
                return fomatTime;
            }
			$("#contentText").val("");
			$("#back").click(function (){
				location.href = "main.do";
			})
			$("#submit").click( function (){
				var good = {
					"ntitle":$("#headText").val(),
					"ncontent":$("#contentText").val(),
					"ntime":Now()
				}

				$.ajax({
					url:"addNotice.do",
					dataType:"json",
					contentType:'application/json',
					data:JSON.stringify(good),
					type:"post",
					success:function (data){
							alert(data["msg"]);
						$("#headText").val("");
						$("#contentText").val("");
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
				<td class="tdx">标题<span style="color: red">*</span></td>
				<td >
					<input type="text"  id="headText">
				</td>
			</tr>
			<tr>
				<td class="tdx">内容<span style="color: red">*</span></td>
				<td >
					<textarea rows="3" cols="10" id="contentText">

					</textarea>
				</td>

			</tr>


			<tr>
				<td colspan="2" class="bx">
					<input type="button" class="btn" id="back" value="返回"/>
				</td>
				<td class="bx">
					<input type="button" class="btn"  id="submit" value="提交"/>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>
