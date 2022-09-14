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

    // 아이디 예외처리
    String ID_check = "ㅁㅁ";

    String sql = "SELECT userID FROM users";
    PreparedStatement query = connect.prepareStatement(sql);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();

    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>();
        tmpData.add(result.getString(1));
        data.add(tmpData);
    }

    for(int index = 0; index < data.length(); index++) {
        if(data[index][0] == userID) {
            ID_check = data[index][0];
            break;
        }
    }

    if(ID_check == userID) {
        response.sendRedirect("../join/join_check2.jsp");
    }
    else {
        // 빈칸 예외처리
        if(!userID.equals("") && !userPW.equals("") && !userName.equals("") && !userPhoneNum.equals("") && !userEmail.equals("")) {
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