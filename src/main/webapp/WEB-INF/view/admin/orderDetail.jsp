<%--
  Created by IntelliJ IDEA.
  User: 28612
  Date: 2020/10/3
  Time: 15:28
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
<body>
<head>
    <title>orderDetail</title>
    <base href="<%=basePath%>">
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            width: 800px;
            z-index: 10;
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
        #pageDiv3{
            padding: 10px 0;
        }
        #pageTxT3{
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
        #quit{
            position: relative;
            padding: 2px 5px;
            margin: 0 5px;
            font-size: 20px;
            left: 380px;
        }
        #XQ{
            position: absolute;
            z-index: 100;
            float: left;
            display: none;
            top: 300px;
            left: 200px;
            background-color: #90bfff;
        }
        #XQtable{
            width:450px;
            height:65px;
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
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){

            var page =parseInt($("#pageTxT3").text());
            var pageSize = 20;
            loadTable();
            getCount();
            $("#last3").click(function (){
                if (page>1){
                    page --;
                    $("#pageTxT3").text(page);
                    loadTable();
                    getCount();
                }
            })
            var pageMax;
            $("#next3").click(function (){

                if (page < pageMax){
                    page ++;
                    $("#pageTxT3").text(page);
                    loadTable();
                    getCount();
                }
            })

            function getCount(){
                $.ajax({
                    url:"OrderCount.do",
                    dataType:"json",
                    type:"post",
                    success:function (data){
                        $("#ct3").html(data["count"]) ;
                        $("#page-ct3").html(Math.ceil(data["count"]/pageSize));
                        pageMax = Math.ceil(data["count"]/pageSize);
                    }
                })
            }
            function loadTable(){
                $.ajax({
                    url:"queryOrderAll.do",
                    dataType:"json",
                    data:{"pageNum":page,"pageSize":pageSize},
                    type:"post",
                    success:function (data){

                        $("#info3").html("");
                        $.each(data,function (i,n){
                            var status1;
                            if (n.status==0){
                                status1 = '未付款';
                            }else if(n.status ==1){
                                status1 = '已付款';
                            }else {
                                status1 = '未知';
                            }
                            $("#info3").append("<tr>").
                            append("<td>"+n.id+"</td>").
                            append("<td>"+n.busertable_id+"</td>").
                            append("<td>"+n.amount+"</td>").
                            append("<td>"+status1+"</td>").
                            append("<td>"+n.orderdate+"</td>").
                            append("<td align='right' class='del'>"+"<a href='javascript:;'>删除</a>"+"</td>").
                            append("<td align='right' class='xq'>"+"<a href='javascript:;'>详情</a>"+"</td>").
                            append("</tr>")
                        })
                    }
                })
            }
            $("#info3").on("click",".del",function (){
                if (confirm("确定删除")){
                    $.ajax({
                        url:"deleteOrder.do",
                        data:{"id":$(this).prevAll().eq(4).text()},
                        type:"post",
                        success:function (data){
                            alert(data["msg"]);
                            loadTable();
                            getCount();
                        }
                    })
                }
            })
            $("#quit").click(function (){
                $("#XQT").html("");
                $("#XQ").hide();
                $("#cover").hide();
            })
            $("#info3").on("click",".xq",function (){
                    $("#cover").show();
                    $.ajax({
                        url:"OrderXq.do",
                        data:{"id":$(this).prevAll().eq(5).text()},
                        type:"post",
                        success:function (n){
                                $("#XQ").show();
                                $("#XQT").append("<tr>").
                                append("<td>"+n.id+"</td>").
                                append("<td>"+n.orderbasetable_id+"</td>").
                                append("<td>"+n.goodstable_id+"</td>").
                                append("<td>"+n.shoppingnum+"</td>").
                                append("</tr>")
                        }
                    })
            })
        })
    </script>
</head>
</body>
<div id="cover"></div>
<div id="XQ">
    <table id="XQtable">
        <thead>
            <tr>
                <td>ID</td>
                <td>订单ID</td>
                <td>商品ID</td>
                <td>购买数量</td>
            </tr>
        </thead>
        <tbody id="XQT">

        </tbody>
    </table>
    <input type="button" id="quit" value="返回">
</div>
<h3 align="center">共<span class="count" id="ct3"></span>条&nbsp;&nbsp;&nbsp;&nbsp;
    共<span class="count" id="page-ct3"></span>页</h3>
<div align="center">
    <%--	<input type="button" id="btn1" value="提交查询">--%>
    <table border="1px solid black">
        <thead>
        <tr>
            <td>订单ID</td>
            <td>用户ID</td>
            <td>订单金额</td>
            <td>订单状态</td>
            <td>订单日期</td>
            <td>详情</td>
            <td align="right">操作</td>
        </tr>
        </thead>
        <tbody id="info3">

        </tbody>

    </table>
    <div id="pageDiv3">
        <input type="button" id="last3" class="page" value="<">
        <span  id="pageTxT3">1</span>
        <input type="button" id="next3" class="page" value=">">
    </div>

</div>
</body>
</html>
