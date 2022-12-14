<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");

    String userName = request.getParameter("userName");
    String userPhoneNum = request.getParameter("userPhoneNum");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT userID FROM users WHERE userName=? AND userPhoneNum=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userName);
    query.setString(2, userPhoneNum);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>();
        tmpData.add('"' + result.getString(1) + '"'); // userID 
        data.add(tmpData);  
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
    <script>
        var find_id_check = '<%=data%>'

        find_id_check = JSON.parse(find_id_check)
        console.log(find_id_check)

        // 아이디가 없을 때
        if(find_id_check.length == 0) {
            alert("아이디가 존재하지않습니다.")
            location.href="find_id.jsp"    
        }
        // 아이디 존재
        else {
            alert("아이디는 " + find_id_check[0][0] + "입니다.")
            location.href="../login/login.jsp"
        }
    </script>
</body>