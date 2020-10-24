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
    <title>支付页面</title>
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
        .show-pay{
            position: relative;
            width: 1110px;
            margin: 0 auto;
        }

        .tbody-pay{
            position: absolute;
            left: 400px;
            top: 100px;
            width: 300px;
            height: 400px;
            font-size: 25px;
            padding-top: 10px;
            background-color: plum;
            color: rebeccapurple;
        }
        .tbody-pay td{
            font-size: 25px;
            padding: 10px 0;
            width: 300px;
        }
        .tbody-pay .money{
            font-size: 30px;
        }
        #pay-btn{
            position: relative;
            top: 50px;
            width: 100px;
            height: 50px;
            background-color: palevioletred;
        }
        #pay-btn:hover{
            background-color: purple;
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#pay-btn").click(function (){
                if(confirm("确认付款")){

                    $.ajax({
                        url:'payOrder.do',
                        data:{"id":${Order.id}},
                        type:'post',
                        success:function (data){
                            if (data["res"]) {
                                alert("支付成功！");
                                location.href = 'userCenter.do';
                            }else {
                                alert("支付失败，库存不足!,请等待商家补货。");
                                location.href = 'userCenter.do';
                            }
                        }
                    })
                }
            })

        })
    </script>
</head>
<body>
<h1>支付页面</h1>
    <div class="show-pay">

        <div class="tbody-pay">
            <table>
                <tr>
                    <td align="center">总计金额</td>
                </tr>
                <tr>

                    <td class="money" align="center">￥&nbsp;${Order.amount}</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="button" value="支付" id="pay-btn"></td>
                </tr>
            </table>
        </div>

    </div>

</body>
</html>
