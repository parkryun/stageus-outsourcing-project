<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%
    session.removeAttribute("userID");
    response.sendRedirect("login.jsp");
%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>logout</title>
</head>
<body>
    <script>
        location.href="../login/login.jsp"
    </script>
</body>
</html>