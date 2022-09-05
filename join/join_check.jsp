<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

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
    


    //여기서 데이터 베이스 조회하고 
    //조회하려면 무조건 여기로 들어와야해 

    //데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    //SQL문 준비
    String sql = "INSERT INTO users (userID, userPW, userName, userEmail, department, userPhoneNum, position) VALUES(?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userID);
    query.setString(2, userPW);
    query.setString(3, userName);
    query.setString(4, userEmail);
    query.setString(5, department);
    query.setString(6, userPhoneNum);
    query.setString(7, position);


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
        alert("회원가입 완료!")
        location.href="../login/login.jsp"
    </script>
    
</body>