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
    String userPhoneNum = request.getParameter("userPhoneNum");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm</title>
</head>
<body>
	<div style="text-align: center">
	<h3> 전화번호 확인 </h3>
    <form action="join_phonenum_check.jsp" onsubmit="return blankCheck(this)">
        전화번호 : <input type="text" id="userPhoneNum" name="userPhoneNum" maxlength="13" autofocus>
        <input type="submit" value="중복확인">
    </form>
    </div>
    

    <script>
        if("<%=userPhoneNum%>" == "null") {
           document.getElementById("userPhoneNum").setAttribute("value", " ")
        }
        else {
           document.getElementById("userPhoneNum").setAttribute("value", "<%=userPhoneNum%>")
        }

        function blankCheck() {
            if(document.getElementById("userPhoneNum").value.length == 0 || document.getElementById("userPhoneNum").value == "" ) {
                alert("전화번호를 입력해주세요")
                return false
            }
        }
    </script>
 </body>
 </html>
