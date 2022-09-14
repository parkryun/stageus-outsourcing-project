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

    //=================================================쿼리3 사용자
    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql3 = "SELECT * FROM users";
    PreparedStatement query3 = connect.prepareStatement(sql3);

    ResultSet result3 = query3.executeQuery();
    ArrayList<ArrayList<String>> data3 = new ArrayList<ArrayList<String>>();
    
    while(result3.next()) {
        ArrayList<String> tmpData3 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData3.add('"' + result3.getString(3) + '"');   // 이름
        tmpData3.add('"' + result3.getString(6) + '"');   // 부서
        tmpData3.add('"' + result3.getString(7) + '"');   // 직급
        data3.add(tmpData3);  //2차원 배열에 이 배열 추가 
    }  
    String team_Name = data3.get(0).get(0);
    String department_name = data3.get(0).get(1);
    String position_name = data3.get(0).get(2);
%>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="side_bar.css">

    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
    <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left_side_menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub">
                                <span class="material-symbols-outlined">
                                    menu
                                </span>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="left_sidebar-menu">

            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <h2>부서</h2>
                    <ul class="big_menu">
                        <li>개발팀 <i class="arrow fas fa-angle-right"></i></li>    
                        <ul class="small_menu" id="team_development">
                            
                        <li>
                            <form action="user_main.jsp">
                                <input type="submit" value="ㅋㅋㅋㅋ" name="team_Name">
                            </form>
                        </li>
                        </ul>
                    </ul>

                    <ul class="big_menu">
                        <li>인사팀 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu" id="team_hr">
                        </ul>
                    </ul>

                    <ul class="big_menu">
                        <li>마케팅팀</li>
                        <ul class="small_menu" id="team_marketing">
                        </ul>
                    </ul>
                </div>
            </div>
            <div class="overlay"></div>
        </div>

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".left_sub_menu").hide();
                $('.left_sidebar-menu').hide();
                $('.overlay').hide();

                $(".has_sub").click(function () {
                    $(".left_sub_menu").fadeToggle(300);
                    $('.left_sidebar-menu').fadeIn();
                    $('.overlay').fadeIn();
                });
                // 왼쪽메뉴 드롭다운
                $(".sub_menu ul.small_menu").hide();
                $(".sub_menu ul.big_menu").click(function () {
                    $("ul", this).slideToggle(300);
                });
                // 외부 클릭 시 좌측 사이드 메뉴 숨기기
                $('.overlay').on('click', function () {
                    $('.left_sub_menu').fadeOut();
                    $('.hide_sidemenu').fadeIn();
                    $('.overlay').fadeOut();
                    $('.left_sidebar-menu').fadeOut();
                });
            });
        </script>
        <script>
            var workerArray = '<%=data3%>'
            var team_development = '개발팀'
            var team_hr = '인사팀'
            var team_marketing = '마케팅팀'

            workerArray = JSON.parse(workerArray)

            if(workerArray.length == 0) {
                alert("팀원 없을 때 div")
            }
            else {
                for(var index = 0; index < workerArray.length; index++) {
                    if(workerArray[index][1] == team_development) { // 개발팀
                        var workerLi = document.createElement('li')
                        var workerForm = document.createElement('form')
                        var workerSubmit = document.createElement('input')

                        workerForm.action = "../main/user_main.jsp"

                        workerSubmit.setAttribute("type", "submit")
                        workerSubmit.setAttribute("name", "team_name")
                        workerSubmit.setAttribute("value", workerArray[index][0]) 

                        document.getElementById("team_development").appendChild(workerLi)
                        workerLi.appendChild(workerForm)
                        workerForm.appendChild(workerSubmit)

                    }
                    else if(workerArray[index][1] == team_hr) { // 인사팀
                        var workerLi = document.createElement('li')
                        var workerForm = document.createElement('form')
                        var workerSubmit = document.createElement('input')

                        workerForm.action = "../main/user_main.jsp"

                        workerSubmit.setAttribute("type", "submit")
                        workerSubmit.setAttribute("name", "team_name")
                        workerSubmit.setAttribute("value", workerArray[index][0])

                        document.getElementById("team_hr").appendChild(workerLi)
                        workerLi.appendChild(workerForm)
                        workerForm.appendChild(workerSubmit)

                    }
                    else if(workerArray[index][1] == team_marketing) { // 마케팅팀
                        var workerLi = document.createElement('li')
                        var workerForm = document.createElement('form')
                        var workerSubmit = document.createElement('input')

                        workerForm.action = "../main/user_main.jsp"

                        workerSubmit.setAttribute("type", "submit")
                        workerSubmit.setAttribute("name", "team_name")
                        workerSubmit.setAttribute("value", workerArray[index][0])

                        document.getElementById("team_marketing").appendChild(workerLi)
                        workerLi.appendChild(workerForm)
                        workerForm.appendChild(workerSubmit)

                    }
                    else {
                        continue
                    }
                }
            }

            
            console.log(workerArray)
        </script>
</body>