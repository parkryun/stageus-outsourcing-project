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


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm</title>
</head>
<body>
	<div style="text-align: center">
	<h3> 아이디 중복확인 </h3>
    <form action="join_id_check.jsp" onsubmit="return blankCheck(this)">
        아이디 : <input type="text" id="userID" name="userID" maxlength="10" autofocus>
        <input type="submit" value="중복확인">
    </form>
    </div>
    

    <script>
        if("<%=userID%>" == "null") {
           document.getElementById("userID").setAttribute("value", " ")
        }
        else {
           document.getElementById("userID").setAttribute("value", "<%=userID%>")
        }
    </script>
 </body>
 </html>
