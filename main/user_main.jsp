<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    // 받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");


    String team_Name = request.getParameter("team_Name");

    
    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT * FROM users WHERE userName=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, team_Name);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(3));   
        tmpData.add(result.getString(1));   
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
    }

//=================================================쿼리2 캘린더
    String team_ID = data.get(0).get(1);

    String sql2 = "SELECT * FROM calendar WHERE userID=?";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1, team_ID);

    ResultSet result2 = query2.executeQuery();
    ArrayList<ArrayList<String>> data2 = new ArrayList<ArrayList<String>>();
    
    while(result2.next()) {
        ArrayList<String> tmpData2 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData2.add(result2.getString(2));  
        tmpData2.add(result2.getString(3));   
        data2.add(tmpData2);  //2차원 배열에 이 배열 추가 
    }      
    //=================================================쿼리3 사이드바 사용자

    String sql3 = "SELECT * FROM users";
    PreparedStatement query3 = connect.prepareStatement(sql3);

    ResultSet result3 = query3.executeQuery();
    ArrayList<ArrayList<String>> data3 = new ArrayList<ArrayList<String>>();
    
    while(result3.next()) {
        ArrayList<String> tmpData3 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData3.add(result3.getString(3));  
        data3.add(tmpData3);  //2차원 배열에 이 배열 추가 
    }  
    
//=================================================날짜
    
    Calendar c = Calendar.getInstance(); 
    int month = c.get(Calendar.MONTH);

    
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
        
        <div id="diary_logo"><%=data.get(0).get(0)%>의 diary</div>

        <div id="schedule_month">
            <a href="#" class="material-icons">
                arrow_back
            </a>
            <div id="schedule_container">
                <div><%=month %>월 일정</div>
                <table class="schedule_content" id="schedule_content_box">
                    <%
                        if(data2.size() != 0) {
                        for(int i = 0; i < data2.size(); i++) {
                    %>
                    <tr>
                        <th><%=data2.get(i).get(1)%> 일</th>
                        <td><%=data2.get(i).get(0)%></td>
                    </tr>
                    <%
                        }}
                        else {
                    %>
                            일정이 없습니다.
                    <%
                        }
                    %>
                    <tr>
                        <th>17일</th>
                        <td>인사 발표</td>
                    </tr>
                </table>

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
            <div class="left_sub_menu">
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
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <h2>부서</h2>
                    <ul class="big_menu">
                        <li>개발팀 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <%
                            if(data3.size() != 0) {
                            for(int i = 0; i < data3.size(); i++) {
                        %>
                        <li>
                            <a href="user_main.jsp"><%=data3.get(i).get(0)%></a>
                        </li>
                        <%
                            }}
                            else {
                        %>
                                회원이 없습니다.
                        <%
                            }
                        %>
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
        </div>
        
        <script>

                $(".has_sub").click(function () {
                    $(".left_sub_menu").fadeToggle(300);
                    $('.overlay').fadeIn();
                });
                // 왼쪽메뉴 드롭다운
                
                $(".sub_menu ul.big_menu").click(function () {
                    $("ul", this).slideToggle(300);
                    $(".sub_menu ul.small_menu").fadeIn();
                });
                // 외부 클릭 시 좌측 사이드 메뉴 숨기기
                $('.overlay').on('click', function () {
                    $('.left_sub_menu').fadeOut();
                    $('.hide_sidemenu').fadeIn();
                });
        </script>
</body>