<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");
    int calendarNum = Integer.parseInt(request.getParameter("calendarNum"));
    String updateCalenarContent = request.getParameter("updateCalenarContent")

    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "UPDATE calendar SET calendarContent=? WHERE calendarNum=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, updateCalenarContent);
    query.setInt(2, calendarNum);

    query.executeUpdate();

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123</title>
</head>

<body>

    <script>
        alert("수정 완료")
        location.href="../main/main.jsp"
    </script>
    
</body>