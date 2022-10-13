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
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>update pw</title>
    <link rel="stylesheet" type="text/css" href="update_pw.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">
    <link rel="stylesheet" type="text/css" href="../font.css">
       
    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
    <%
      String headerPage = "../header/header.jsp";
    %>
    <jsp:include page="<%=headerPage%>" flush="false"/>

    <div id="find_pw_container">
        <div id="find_pw_logo">update PW</div>
        <form action="update_pw_check.jsp" id="find_pw_content" onsubmit="return updatePWInputCheck()">
            <div id="find_box">
                <div class="find_pw_input">
                    <div>PW   </div>
                    <input type="password" id="userPW" name="userPW">
                </div>
                <div class="find_pw_input">
                    <div>PW check  </div>
                    <input type="password" id="userPW_check" name="userPW_check">
                </div>
                <div>
                    <input type="submit" value="찾기" id="find_pw_button" >
                </div>
            </div>
        </form>
    </div>
    <script>
        function updatePWInputCheck() {
            var userPW = document.getElementById("userPW").value
            var userPW_check = document.getElementById("userPW_check").value

            if(userPW.length == 0 || userPW == "") {
                alert("수정할 비밀번호를 입력해주세요")
                return false
            }
            else if(userPW_check.length == 0 || userPW_check == "") {
                alert("수정할 비밀번호를 재확인해주세요")
                return false
            }
            // 일치하지않을때
            else if(userPW != userPW_check) {
                alert("비밀번호가 일치하지않습니다.")
                return false
            }
        }
    </script>
</body>