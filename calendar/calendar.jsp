<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    // 받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");

    String userID = (String)session.getAttribute("userID");

    String calendarContent = request.getParameter("calendarContent");
    String calendarDate = request.getParameter("calendarDate");

    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    //SQL문 준비
    String sql = "INSERT INTO calendar (calendarContent, calendarDate, userID) VALUES(?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, calendarContent);
    query.setString(2, calendarDate);
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