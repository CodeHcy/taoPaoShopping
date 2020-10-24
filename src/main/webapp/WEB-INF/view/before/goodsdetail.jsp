<%--
  Created by IntelliJ IDEA.
  User: 28612
  Date: 2020/10/12
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>商品详情</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html{
            background-color: snow;
        }
        body{
            width: 1340px;
            height: 800px;
            background-color: lavender;
            margin: 0 auto;
        }
        .showGoods{
            position: relative;
            width: 1110px;
            margin: 0 auto;
        }
        .thead-Goods{
            width: 1110px;
            height: 60px;
            font-size: 50px;
            padding: 5px 0;
            text-align: center;
            color: mediumpurple;
        }
        .tbody-Goods{
            position: relative;
            width: 1110px;
            font-size: 25px;
            padding-top: 10px;
            color: rebeccapurple;
        }
        .tbody-Goods img{
            position: absolute;
            left: 10px;
            width: 800px;
            height: 600px;
        }
        .other-Goods{
            width: 1110px;
            margin-top: 50px;
            height: 100px;
            font-size: 30px;
            text-align: right;
            color: rebeccapurple;
        }
        .time-Goods span{
            font-size: 20px;

        }
        .btn-ad{
            width:150px;
            height: 50px;
            background-color: plum;
            color: white;
            font-size: 15px;
            margin-bottom: 10px;
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#Back").click(function (){
                location.href = 'before';
            })
           $("#addCart").click(function (){
               $.ajax({
                   url:"AddGoodsIntoCart.do",
                   data:{'id':${Goods.id}},
                   type:'post',
                   success:function (data){
                       if (data["res"]==='未登录'){
                           alert(data["tips"]);
                       }else {
                           alert(data["tips"]);
                       }

                   }
               })
           })
        })
    </script>
</head>
<body>
    <div class="showGoods">
       <div class="thead-Goods">
           ${Goods.gname}
       </div>
        <div class="tbody-Goods">
            <img  src="<%=basePath%>statics/images/${Goods.gpicture}">
        </div>
        <div class="other-Goods">
            <span>原价:${Goods.goprice}元</span><br>
            <span>现价:${Goods.grprice}元</span><br>
            <span>库存:${Goods.gstore}个</span><br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <input type="button"  class="btn-ad" id="Back"  value="返回">
            <br>
            <input type="button"  class="btn-ad" id="addCart"  value="加购物车">

        </div>
    </div>

</body>
</html>
