<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    request.setCharacterEncoding("utf-8");

    String userID = (String)session.getAttribute("userID");

    String calendarContent = request.getParameter("calendarContent");
    String calendarDate = request.getParameter("calendarDate");
    String calendarTime = request.getParameter("calendarTime");
    String calendarSecond = ":00"; //datetime이어서 초까지 추가

    calendarTime = calendarTime.concat(calendarSecond);
    calendarDate = calendarDate + " ";
    String calendarDatetime = calendarDate.concat(calendarTime);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "INSERT INTO calendar (calendarContent, calendarDate, userID) VALUES(?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, calendarContent);
    query.setString(2, calendarDatetime);
    query.setString(3, userID);


    //SQL문 전송
    query.executeUpdate();
%>

<!-- 여기 사이는 jsp로 인식됨 -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123</title>
</head>

<body>

    <script>
        alert("작성 완료!")
        location.href="../main/main.jsp"
    </script>
    
</body>