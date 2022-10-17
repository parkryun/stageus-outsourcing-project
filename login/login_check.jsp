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
    int checkId = 0;
    
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT userID FROM users";
    PreparedStatement query = connect.prepareStatement(sql);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(1));   // 아이디
        data.add(tmpData);
    }

    for(int i = 0; i < data.size(); i++) {
        if(userID.equals(data.get(i).get(0))) {
            checkId++;
        }
    } 

    // 아이디 존재x
    if(checkId == 0) {
        out.print("<script>alert('아이디가 존재하지 않습니다.');</script>");
        out.print("<script>location.href = '../login/login.jsp';</script>");
    }
    // 아이디 존재
    else {
        String sql2 = "SELECT userID, userPW, position, userName, department FROM users WHERE userID=?";
        PreparedStatement query2 = connect.prepareStatement(sql2);
        query2.setString(1, userID);
    
        ResultSet result2 = query2.executeQuery();
        ArrayList<ArrayList<String>> data2 = new ArrayList<ArrayList<String>>();
        
        
        while(result2.next()) {
            ArrayList<String> tmpData2 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
            tmpData2.add(result2.getString(1));   // 아이디
            tmpData2.add(result2.getString(2));   // 비밀번호
            tmpData2.add(result2.getString(3));   // 해당 직원 직급
            tmpData2.add(result2.getString(4));   // 해당 직원 이름
            tmpData2.add(result2.getString(5));   // 부서
            data2.add(tmpData2);
        }

        // 비밀번호 일치
        if(userPW.equals(data2.get(0).get(1))) {
            String position = data2.get(0).get(2); 
            String userName = data2.get(0).get(3); 
            String department = data2.get(0).get(4); 
            
            session.setAttribute("userID", userID); // 로그인하고 아이디 넘겨주고
            session.setAttribute("position", position); // 사이드바로 직급도 넘기기
            session.setAttribute("userName", userName); // 메인으로 이름도 넘기기
            session.setAttribute("department", department); // 사이드바로 부서 넘기기
            response.sendRedirect("../main/main.jsp");
        }
        // 비밀번호 일치x
        else {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
            out.print("<script>location.href = '../login/login.jsp';</script>");
        }
    }

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123</title>
</head>
<body>
        
</body>