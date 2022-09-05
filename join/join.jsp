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
                <input type="submit" value="회원가입" id="join_button" onclick="Button()"> 
            </div>
        </form>

    </div>


    <!-- 여기는 side_bar include 하자 -->
    <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                <span class="material-symbols-outlined">
                                    menu
                                </span>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <!-- <div class="left_sub_menu">
                <div class="sub_menu">
                    
                    <h2>부서</h2>
                    <ul class="big_menu">
                        <li>개발팀 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">박륜</a></li>
                            <li><a href="#">민경찬</a></li>
                            <li><a href="">홍길동</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>인사팀 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>마케팅팀</li>
                    </ul>
                </div>
            </div>
            <div class="overlay"></div> -->
        </div>
</body>
</html>