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
	<meta charset="UTF-8">
	<base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>逃跑电商平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/styleindex.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/before/bootstrap-grid.min.css" />
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/statics/css/before/index.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/statics/js/index.js"></script>
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
					<a class="current" href="before">首页</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="input" >

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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
</body>
</html>
