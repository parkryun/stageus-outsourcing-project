<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link rel="stylesheet" type="text/css" href="join.css">
    <link rel="stylesheet" type="text/css" href="../font.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">

    <link rel="stylesheet" type="text/css" href="../side_bar/side_bar.css">
    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" type="text/css" href="../side_bar/side_bar.css">
</head>

<body>
    <%
      String headerPage = "../header/header.jsp";
    %>
    <jsp:include page="<%=headerPage%>" flush="false"/>

    <div id="join_container">
        <div id="join_logo">join</div>
        <form action="join_check.jsp" id="join_content">
            <table>
                <tr>
                    <th>
                        아이디
                        <img src="../red_star_img.png">
                    </th> 
                    <td>
                        <input type="text" name="userID">
                    </td>
                </tr>
                <tr>
                    <th>
                        비밀번호
                        <img src="../red_star_img.png">
                    </th>
                    <td><input type="password" name="userPW"></td>
                </tr>
                <tr>
                    <th>
                        이름
                        <img src="../red_star_img.png">
                    </th>
                    <td><input type="text" name="userName"></td>
                </tr>
                <tr>
                    <th>
                        전화번호
                        <img src="../red_star_img.png">
                    </th>
                    <td><input type="text" name="userPhoneNum"></td>
                </tr>
                <tr>
                    <th>
                        이메일
                        <img src="../red_star_img.png">
                    </th>
                    <td><input type="text" name="userEmail"></td>
                </tr>
                <tr>
                    <th>
                        부서
                    </th>
                    <td><input type="text" name="department"></td>
                </tr>
                <tr>
                    <th>
                        직급
                    </th>
                    <td><input type="text" name="position"></td>
                </tr>
            </table>

            <div id="join_submit_container">
                <input type="submit" value="회원가입" id="join_button"> 
            </div>
        </form>

    </div>
</body>
</html>