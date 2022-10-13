<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");

    String userPhoneNum = request.getParameter("userPhoneNum");

    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT userPhoneNum FROM users WHERE userPhoneNum=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userPhoneNum);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();

    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add('"' + result.getString(1) + '"'); // 있는지 확인  
        data.add(tmpData);  
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
        var userPhonecheck = '<%=data%>'
        userPhonecheck = JSON.parse('<%=data%>')
        console.log(userPhonecheck)

        if(userPhonecheck.length == 0) {
            opener.document.getElementById("userPhoneNum").value = "<%=userPhoneNum%>"
            opener.document.getElementById("id_uncheck").value = "id_check"
            opener.document.getElementById("userPhoneNum").readOnly = true 
            alert("사용 가능한 전화번호입니다.")

            window.close()
        }
        else {
            alert("이미 존재하는 전화번호입니다.")
            location.href="join_phonenum_check_form.jsp"    
        }

        
    </script>
</body>