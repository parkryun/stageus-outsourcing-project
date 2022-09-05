<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="header.css">
    <title>header</title>
</head>
<body>
    <header>
        <div id="board_link_container">
            <a href="../" id="board_link" class="header_link"></a>
        </div>
        <div id="content_link_container">
            <a href="../main/main.jsp" id="main_link" class="header_link">diary</a>
        </div>
        <div id="user_link_container">
                <a href="../login/login.jsp" id="login_link" class="header_link">login</a>
                <a href="../join/join.jsp" id="join_link" class="header_link">join</a>
               
        </div>
    </header>
    
    <div id="header"></div>
</body>
</html>