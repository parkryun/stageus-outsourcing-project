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

    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");
    String sql = "SELECT * FROM users WHERE userID=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userID);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(1));   
        tmpData.add(result.getString(2));   
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
    }

    session.setAttribute("userID", userID);
    response.sendRedirect("../main/main.jsp");

    // 로그인 예외처리

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123</title>
</head>
<body>
        
</body>