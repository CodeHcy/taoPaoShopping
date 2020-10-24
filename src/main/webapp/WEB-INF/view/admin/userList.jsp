
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
    <title>Title</title>
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
        #pageDiv2{
            padding: 10px 0;
        }
        #pageTxT2{
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
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){

            var page =parseInt($("#pageTxT2").text());
            var pageSize = 20;
            loadTable();
            getCount();
            $("#last2").click(function (){
                if (page>1){
                    page --;
                    $("#pageTxT2").text(page);
                    loadTable();
                    getCount();
                }
            })
            var pageMax;
            $("#next2").click(function (){

                if (page < pageMax){
                    page ++;
                    $("#pageTxT2").text(page);
                    loadTable();
                    getCount();
                }
            })

            function getCount(){
                $.ajax({
                    url:"UserCount.do",
                    dataType:"json",
                    type:"post",
                    success:function (data){
                        $("#ct2").html(data["count"]) ;
                        $("#page-ct2").html(Math.ceil(data["count"]/pageSize));
                        pageMax = Math.ceil(data["count"]/pageSize);
                    }
                })
            }
            function loadTable(){
                $.ajax({
                    url:"queryUserAll.do",
                    dataType:"json",
                    data:{"pageNum":page,"pageSize":pageSize},
                    type:"post",
                    success:function (data){
                        $("#info2").html("");
                        $.each(data,function (i,n){
                            $("#info2").append("<tr>").
                            append("<td>"+n.id+"</td>").
                            append("<td>"+n.bemail+"</td>").
                            append("<td>"+n.bpwd+"</td>").
                            append("<td align='right' class='del'>"+"<a href='javascript:;'>删除</a>"+"</td>").
                            append("</tr>")
                        })
                    }
                })
            }
            $("#info2").on("click",".del",function (){
                if (confirm("确定删除")){
                    $.ajax({
                        url:"deleteUser.do",
                        data:{"id":$(this).prevAll().eq(2).text()},
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
<h3 align="center">共<span class="count" id="ct2"></span>条&nbsp;&nbsp;&nbsp;&nbsp;
    共<span class="count" id="page-ct2"></span>页</h3>
<div align="center">
    <%--	<input type="button" id="btn1" value="提交查询">--%>
    <table border="1px solid black">
        <thead>
        <tr>
            <td>ID</td>
            <td>邮箱</td>
            <td>密码</td>
            <td align="right">删除用户</td>
        </tr>
        </thead>
        <tbody id="info2">

        </tbody>

    </table>
    <div id="pageDiv2">
        <input type="button" id="last2" class="page" value="<">
        <span  id="pageTxT2">1</span>
        <input type="button" id="next2" class="page" value=">">
    </div>

</div>
</body>
</html>
