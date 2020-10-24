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
    <title>公告</title>
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
        .showNotice{
            position: relative;
            width: 1110px;
            margin: 0 auto;
        }
        .thead-notice{
            width: 1110px;
            height: 100px;
            font-size: 50px;
            padding: 25px 0;
            text-align: center;
            color: mediumpurple;
        }
        .tbody-notice{
            width: 1110px;
            font-size: 25px;
            padding-top: 10px;

            color: rebeccapurple;
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
    </style>
</head>
<body>
<h1>最新公告</h1>
    <div class="showNotice">
       <div class="thead-notice">
           ${ntitle}
       </div>
        <div class="tbody-notice">
            ${ncontent}
        </div>
        <div class="time-notice">
            发布时间: <span>${ntime}</span>
        </div>
    </div>

</body>
</html>
