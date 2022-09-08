<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">
    <link rel="stylesheet" type="text/css" href="../font.css">
    
    <link rel="stylesheet" type="text/css" href="../side_bar/side_bar.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">
    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
    <%
      String headerPage = "../header/header.jsp";
    %>
    <jsp:include page="<%=headerPage%>" flush="false"/>


    <div id="login_container">
        <div id="login_logo">login</div>
        <form action="login_check.jsp" id="login_content">
            <input name="userID" type="text" id="login_id_container" value="ID" onfocus="this.value=''">
            <input name="userPW" type="password" id="login_pw_container" placeholder="PassWord" onfocus="this.placeholder=''">
            <div id="login_check_container">
                <input type="submit" id="login_button" value="로그인">
            </div>

            <div>
                <div id="find_container">
                    <div>
                        <a href="../find/find_id.jsp" class="find_link">아이디 찾기</a>
                    </div>
                    <div>
                        <a href="../find/find_pw.jsp" class="find_link">비밀번호 찾기</a>
                    </div>
                </div>
            </div>

            <div id="join_button_container">
                <input type="button" id="join_button" value="새 아이디 만들기" onclick="moveJoin()">
            </div>
        </form>
    </div>

    <script>
        function moveJoin() {
            location.href="../join/join.jsp"
        }
    </script>
</body>
</html>