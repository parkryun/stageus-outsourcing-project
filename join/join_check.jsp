<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    // 받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");

    // 받아오는 값을 저장
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String userName = request.getParameter("userName");
    String userPhoneNum = request.getParameter("userPhoneNum");
    String userEmail = request.getParameter("userEmail");
    String department = request.getParameter("department");
    String position = request.getParameter("position");

    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    if(position == "사장") { // 부서를 넣지 않음
        String sql2 = "INSERT INTO users (userID, userPW, userName, userEmail, department, userPhoneNum, position) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement query2 = connect.prepareStatement(sql2);
        query2.setString(1, userID);
        query2.setString(2, userPW);
        query2.setString(3, userName);
        query2.setString(4, userEmail);
        query2.setString(6, userPhoneNum);
        query2.setString(7, position);
    
        query2.executeUpdate();
    }
    else {
        String sql2 = "INSERT INTO users (userID, userPW, userName, userEmail, department, userPhoneNum, position) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement query2 = connect.prepareStatement(sql2);
        query2.setString(1, userID);
        query2.setString(2, userPW);
        query2.setString(3, userName);
        query2.setString(4, userEmail);
        query2.setString(5, department);
        query2.setString(6, userPhoneNum);
        query2.setString(7, position);
    
        query2.executeUpdate();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123</title>
</head>

<body>

    <script>
        alert("회원가입 완료!")
        location.href="../login/login.jsp"
    </script>
    
</body>