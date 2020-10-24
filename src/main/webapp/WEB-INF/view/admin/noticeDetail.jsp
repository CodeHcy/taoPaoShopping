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
<head>
    <title>notice</title>
    <base href="<%=basePath%>">
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
        #pageDiv4{
            padding: 10px 0;
        }
        #pageTxT4{
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
        .tdNm{
            width: 50px;
        }
        .tdId{
            width: 60px;
        }
        .tdNc{
            width: 400px;
            height: 180px;
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){

            var page =parseInt($("#pageTxT4").text());
            var pageSize = 3;
            loadTable();
            getCount();
            $("#last4").click(function (){
                if (page>1){
                    page --;
                    $("#pageTxT4").text(page);
                    loadTable();
                    getCount();
                }
            })
            var pageMax;
            $("#next4").click(function (){

                if (page < pageMax){
                    page ++;
                    $("#pageTxT4").text(page);
                    loadTable();
                    getCount();
                }
            })

            function getCount(){
                $.ajax({
                    url:"NoticeCount.do",
                    dataType:"json",
                    type:"post",
                    success:function (data){
                        $("#ct4").html(data["count"]) ;
                        $("#page-ct4").html(Math.ceil(data["count"]/pageSize));
                        pageMax = Math.ceil(data["count"]/pageSize);
                    }
                })
            }
            function loadTable(){
                $.ajax({
                    url:"queryNoticeAll.do",
                    dataType:"json",
                    data:{"pageNum":page,"pageSize":pageSize},
                    type:"post",
                    success:function (data){
                        $("#info4").html("");
                        $.each(data,function (i,n){
                            $("#info4").append("<tr>").
                            append("<td class='tdId'>"+n.id+"</td>").
                            append("<td class='tdNt'>"+n.ntitle+"</td>").
                            append("<td class='tdNc'>"+n.ncontent+"</td>").
                            append("<td class='tdNm'>"+n.ntime+"</td>").
                            append("<td align='right' class='del'>"+"<a href='javascript:;'>删除</a>"+"</td>").
                            append("</tr>")
                        })
                    }
                })
            }
            $("#info4").on("click",".del",function (){
                if (confirm("确定删除")){
                    $.ajax({
                        url:"deleteNotice.do",
                        data:{"id":$(this).prevAll().eq(3).text()},
                        type:"post",
                        success:function (data){
                            alert(data["msg"]);
                            loadTable();
                            getCount();
                        }
                    })
                }
            })
        })
    </script>
</head>

<body>
<h3 align="center">共<span class="count" id="ct4"></span>条&nbsp;&nbsp;&nbsp;&nbsp;
    共<span class="count" id="page-ct4"></span>页</h3>
<div align="center">
    <table border="1px solid black">
        <thead>
        <tr>
            <td>公告ID</td>
            <td>标题</td>
            <td>内容</td>
            <td>时间</td>
            <td align="right">操作</td>
        </tr>
        </thead>
        <tbody id="info4">

        </tbody>

    </table>
    <div id="pageDiv4">
        <input type="button" id="last4" class="page" value="<">
        <span  id="pageTxT4">1</span>
        <input type="button" id="next4" class="page" value=">">
    </div>

</div>
</body>
</html>
