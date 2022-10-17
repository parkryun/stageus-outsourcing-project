<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    // 캘린더 날짜
    String calendarDate_month = request.getParameter("calendarDate_month");
    int month = Integer.parseInt(calendarDate_month);

    // 현재 날짜
    Calendar c = Calendar.getInstance(); 
    int today_month = c.get(Calendar.MONTH) + 1;
    int today_year = c.get(Calendar.YEAR);
    int today_day = c.get(Calendar.DATE);

    request.setCharacterEncoding("utf-8");

    String userName = (String)session.getAttribute("userName");
    String userID = (String)session.getAttribute("userID");
    
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");


//=================================================쿼리2 캘린더

String sql2 = "SELECT calendarContent, DAY(calendarDate), calendarDate, calendarNum, HOUR(calendarDate), MINUTE(calendarDate) FROM calendar WHERE userID=? AND MONTH(calendarDate)=? ORDER BY DAY(calendarDate) ASC"; // 조건으로 해당 날짜 나중에 팀 할때도 조건으로 올때도 월을 넘겨줘야지 다음달 할때도 폼에다가 10 벨류값 넣어서 보내줘서 가져오는거
PreparedStatement query2 = connect.prepareStatement(sql2);
query2.setString(1, userID);
query2.setString(2, calendarDate_month);

ResultSet result2 = query2.executeQuery();
ArrayList<ArrayList<String>> data2 = new ArrayList<ArrayList<String>>(); // var변수는 data2로 해서 배열 가져옴

while(result2.next()) {
    ArrayList<String> tmpData2 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
    tmpData2.add('"' + result2.getString(1) + '"'); // 일정 내용  
    tmpData2.add(result2.getString(2)); // 일정 일
    tmpData2.add('"' + result2.getString(3) + '"'); // 일정 날짜
    tmpData2.add(result2.getString(4)); // 일정 번호
    tmpData2.add(result2.getString(5)); // 일정 시
    tmpData2.add(result2.getString(6)); // 일정 분
    data2.add(tmpData2);  //2차원 배열에 이 배열 추가 
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


    <link rel="stylesheet" type="text/css" href="../header/header.css">
    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" type="text/css" href="../side_bar/side_bar.css">
</head>

<body>
    <%
      String headerPage = "../header/logout_header.jsp";
      String sidebarPage = "../side_bar/side_bar.jsp";
    %>
    <jsp:include page="<%=headerPage%>" flush="false"/>
    <jsp:include page="<%=sidebarPage%>" flush="false"/>

    <div id="diary_container">
        <div id="diary_logo"><%=userName%>의 diary</div>
        <form action="../calendar/calendar.jsp" id="diary_write_container">
            <div>일정 작성하기</div>
            <div id="diary_content">
                <textarea name="calendarContent" id="diary_content_text" onfocus="this.value=''">일정을 작성해주세요</textarea>
            </div>
            <div id="diary_date">
                <input type="date" name="calendarDate" id="calendar_date">
            </div>
            <input type="submit" value="작성" id="diary_write_button" onclick="contentCheck()">
        </form>

        <div id="schedule_month">
            <div id="schedule_container">
                <div><%=month%>월 일정</div>
                <table class="schedule_content" id="schedule_content_box">
                    
                </table>
                
                <div id="schedule_remove_update">
                    <div id="schedule_update">
                        <input type="button" value="일정 수정" id="schedule_update_button" onclick="calendarUpdate()">
                    </div>
                    <div id="schedule_remove">
                        <input type="button" value="일정 삭제" id="schedule_remove_button" onclick="calendarRemove()">
                    </div>
                </div>
            </div>
        </div>
        <form action="prev_next_month.jsp" id="prev_next_month_container">
            <input type="submit" name="calendarDate_month" value="<%=month - 1%>" id="prev_month_submit">
        
            <input type="submit" name="calendarDate_month" value="<%=month + 1%>" id="next_month_submit">
        </form>
    </div>
    
    <script src="main.js" type="text/javascript"></script>    
    <script>
        var today = '<%=today_year%>' + '-0' + '<%=today_month%>' + '-' + '<%=today_day%>'
        var calendarArray = '<%=data2%>'

        today = Date.parse(today)
        calendarArray = JSON.parse(calendarArray)

        console.log(calendarArray)
        console.log(calendarArray.length)
        console.log(typeof(calendarArray))

        if(calendarArray.length == 0) {
            var calendarTr = document.createElement('tr')
            var calendarTd = document.createElement('td')
            document.getElementById('schedule_content_box').appendChild(calendarTr)
            calendarTr.appendChild(calendarTd)
            calendarTd.innerHTML = "일정이 없습니다."
        }
        else {
            var calendarTr = document.createElement('tr')
            var calendarTd = document.createElement('td')
            document.getElementById('schedule_content_box').appendChild(calendarTr)
            calendarTr.appendChild(calendarTd)
            calendarTd.innerHTML = calendarArray[0][1] + "일 " + "<br>" + calendarArray[0][4] + "시 " + calendarArray[0][5] + "분           " + calendarArray[0][0]
            calendar_erase(0)

            for(var index = 1; index < calendarArray.length; index++) {
                if(calendarArray[index][1] != calendarArray[index-1][1]) { // 다른 날일 때  td tr 다 만들기
                    var calendarTr = document.createElement('tr')
                    var calendarTd = document.createElement('td')
                    document.getElementById('schedule_content_box').appendChild(calendarTr)
                    calendarTr.appendChild(calendarTd)
                    calendarTd.innerHTML = calendarArray[index][1] + "일 " + "<br>" + calendarArray[index][4] + "시 " + calendarArray[index][5] + "분           " + calendarArray[index][0]
                    calendar_erase(index)
                }
                else { // 같은 날일 때 td만 만들기
                    var calendarTr = document.createElement('tr')
                    var calendarTd = document.createElement('td')
                    document.getElementById('schedule_content_box').appendChild(calendarTr)
                    calendarTr.appendChild(calendarTd)
                    calendarTd.innerHTML = calendarArray[index][4] + "시 " + calendarArray[index][5] + "분           " + calendarArray[index][0]

                    if(today > Date.parse(calendarArray[index][2])) {
                        calendarTd.innerHTML = "<del>" + calendarArray[index][0] + "</del>"
                    }
                }
            }
        }

        function calendar_erase(index) {
            if(today > Date.parse(calendarArray[index][2])) {
                calendarTd.innerHTML = calendarArray[index][1] + "일 " + "<br>" + "<del>" + calendarArray[index][0] + "</del>"
            }
        }

        function contentCheck() {
            if(document.getElementById("diary_content_text").value == '' || document.getElementById("diary_content_text").value == "일정을 작성해주세요") {
                console.log(document.getElementById("diary_content_text").value)
                alert("일정을 작성해주세요")
                event.preventDefault()
            }
            else if(document.getElementById("calendar_date").value == '') {
                alert("날짜를 선택해주세요")
                event.preventDefault()
            }
        }
        
    </script>
</body>