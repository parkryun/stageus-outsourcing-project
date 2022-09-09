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

    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    

    
    if(!userID.equals("") && !userPW.equals("") && !userName.equals("") && !userPhoneNum.equals("") && !userEmail.equals("")) {
        String sql = "INSERT INTO users (userID, userPW, userName, userEmail, department, userPhoneNum, position) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, userID);
        query.setString(2, userPW);
        query.setString(3, userName);
        query.setString(4, userEmail);
        query.setString(5, department);
        query.setString(6, userPhoneNum);
        query.setString(7, position);

        query.executeUpdate();
    }
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
        if("<%=userID%>" != "" && "<%=userPW%>" != "" && "<%=userName%>" != "" && "<%=userPhoneNum%>" != "" && "<%=userEmail%>" != "") {
            alert("회원가입 완료!")
            location.href="../login/login.jsp"
        }
        else {
            alert('필수사항을 입력하세요')
            location.href="../join/join.jsp"
        }
    </script>
    
</body>