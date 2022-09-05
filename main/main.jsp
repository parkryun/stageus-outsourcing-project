<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    // 받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");


    String userID = (String)session.getAttribute("userID");

    
    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT * FROM users WHERE userID=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userID);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    
    
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(3));   
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
    }

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="stylesheet" type="text/css" href="../font.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">


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

    <div id="diary_container">
        
        <%=userID%>
        
        <div id="diary_logo"><%=data.get(0).get(0)%>의 diary</div>

        <form id="diary_write_container">
            <div>일정 작성하기</div>
            <div id="diary_content">
                <textarea name="calendarContent" id="diary_content_text" onfocus="this.value=''">일정을 작성해주세요</textarea>
            </div>
            <div id="diary_date">
                <input type="date" name="calendarDate" id="calendar_date">
            </div>
            <input type="submit" value="작성" id="diary_write_button">
        </form>
        <div id="schedule_month">
            <a href="#" class="material-icons">
                arrow_back
            </a>
            <div id="schedule_container">
                <div>8월 일정</div>
                <table id="schedule_content">
                    <tr>
                        <th>14일</th>
                        <td>거래처 미팅</td>
                    </tr>
                    <tr>
                        <th>17일</th>
                        <td>인사 발표</td>
                    </tr>
                </table>
                <div id="schedule_remove_update">
                    <div id="schedule_update">
                        <input type="button" value="일정 수정" id="schedule_update_button">
                    </div>
                    <div id="schedule_remove">
                        <input type="button" value="일정 삭제" id="schedule_remove_button" onclick="test()">
                    </div>
                </div>
            </div>

            <a href="#" class="material-icons">
                arrow_forward
            </a>

        </div>


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
                            <li><a href="#">륜</a></li>
                            <li><a href="#">경찬</a></li>
                            <li><a href="">길동</a></li>
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
            <div class="overlay"></div>
        </div> -->
        
        <script>
            function test() {
                alert("권한 없음")
                }
            
        </script>
</body>