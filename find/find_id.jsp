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
        <form action="find_id_check.jsp" id="find_id_content">
            <div id="find_box">
                <div class="find_id_input">
                    <div>name   </div>
                    <input type="text" name="userName">
                </div>
                <div class="find_id_input">
                    <div>phone  </div>
                    <input type="text" name="userPhoneNum">
                </div>
                <div id="button_container">
                    <input type="submit" value="찾기" id="find_id_button">
                </div>
            </div>
        </form>
    </div>

</body>