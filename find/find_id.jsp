<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find ID</title>
    <link rel="stylesheet" type="text/css" href="find_id.css">
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


    <div id="find_id_container">
        <div id="find_id_logo">find ID</div>
        <form action="find_id_check.jsp" id="find_id_content" onsubmit="return findIDInputCheck()">
            <div id="find_box">
                <div class="find_id_input">
                    <div>name   </div>
                    <input type="text" name="userName" id="userName">
                </div>
                <div class="find_id_input">
                    <div>phone  </div>
                    <input type="text" name="userPhoneNum" id="userPhoneNum">
                </div>
                <div id="button_container">
                    <input type="submit" value="찾기" id="find_id_button">
                </div>
            </div>
        </form>
    </div>

    <script>
        function findIDInputCheck() {
            var checkName = document.getElementById("userName").value
            var userPhoneNum = document.getElementById("userPhoneNum").value

            if(checkName.length == 0 || checkName == "") {
                alert("이름을 입력해주세요")
                return false
            }
            else if(userPhoneNum.length == 0 || userPhoneNum == "") {
                alert("전화번호를 입력해주세요")
                return false
            }
        }
    </script>
</body>