<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");

    String userID = (String)session.getAttribute("userID");
    String userPosition = (String)session.getAttribute("position");
    String userDepartment = (String)session.getAttribute("department");

    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    //=================================================쿼리3 사용자 사이드바 표시 **사용자 제외
    String sql3 = "SELECT userName, department, position, userID FROM users WHERE userID NOT IN (?)";
    PreparedStatement query3 = connect.prepareStatement(sql3);
    query3.setString(1, userID);

    ResultSet result3 = query3.executeQuery();
    ArrayList<ArrayList<String>> data3 = new ArrayList<ArrayList<String>>();
    
    while(result3.next()) {
        ArrayList<String> tmpData3 = new ArrayList<String>(); 
        tmpData3.add('"' + result3.getString(1) + '"');   // 이름 
        tmpData3.add('"' + result3.getString(2) + '"');   // 부서 
        tmpData3.add('"' + result3.getString(3) + '"');   // 직급 
        tmpData3.add('"' + result3.getString(4) + '"');   // main으로 보낼 id 
        data3.add(tmpData3); 
    }  
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
    <nav id="wrapper">
        <div id="sidebar_menu">
            <!-- 왼쪽 메뉴 -->  
            <div class="sidebar_open_button">
                <span class="material-symbols-outlined">
                    menu
                </span>
            </div>
            
            <div class="left_sidebar_menu"></div>

            <!-- 왼쪽 서브 메뉴 -->
            <main class="left_sub_menu">
                <div class="sub_menu">
                    <h2>부서</h2>
                    <section>
                        <ul class="big_menu">
                            <li class="team_menu">개발팀</li>    
                            <ul class="small_menu" id="team_development">
                            </ul>
                        </ul>
                    </section>
                    <section>
                        <ul class="big_menu">
                            <li class="team_menu">인사팀 <i class="arrow fas fa-angle-right"></i></li>
                            <ul class="small_menu" id="team_hr">
                            </ul>
                        </ul>
                    </section>
                    <section>
                        <ul class="big_menu">
                            <li class="team_menu">마케팅팀</li>
                            <ul class="small_menu" id="team_marketing">
                            </ul>
                        </ul>
                    </section>
                </div>
            </main>

            <div class="overlay"></div>
        </div>
    </nav>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
            $(function () {
                $(".left_sub_menu").hide()
                $('.left_sidebar_menu').hide()
                $('.overlay').hide()

                $(".sidebar_open_button").click(function () {
                    $(".left_sub_menu").fadeToggle(300)
                    $('.left_sidebar_menu').fadeIn()
                    $('.overlay').fadeIn()
                })

                // 왼쪽메뉴 드롭다운
                $(".sub_menu ul.small_menu").hide();
                $(".sub_menu ul.big_menu").click(function () {
                    $("ul", this).slideToggle(300)
                })

                // 외부 클릭 시 좌측 사이드 메뉴 숨기기
                $('.overlay').on('click', function () {
                    $('.left_sub_menu').fadeOut()
                    $('.hide_sidemenu').fadeIn()
                    $('.overlay').fadeOut()
                    $('.left_sidebar_menu').fadeOut()
                })
            })
    </script>
    <script>
            // 사용자 변수
            var userPosition = '<%=userPosition%>'
            var userDepartment = '<%=userPosition%>'
            // 회사 직원 배열
            var workerArray = '<%=data3%>'
            // 예외처리 변수
            var team_development = '개발팀'
            var team_hr = '인사팀'
            var team_marketing = '마케팅팀'
            var president = '사장'
            var teamLeader = '팀장'
            var Manager = '대리'
            var staff = '사원'

            workerArray = JSON.parse(workerArray)
            console.log(workerArray)
            workerList()

            if(userPosition == president) { // 사장일때
            }
            else if(userPosition == teamLeader) { // 팀장일 때
                if(userDepartment == team_development) {
                    submitDisabledHr()
                    submitDisabledMarketing()
                }
                else if(userDepartment == team_hr) {
                    submitDisabledDevelopment()
                    submitDisabledMarketing()
                }
                else {
                    submitDisabledDevelopment()
                    submitDisabledHr()
                }
            }
            else { // 대리와 사원
                submitDisabledDevelopment()
                submitDisabledHr()
                submitDisabledMarketing()
            }


    function workerList() { // 회사 인원들 출력
        if(workerArray.length == 0) {
            alert("팀원 없을 때 div")
        }
        else {
            for(var index = 0; index < workerArray.length; index++) {
                if(workerArray[index][1] == team_development) { // 개발팀
                    var workerLi = document.createElement('li')
                    var workerForm = document.createElement('form')
                    var workerSubmit = document.createElement('input')

                    workerSubmit.setAttribute("type", "submit")
                    workerSubmit.setAttribute("name", "requestName")
                    workerSubmit.setAttribute("value", workerArray[index][0]) 
                    workerSubmit.className = "team_development_submit"

                    workerForm.action = "../main/main.jsp"
                    workerForm.onsubmit = function() {
                        return submitIDToMain(index)
                    }

                    document.getElementById("team_development").appendChild(workerLi)
                    workerLi.appendChild(workerForm)
                    workerForm.appendChild(workerSubmit)
                }
                else if(workerArray[index][1] == team_hr) { // 인사팀
                    var workerLi = document.createElement('li')
                    var workerForm = document.createElement('form')
                    var workerSubmit = document.createElement('input')

                    workerSubmit.setAttribute("type", "submit")
                    workerSubmit.setAttribute("name", "requestName")
                    workerSubmit.setAttribute("value", workerArray[index][0])
                    workerSubmit.className = "team_hr_submit"

                    workerForm.action = "../main/main.jsp"
                    workerForm.onsubmit = function() {
                        return submitIDToMain(index)
                    }

                    document.getElementById("team_hr").appendChild(workerLi)
                    workerLi.appendChild(workerForm)
                    workerForm.appendChild(workerSubmit)
                }
                else if(workerArray[index][1] == team_marketing) { // 마케팅팀
                    var workerLi = document.createElement('li')
                    var workerForm = document.createElement('form')
                    var workerSubmit = document.createElement('input')

                    workerSubmit.setAttribute("type", "submit")
                    workerSubmit.setAttribute("name", "requestName")
                    workerSubmit.setAttribute("value", workerArray[index][0])
                    workerSubmit.className = "team_marketing_submit"

                    workerForm.action = "../main/main.jsp"
                    workerForm.onsubmit = function() {
                        return submitIDToMain(index)
                    }

                    document.getElementById("team_marketing").appendChild(workerLi)
                    workerLi.appendChild(workerForm)
                    workerForm.appendChild(workerSubmit)
                }
                else {
                    continue
                }
            }
        }
    } 
    // 권한이 없을 때 버튼 비활성화
    function submitDisabledDevelopment() { 
        var submitButton = document.getElementsByClassName("team_development_submit")
        for(var index = 0; index < submitButton.length; index++) {
        submitButton[index].disabled = true // 버튼 비활성
    }
    }

    function submitDisabledHr() {
        var submitButton = document.getElementsByClassName("team_hr_submit")
        for(var index = 0; index < submitButton.length; index++) {
        submitButton[index].disabled = true // 버튼 비활성
    }
    }

    function submitDisabledMarketing() {
        var submitButton = document.getElementsByClassName("team_marketing_submit")
        for(var index = 0; index < submitButton.length; index++) {
        submitButton[index].disabled = true // 버튼 비활성
    }
    }
    
    function submitIDToMain(arrayNum) {
        $(".team_development_submit").attr("value", workerArray[arrayNum][3]); // value에 아이디를 넣는거지
        $(".team_development_submit").attr("action", "../main/main.jsp");
    }
    </script>
</body>