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
    String userEmail = (String) request.getSession().getAttribute("userEmail");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>个人中心</title>
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
            background-color: lavender;
            margin: 0 auto;
        }
        h1{
            text-align: center;
            color: purple;
        }
        .showOrder{
            position: relative;
            width: 1110px;
            margin: 0 auto;
        }
        .c-body{
            width: 1110px;
            font-size: 25px;
            padding-top: 10px;

            color: rebeccapurple;
        }
        .c-body .order-box{
            width: 1110px;
            height: 160px;
            background-color: pink;
            border-bottom: purple 2px dashed;
        }
        .c-body table{
            width: 1110px;
            height: 120px;
        }
        .c-body table img{
            width: 100px;
            height: 100px;
        }
        .c-body table td{
            padding-left: 20px;
            width: 500px;
        }
        .time-notice{
            width: 1110px;
            margin-top: 50px;
            font-size: 30px;
            text-align: right;
            color: rebeccapurple;
        }
        .time-notice span{
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
            var userEmail = "<%=userEmail%>";
            loadOrder();
            function loadOrder(){
                $.ajax({
                    url:"loadOrder.do",
                    type:"post",
                    data:{"userEmail":userEmail},
                    success:function (data){
                        $.each(data,function (i,n){
                            if (n.status==0){
                                var status = '未支付';
                                var lili = '<li>' +
                                    '                    <div class="order-box">' +
                                    '                        <table>' +
                                    '                            <tr>' +
                                    '                                <td colspan="5"><img src="" alt="图片"></td>' +
                                    '                                <td>' +
                                    '                                    <ul>' +
                                    '                                        <li>订单编号:<span>'+n.id+'</span></li>' +
                                    '                                        <li>订单金额:<span>'+n.amount+'</span></li>' +
                                    '                                        <li>订单状态:<span>'+status+'</span></li>' +
                                    '                                        <li>下单时间:<span>'+n.orderdate+'</span></li>' +
                                    '                                        <li><a target="_blank" href="userOrder.do?id='+n.id+'">订单详情</a></li>' +
                                    '                                    </ul>' +
                                    '                                </td>' +
                                    '                                <td align="right"><a  href="paydone.do?id='+n.id+'">去支付</a></td>'+
                                    '                                + </tr>' +
                                    '                        </table>' +
                                    '                    </div>' +
                                    '                </li>';
                                $("#OrderTable").prepend(lili);
                            }else {
                                var status = '已支付';
                                var lili = '<li>' +
                                    '                    <div class="order-box">' +
                                    '                        <table>' +
                                    '                            <tr>' +
                                    '                                <td colspan="5"><img src="" alt="图片"></td>' +
                                    '                                <td>' +
                                    '                                    <ul>' +
                                    '                                        <li>订单编号:<span>'+n.id+'</span></li>' +
                                    '                                        <li>订单金额:<span>'+n.amount+'</span></li>' +
                                    '                                        <li>订单状态:<span>'+status+'</span></li>' +
                                    '                                        <li>下单时间:<span>'+n.orderdate+'</span></li>' +
                                    '                                        <li><a  href="userOrder.do?id='+n.id+'">订单详情</a></li>' +
                                    '                                    </ul>' +
                                    '                                </td>' +
                                    '                                <td align="right"></td>'+
                                    '                                + </tr>' +
                                    '                        </table>' +
                                    '                    </div>' +
                                    '                </li>';
                                $("#OrderTable").prepend(lili);
                            }


                        })


                    }
                })
            }
            $("#Back").click(function (){
                location.href = 'before';
            })
        })
    </script>
</head>
<body>
<h1>个人中心</h1>
    <div class="showOrder">
        <div align="right"> <input type="button"  class="btn-ad" id="Back"  value="返回"></div>
        <div class="c-body">

            <ul id="OrderTable">

            </ul>

        </div>
        <div class="time-notice">
        </div>
    </div>

</body>
</html>
