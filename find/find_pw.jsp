<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find pw</title>
    <link rel="stylesheet" type="text/css" href="find_pw.css">
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


    <div id="find_pw_container">
        <div id="find_pw_logo">find PW</div>
        <form action="find_pw_check.jsp" id="find_pw_content" onsubmit="return findPWInputCheck()">
            <div id="find_box">
                <div class="find_pw_input">
                    <div>id   </div>
                    <input type="text" id="userID" name="userID">
                </div>
                <div class="find_pw_input">
                    <div>name  </div>
                    <input type="text" id="userName" name="userName">
                </div>
                <div id="button_container">
                    <input type="submit" value="찾기" id="find_pw_button">
                </div>
            </div>
        </form>
    </div>
     
    <script>
        function findPWInputCheck() {
            var checkID = document.getElementById("userID").value
            var checkName = document.getElementById("userName").value

            if(checkID.length == 0 || checkID == "") {
                alert("아이디를 입력해주세요")
                return false
            }
            else if(checkName.length == 0 || checkName == "") {
                alert("이름을 입력해주세요")
                return false
            }
        }
    </script>
</body>