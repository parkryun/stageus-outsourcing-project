<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");

    String userID = request.getParameter("userID");
    String userName = request.getParameter("userName");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT userName FROM users WHERE userID=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userID);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); 
        tmpData.add(result.getString(1));   // userName
        data.add(tmpData);  
    }
    
    // 아이디가 없을 때
    if(data.size() == 0) {
        out.print("<script>alert('아이디가 존재하지 않습니다.');</script>");
        out.print("location.href = '../find/find_pw.jsp';");
    }
    else {
        // 아이디가 있는데 이름이랑 같은경우
        if(userName.equals(data.get(0).get(0))) {
            session.setAttribute("userID", userID); // 아이디를 비밀번호 수정하는곳으로 보내서 해당 아이디 비밀번호를 바꾸는거지

            response.sendRedirect("../find/update_pw.jsp");
        }
        // 아이디가 있는데 이름이랑 다른 경우
        else {
            out.print("<script>alert('아이디와 이름이 일치하지않습니다.');</script>");
            out.print("<script>location.href = '../find/find_pw.jsp';</script>");
        }
    }

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find ID</title>
    <link rel="stylesheet" type="text/css" href="../font.css">
</head>
<body>

</body>