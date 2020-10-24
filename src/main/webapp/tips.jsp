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
    <title>提示</title>
</head>
<body>
    <h2>你还没有<a href="admin">登录。</a> </h2>
</body>
</html>
