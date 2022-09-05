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
                <input type="button" id="join_button" value="새 아이디 만들기">
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