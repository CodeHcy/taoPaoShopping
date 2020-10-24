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
    <title>订单详情</title>
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

        .tbody-order{
            width: 1110px;
            font-size: 25px;
            padding-top: 10px;
            color: rebeccapurple;
        }
        .order-box{
            background-color: palevioletred;
            border-bottom: purple 2px dashed;
        }
        .order-box li{
            margin: 5px 0;
        }
        .order-box td{
            color: white;
            font-size: 15px;
            width: 500px;
            padding-left: 20px;
        }
        .order-box img{
            width: 125px;
            height: 100px;
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){
            loadOrderDetailTable();
            function  loadOrderDetailTable(){
                console.log("22:"+${id});
                $.ajax({
                    url:'userOrderDetailList.do',
                    type:'post',
                    data:{"id":${id}},
                    success:function (data){
                        $(".showOrderDetail").html('');
                        $.each(data,function (i,n){
                            $.ajax({
                                url: "AgoodsDetail.do",
                                data: {"id": n.goodstable_id},
                                type: 'post',
                                success: function (dd) {
                                    var li = '<li>\n' +
                                        '                    <div class="order-box">\n' +
                                        '                        <table>\n' +
                                        '                            <tr>\n' +
                                        '                                <td colspan="5"><img src="'+'<%=basePath%>'+'statics/images/'+dd.gpicture+'" alt="商品图片"></td>\n' +
                                        '                                <td>\n' +
                                        '                                    <ul>\n' +
                                        '                                        <li >商品名:<span>'+dd.gname+'</span></li>\n' +
                                        '                                        <li>购买数量:<span>'+n.shoppingnum+'</span></li>\n' +
                                        '                                    </ul>\n' +
                                        '                                </td>\n' +
                                        '                            </tr>\n' +
                                        '                        </table>\n' +
                                        '                    </div>\n' +
                                        '                </li>';
                                        $(".showOrderDetail").append(li);
                                }
                            })

                        })
                    }
                })
            }

        })
    </script>
</head>
<body>
<h1>订单详情</h1>
    <div class="showOrder">

        <div class="tbody-order">
            <ul class="showOrderDetail">

            </ul>
        </div>

    </div>

</body>
</html>
