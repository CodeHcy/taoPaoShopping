<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath =   request.getScheme()+
			"://"+
			request.getServerName()+
			":"+
			request.getServerPort()+
			request.getContextPath()+
			"/";
	String userEmail = (String) request.getSession().getAttribute("userEmail");
	String sts = (String) request.getSession().getAttribute("sts");
%>
<html>
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>逃跑电商平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/styleindex.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/bootstrap-grid.min.css" />
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<style>
		.demo{
			padding: 2em 0;
		}
		.product-grid{
			font-family: 'Open Sans', sans-serif;
			text-align: center;
			overflow: hidden;
			position: relative;
			transition: all 0.5s ease 0s;
		}
		.product-grid:hover{ box-shadow: 0 0 10px rgba(0,0,0,0.3); }
		.product-grid .product-image{ overflow: hidden; }
		.product-grid .product-image a{ display: block; }
		.product-grid .product-image img{
			width: 100%;
			height: auto;
			transition: all 0.5s ease 0s;
		}
		.product-grid:hover .product-image img{ transform: scale(1.1); }
		.product-grid .product-content{
			padding: 12px 12px 15px 12px;
			transition: all 0.5s ease 0s;
		}
		.product-grid:hover .product-content{ opacity: 0; }
		.product-grid .title{
			font-size: 20px;
			font-weight: 600;
			text-transform: capitalize;
			margin: 0 0 10px;
			transition: all 0.3s ease 0s;
		}
		.product-grid .title a{ color: #000; }
		.product-grid .title a:hover{ color: #2e86de; }
		.product-grid .price {
			font-size: 18px;
			font-weight: 600;
			color:#2e86de;
		}
		.product-grid .price span {
			color: #999;
			font-size: 15px;
			font-weight: 400;
			text-decoration: line-through;
			margin-left: 7px;
			display: inline-block;
		}
		.product-grid .social{
			background-color: #fff;
			width: 100%;
			padding: 0;
			margin: 0;
			list-style: none;
			opacity: 0;
			transform: translateX(-50%);
			position: absolute;
			bottom: -50%;
			left: 50%;
			z-index: 1;
			transition: all 0.5s ease 0s;
		}
		.product-grid:hover .social{
			opacity: 1;
			bottom: 20px;
		}
		.product-grid .social li{ display: inline-block; }
		.product-grid .social li a{
			color: #909090;
			font-size: 16px;
			line-height: 45px;
			text-align: center;
			height: 45px;
			width: 45px;
			margin: 0 7px;
			border: 1px solid #909090;
			border-radius: 50px;
			display: block;
			position: relative;
			transition: all 0.3s ease-in-out;
		}
		.product-grid .social li a:hover {
			color: #fff;
			background-color: #2e86de;
			width: 80px;
		}
		.product-grid .social li a:before,
		.product-grid .social li a:after{
			content: attr(data-tip);
			color: #fff;
			background-color: #2e86de;
			font-size: 12px;
			letter-spacing: 1px;
			line-height: 20px;
			padding: 1px 5px;
			border-radius: 5px;
			white-space: nowrap;
			opacity: 0;
			transform:translateX(-50%);
			position: absolute;
			left: 50%;
			top: -30px;
		}
		.product-grid .social li a:after{
			content: '';
			height: 15px;
			width: 15px;
			border-radius: 0;
			transform:translateX(-50%) rotate(45deg);
			top: -20px;
			z-index: -1;
		}
		.product-grid .social li a:hover:before,
		.product-grid .social li a:hover:after{
			opacity: 1;
		}
		@media only screen and (max-width:990px){
			.product-grid{ margin-bottom: 30px; }
		}
<%--		==========================================================--%>
		html{
			background-color: snow;
		}
		body{
			position: relative;
			height: 1465px;
			margin: 0 auto;
			width: 1340px;
		}
		#sssBody{
			position: absolute;
			top: 150px;
			width:1340px;
			height: 1269px;
			margin: 0 auto;
		}
		#hotGoods{
			position: absolute;
			float: left;
			left: 0;
			width: 210px;
			height: 1065px;
			background-color: lavender;
		}
		#mainView{
			position: absolute;
			float: left;
			left: 210px;
			width: 880px;
			height: 1065px;
			background-color: lavender;
		}
		#notices{
			position: absolute;
			float: left;
			left: 1090px;
			width: 250px;
			height: 310px;
			background-color: lavender;
		}
		#notices a{
			color: pink;
		}
		#input{
			width: 300px;
			height: 30px;
			margin: 0 auto;
		}

		.notice-news{
			font-size: 20px;
			color: palevioletred;
		}
	</style>
	<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function (){

			if ('<%=sts%>'==='登录过了'){
				pdLogin();
			}
			var page =1;
            $("#pageTxT").text(page);
			var pageSize = 10;
			var goodstype_id = 6;
			var pageMax;
			$("#last").click(function (){
				if (page>1){
					page --;
					$("#pageTxT").text(page);
					loadTheGoods();

				}
			})

			$("#next").click(function (){

				if (page < pageMax){
					page ++;
					$("#pageTxT").text(page);
					loadTheGoods();

				}
			})
			loadType();
			loadNotices();
			loadTheGoods();
			loadCount();
			function loadCount() {
				$.ajax({
					url:"index/getCount.do",
					data:{'goodstype_id':goodstype_id},
					type:"post",
					success:function (data){
						$(".countAll span").text(data);
						pageMax = Math.ceil(data/pageSize);
					}
				})
			}

			function loadTheGoods(){
				$.ajax({
					url:"index/showGoods.do",
					data:{"goodstype_id":goodstype_id,"pageNum":page,"pageSize":pageSize},
					type:"post",
					success:function (data){
					    for (var i = 0;i < 10;i++){
                            $("#row .pic-1").eq(i).attr('src',"");
                            $("#row .title").eq(i).children('a').text('暂时没有商品');
                            $("#row .price").eq(i).html('￥ '+'0.00'+'  <span>"￥ "'+'0.00'+'</span>');
							$("#row .product-image").eq(i).children('a').attr('href','javascript:;');
							$("#row .social").eq(i).children("li").children("a").attr('href','javascript:;');
                        }
						$.each(data,function (i,n){
							var imPath = n.gpicture;
							$("#row .product-image").eq(i).children('a').attr('href','goodsDetail.do?id='+n.id);
							$("#row .pic-1").eq(i).attr('src',"<%=basePath%>"+"statics/images/"+imPath);
							 $("#row .title").eq(i).children('a').text(n.gname);
							 $("#row .price").eq(i).html('￥ '+n.grprice+'  <span>"￥ "'+n.goprice+'</span>');
							 $("#row .social").eq(i).children("li").children("a").attr('href','goodsDetail.do?id='+n.id);

						})
					}
				})
			}
			function loadNotices(){
				$.ajax({
					url:"index/getNotices.do",
					type:"post",
					success:function (data){
						$.each(data,function (i,n){
							$("#notices table").append("<tr class='notice-txt'>" +
									"<td><a href='index/showNotice.do?title="+n.ntitle+"'><span class='notice-news'>*news</span>&nbsp;&nbsp;"+"<span class='nTitle'>"+n.ntitle+"</span></a></td>" +
									"</tr>")
						})
					}
				})
			}
			function loadType(){

				$.ajax({
					url:"index/getType.do",
					dataType:"json",
					type:"post",
					success:function (data){
						$.each(data,function (i,n){
							$(".navbar").append("<a href='javascript:;' class='navl'>"+n.typename+"</a>");
						})
					}
				})
			}
			$(".navbar").on("click",".navl",function (){
				$(this).click(function (){
					$.ajax({
						url:"index/changeType.do",
						data:{"typename":$(this).text()},
						dataType:"json",
						type:"post",
						success:function (data){
							goodstype_id = data;
                            page = 1;
                            $("#pageTxT").text(page);
							loadTheGoods();
                            loadCount();
						}
					})
				})
			})
            $(".navbar").on('click','a',function (){
                $(this).siblings('a').removeClass('current');
                $(this).addClass('current');
            })
			function pdLogin(){
				var userEmail = '<%=userEmail%>';
				$(".navbar .navbt1").remove();
				$(".navbar .navbt2").remove();
				$(".navbar .navbt3").remove();
				$(".navbar .navbt4").remove();
				if(userEmail!=null){
					$(".navbar .navbt").remove();
					var userspan = '<span class="navbt1">用户:<%=userEmail%></span>';
					var back = '<input class="navbt2" type = "button" value="退出登录" id ="backLogin">';
					var Icenter = '<a class="navbt3" target="_blank" href="userCenter.do">个人中心</a>';
					var cartY = '<a class="navbt4"  href="GoCart.do">购物车</a>';
					$(".navbar").prepend(userspan);
					$(".navbar").prepend(Icenter);
					$(".navbar").append(back);
					$(".navbar").prepend(cartY);
				}else {
					$(".navbar .navbt1").remove();
					var userspan = '<a class="navbt" href="index/login"><span>登录/注册</span></a>';
					$(".navbar").prepend(userspan);
				}
			}
			$("#backLogin").click(function (){
				if (confirm("退出登录")){
					$.ajax({
						url:'backLogin.do',
						type:'post',
						success:function (data){
							location.href='before';
						}
				})

				}
			})

		})

	</script>
<%--	翻页和两边样式--%>
	<style>
		#pageDiv{
			width: 880px;
			padding: 10px 0;
			margin: 0 auto;
		}
		#pageTxT{
			font-size: 30px;

		}
		.page{
			font-size: 28px;
			border: #3f3f3f 1px solid;
			padding: 0 15px;
			margin: 0 10px;
			background-color: palevioletred;
		}
		.countAll{
			width: 880px;
			height: 25px;
			font-size: 10px;
			color: #dbeaff;
			padding-top: 5px;
			padding-right: 5px;
			background-color: pink;
			text-align: right;
		}
		.countAll span{
			font-size: 15px;
			margin: 0 3px;
			color: deeppink;
		}
		#hotGoods a{
			margin-left: 10px;
		}
		#hotGoods img{
			width: 200px;
			height: 150px;
		}
		#hotGoods table tr{
			height: 180px;
		}
		.head-hot{
			text-align: center;
			height: 100px;
			font-size: 30px;
			font-family: 幼圆;
			color: black;
		}
		.notice-txt{
			width: 300px;
			height: 45px;
			border: 1px solid rebeccapurple;
			border-bottom: rebeccapurple solid 5px;
			background-color: lavender;
		}
	</style>
<%--	整点秒杀--%>
	<style>
		.right-n{
			position: absolute;
			top: 327px;
			right: 0;
			float: left;
			width: 251px;
			height: 738px;
			background-color: lavender;
		}
		.time{
			width: 250px;
			height: 100px;
			padding-left: 4px;
			background-color: rosybrown;
		}
		.time span{
			position: relative;
			top: 20px;
			left: 5px;
			display: inline-block;
			width: 75px;
			height: 50px;
			background-color: #333;
			font-size: 25px;
			color: #fff;
			text-align: center;
			line-height: 40px;
		}
		.MS-goods{
			width: 251px;
			height: 600px;
		}
		.MS-goods img{
			width: 250px;
			height: 185px;
		}
		.MS-goods tr{
			height: 200px;
		}
	</style>
	<script>
		window.onload = function() {
			var hour = document.querySelector('.hour');
			var min = document.querySelector('.min');
			var scn = document.querySelector('.scn');
			Now();
			setInterval(Now, 1000);

			function Now() {
				var nowTime = new Date();
				var h = nowTime.getHours();
				var m = nowTime.getMinutes();
				var s = nowTime.getSeconds();
				hour.innerHTML = h < 10 ? "0" + h : h;
				min.innerHTML = m < 10 ? "0" + m : m;
				scn.innerHTML = s < 10 ? "0" + s : s;
			}
		}
	</script>
<%--    页脚样式--%>
    <style>
        .footer{
            position: absolute;
            bottom: 0;
            width: 1340px;
            height: 250px;
            background-color: lightpink;
        }
        .footer-a{
            width: 1340px;
            height: 200px;
        }
        .footer-z{
            position: relative;
            top: 10px;
            float: left;
            width: 332px;
        }
        .footer-z dt{
            font-size: 1.2em;
            text-align: center;
            padding: 0 0 10px 0;
        }
        .footer-z dd{
            text-align: center;
            margin: 0;
            padding: 10px 0;
        }
        .footer-z dd a{
            color: #000;
        }
    </style>
</head>
<body>
<div class="htmleaf-container">
	<header class="htmleaf-header">
		<h1>逃跑电商平台</h1>
	</header>
	<div class="header-wrap">
		<div class="navwrap">
			<div id="nav">
				<div class="navbar clearfix">
					<a class="navbt" href="index/login"><span>登录/注册</span></a>
					<a class="current" href="index/main">首页</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="input">
	<span>西安高温{{high}},西安低温{{low}}</span><input type="button" value="查询" @click="searchWeather">
</div>
<div id="sssBody">
<div id="hotGoods">
<table >
	<tr class="head-hot" >
		<td ><span style="color: red">Hot</span>热卖商品</td>
	</tr>

	<tr>
		<td><a href="goodsDetail.do?id=1063"><img  src="<%=basePath%>statics/images/timg10.jpg"></a></td>
	</tr>
	<tr>
		<td><a href="goodsDetail.do?id=1064"><img src="<%=basePath%>statics/images/timg11.jpg"></a></td>
	</tr>
	<tr>
		<td><a href="goodsDetail.do?id=1065"><img src="<%=basePath%>statics/images/timg12.jpg"></a></td>
	</tr>
	<tr>
		<td><a href="goodsDetail.do?id=1066"><img src="<%=basePath%>statics/images/timg13.jpg"></a></td>
	</tr>

</table>
</div>
<div id="mainView">
	<div class="countAll">共有<span>10</span>条结果</div>
	<div class="htmleaf1-container">
		<div class="demo">
			<div class="container">
				<div class="row" id="row">

					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image" >
								<a target="_" href="javascript:;">
									<img style="width: 200px;height:150px" class="pic-1" src="" alt="找不到图片">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid" >
							<div class="product-image" >
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 420px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 350px;height:200px"  class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 420px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 350px;height:200px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6" style="width: 220px;height:300px">
						<div class="product-grid">
							<div class="product-image">
								<a target="_blank" href="#">
									<img style="width: 200px;height:150px" class="pic-1" src="">
								</a>
							</div>
							<div class="product-content">
								<h3 class="title"><a href="javascript:;"></a></h3>
								<div class="price">
									<span></span>
								</div>
							</div>
							<ul class="social">
								<li><a target="_blank" href="javascript:;" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="pageDiv" align="center">
		<input type="button" id="last" class="page" value="<">
		<span  id="pageTxT">1</span>
		<input type="button" id="next" class="page" value=">">
	</div>
</div>
<div id="notices">
	<table>
		<tr class="head-hot">
			<td style="width: 400px" ><span style="color: red">News</span>最新公告</td>
		</tr>

	</table>
</div>
	<div class="right-n">
		<h2 style="text-align: center;">#整点秒杀！</h2>
		<div class="time">
			<span class="hour">12</span>
			<span class="min">00</span>
			<span class="scn">00</span>
		</div>
		<div class="MS-goods">
			<table>
				<tr>
					<td ><a href="goodsDetail.do?id=1055"><img src="<%=basePath%>statics/images/timg2.jpg"></a></td>
				</tr>
				<tr>
					<td><a href="goodsDetail.do?id=1071"><img  src="<%=basePath%>statics/images/timg18.jpg"></a></td>
				</tr>

			</table>
		</div>
	</div>

</div>
<div class="footer">
    <div class="footer-a">
        <dl class="footer-z">
            <dt>使用指南</dt>
            <dd> <a href="javascript:;">关于登录</a></dd>
            <dd> <a href="javascript:;">信息</a></dd>
            <dd> <a href="javascript:;">宠物</a></dd>
            <dd> <a href="javascript:;">常见问题 </a></dd>

        </dl>
        <dl class="footer-z">
            <dt>商城指南</dt>
            <dd> <a href="javascript:;">购物流程 </a></dd>
            <dd> <a href="javascript:;">支付方式 </a></dd>
            <dd> <a href="javascript:;">团购 </a></dd>
            <dd> <a href="javascript:;">支付问题 </a></dd>

        </dl>
        <dl class="footer-z">
            <dt>推送指南</dt>
            <dd> <a href="javascript:;">推送内容</a></dd>
            <dd> <a href="javascript:;">推送周期</a></dd>
            <dd> <a href="javascript:;">推送频率</a></dd>
            <dd> <a href="javascript:;">常见问题 </a></dd>

        </dl>
        <dl class="footer-z">
            <dt >关于社区</dt>
            <dd> <a href="javascript:;">信息安全</a></dd>
            <dd> <a href="javascript:;">社区简介</a></dd>
            <dd> <a href="javascript:;">社区文化</a></dd>
            <dd> <a href="javascript:;">反馈建议</a></dd>
        </dl>
    </div>
    </div>

<script>window.jQuery || document.write('<script src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"><\/script>')</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#news-slider").owlCarousel({
			items:2,
			itemsDesktop:[1199,2],
			itemsDesktopSmall:[980,2],
			itemsMobile:[600,1],
			pagination:false,
			navigationText:false,
			autoPlay:true
		});
	});
</script>
<script type="text/javascript">
	(function(){

		var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;

		$head.click(function(e){
			e.stopPropagation();
			if(!inter){
				$ul.show();
			}else{
				$ul.hide();
			}
			inter=!inter;
		});

		$ul.click(function(event){
			event.stopPropagation();
		});

		$(document).click(function(){
			$ul.hide();
			inter=!inter;
		});

		$lis.hover(function(){
			if(!$(this).hasClass('nochild')){
				$(this).addClass("prosahover");
				$(this).find(".prosmore").removeClass('hide');
			}
		},function(){
			if(!$(this).hasClass('nochild')){
				if($(this).hasClass("prosahover")){
					$(this).removeClass("prosahover");
				}
				$(this).find(".prosmore").addClass('hide');
			}
		});

	})();

</script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	var vm = new Vue({
		el:"#input",
		data:{
			"falg":false,
			"high":"",
			"low":"",
			"list":[],
			"city":"西安"
		},
		methods:{
			searchWeather:function(){
				var that = this;
				// 这是一个查询天气的接口 参数city
				axios.get("http://wthrcdn.etouch.cn/weather_mini?city="+this.city)
						.then(function(res){
							this.list=res.data.data.forecast;
							console.log(this.list);
							that.high = this.list[0].high;
							that.low = this.list[0].low;

						})
			}
		}
	})
</script>
</body>
</html>
