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
    String userID = (String)session.getAttribute("userID");
    String userPW = request.getParameter("userPW");
    String userPW_check = request.getParameter("userPW_check");

    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    if(userPW == userPW_check) {
        String sql = "UPDATE users SET userPW=? WHERE userID=?";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, userPW);
        query.setString(2, userID);

        query.executeUpdate();
    }
    
    session.removeAttribute("userID");
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find ID</title>
    <link rel="stylesheet" type="text/css" href="../font.css">
</head>
<body>
    <script>
        if("<%=userPW%>" != "<%=userPW_check%>") {
            alert("비밀번호가 일치하지않습니다.");
            location.href="update_pw.jsp"
        }
        else {
            alert("비밀번호 수정 완료")
            location.href="../login/login.jsp"
        }            
    </script>
</body>