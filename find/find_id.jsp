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
      String headerPage = "../header/logout_header.jsp";
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
                <div>
                    <input type="submit" value="찾기" id="find_id_button" onclick="findButton()">
                </div>
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