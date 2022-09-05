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
    String userName = request.getParameter("userName");
    String userPhoneNum = request.getParameter("userPhoneNum");

    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT * FROM users WHERE userName=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userName);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(1));   
        tmpData.add(result.getString(5));   
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
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
            if("<%=userPhoneNum%>" == "<%=data.get(0).get(1)%>") {
                alert("<%=userName%>님의 아이디는 <%=data.get(0).get(0)%>입니다.")
                location.href="../login/login.jsp"
            }
            else {
                alert("전화번호가 일치하지 않습니다.")
                location.href="find_id.jsp"
            }
    </script>
</body>