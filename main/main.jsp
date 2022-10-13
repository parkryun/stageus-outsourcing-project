<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    //날짜
    Calendar c = Calendar.getInstance(); 
    int month = c.get(Calendar.MONTH) + 1;
    int year = c.get(Calendar.YEAR);
    int day = c.get(Calendar.DATE);
    String calendarDate_month = Integer.toString(month);

    
    request.setCharacterEncoding("utf-8");


    String userID = (String)session.getAttribute("userID");
    String userName = (String)session.getAttribute("userName");
    String position = (String)session.getAttribute("position");

    
    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    // =================================================쿼리1 사용자 이름
    String sql = "SELECT userName FROM users WHERE userID=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userID);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(1));   
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
    }

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
        <h1 id="diary_logo"><%=userName%>의 diary</h1>
        <main>
            <section>
                <form action="../calendar/calendar.jsp" id="diary_write_container">
                    <h2>일정 작성하기</h2>
                    <div id="diary_content">
                        <textarea name="calendarContent" id="diary_content_text" onfocus="this.value=''">일정을 작성해주세요</textarea>
                    </div>
                    <div id="diary_date_and_time">
                        <div id="diary_date">
                            <input type="date" name="calendarDate" id="calendar_date">
                        </div>
                        <div id="diary_time">
                            <input type="time" name="calendarTime" id="calendar_time">
                        </div>
                    </div>
                    <input type="submit" value="작성" id="diary_write_button" onclick="contentCheck()">
                </form>
            </section>
    
            <section id="schedule_month">
                    <form id="schedule_container" action="../calendar/calendar_remove.jsp">
                        <h2><%=month %>월 일정</h2>
                        <p class="schedule_content" id="schedule_content_box"></p>
                        
                        <div id="schedule_remove_update">
                            <div id="schedule_update">
                                <input type="button" value="일정 수정" class="schedule_update_btn" id="schedule_update_button" onclick="calendarUpdateFunction()">
                            </div>
                            <div id="schedule_remove">
                                <input type="button" value="일정 삭제" class="schedule_remove_btn" id="schedule_remove_button" onclick="calendarRemoveFunction()">
                            </div>
                            <div>
                                <input type="button" value="완료" class="schedule_update_remove_finish_btn" onclick="calendarUpdateRemoveFinishFunction()">
                            </div>
                            <div>
                                <input type="submit" value="수정" class="schedule_update_submit">
                            </div>
                        </div>
                    </form>
            </section>
        </main>
        <form action="prev_next_month.jsp" id="prev_next_month_container">
            
            <input type="submit" name="calendarDate_month" value="<%=month - 1%>" id="prev_month_submit">
        
            <input type="submit" name="calendarDate_month" value="<%=month + 1%>" id="next_month_submit">
        </form>
    </div>

    <script src="main.js" type="text/javascript"></script>    
    <script>
        $(".schedule_update_remove_finish_btn").hide();
        $(".schedule_update_submit").hide();

        var today = "<%=today%>"
        var calendarArray = '<%=data2%>'

        // 가져온 값 정제
        today = Date.parse(today)
        calendarArray = JSON.parse(calendarArray)

        console.log(Date.parse(calendarArray[0][2]))


        if(calendarArray.length == 0) {
            var calendarTr = document.createElement('tr')
            var calendarTd = document.createElement('td')
            document.getElementById('schedule_content_box').appendChild(calendarTr)
            calendarTr.appendChild(calendarTd)
            calendarTd.innerHTML = "일정이 없습니다."
        }
        else {
            //===========================li     
            var calendarForm = document.createElement('form') // 각 일정마다 수정 삭제 form
            var calendarDayUl = document.createElement('ul') // 날짜 리스트
            var calendarDayLi = document.createElement('li')
            calendarDayLi.className = "calendar_day_li"

            var calendarUl = document.createElement('ul') // 일정 리스트
            var calendarLi = document.createElement('li')
                // li로 버튼을 만들 수 있으려나
            calendarForm.action = "../calendar/calendar_remove.jsp"
            calendarForm.onsubmit = function() {
                return clickRemoveButton(calendarArray[0][3])
            }

            document.getElementById('schedule_content_box').appendChild(calendarDayUl)
            calendarDayUl.appendChild(calendarDayLi) // 날짜 li
            calendarDayUl.appendChild(calendarUl) // 일정 ul 넣기
            calendarUl.appendChild(calendarForm) // 일정 ul에 일정 form넣기
            calendarForm.appendChild(calendarLi)


            calendarDayLi.innerHTML = calendarArray[0][1] + "일 " 
            calendarLi.innerHTML = calendarArray[0][4] + "시 " + calendarArray[0][5] + "분           " + calendarArray[0][0] // 일정 이너값

            calendarLi.setAttribute('value', calendarArray[0][3])

            calendarLi.className = "calendarLi"
            calendarForm.className = "calendarForm"
            // index가 없어서========================================
            // var updateTextarea = document.createElement("input")

            // updateTextarea.setAttribute("type", "textarea")
            // updateTextarea.setAttribute("name", "updateCalendarContent")

            // updateTextarea.className = "calendar_update_textarea"

            // calendarForm.appendChild(updateTextarea)
            // updateTextarea.setAttribute("value", calendarArray[0][0])

            // $(".calendar_update_textarea").hide();
            //===========================================================================

            calendarUpdateRemove(0)
            calendar_erase(0)
            



            for(var index = 1; index < calendarArray.length; index++) {
                if(calendarArray[index][1] != calendarArray[index-1][1]) { // 다른 날일 때  td tr 다 만들기

                    var calendarForm = document.createElement('form') // 각 일정마다 수정 삭제 form
                    var calendarDayUl = document.createElement('ul') // 날짜 리스트
                    var calendarDayLi = document.createElement('li')
                    var calendarNumber = calendarArray[index][3]

                    calendarDayLi.className = "calendar_day_li"

                    var calendarUl = document.createElement('ul') // 일정 리스트
                    var calendarLi = document.createElement('li')

                    calendarForm.action = "../calendar/calendar_remove.jsp"
                    calendarForm.onsubmit = function() {
                        return clickRemoveButton(calendarNumber)
                    }


                    document.getElementById('schedule_content_box').appendChild(calendarDayUl)
                    calendarDayUl.appendChild(calendarDayLi) // 날짜 li
                    calendarDayUl.appendChild(calendarUl) // 일정 ul 넣기
                    calendarUl.appendChild(calendarForm) // 일정 ul에 일정 form넣기
                    calendarForm.appendChild(calendarLi)

                    calendarDayLi.innerHTML = calendarArray[index][1] + "일 " 
                    calendarLi.innerHTML = calendarArray[index][4] + "시 " + calendarArray[index][5] + "분           " + calendarArray[index][0]

                    calendarLi.className = "calendarLi"
                    calendarForm.className = "calendarForm"

                    calendarLi.setAttribute("value", calendarArray[index][3])

                    calendarUpdateTextarea()
                    calendarUpdateRemove(index)
                    calendar_erase(index)
                }
                else { // 같은 날일 때 ul, li 만들기

                    var calendarForm = document.createElement('form')
                    var calendarUl = document.createElement('ul') // 일정 리스트
                    var calendarLi = document.createElement('li')
                    var calendarNumber = calendarArray[index][3]

                    calendarForm.action = "../calendar/calendar_remove.jsp"

                    calendarForm.onsubmit = function() {
                        return clickRemoveButton(calendarNumber)
                    }
                    
                    calendarDayLi.className = "calendar_day_li"

                    calendarDayUl.appendChild(calendarUl) // 일정 ul 넣기
                    calendarUl.appendChild(calendarForm) // 일정 ul에 일정 form넣기
                    calendarForm.appendChild(calendarLi)
                    
                    calendarLi.className = "calendarLi"
                    calendarForm.className = "calendarForm"

                    calendarLi.innerHTML = calendarArray[index][4] + "시 " + calendarArray[index][5] + "분           " + calendarArray[index][0]

                    calendarLi.setAttribute("value", calendarArray[index][3])

                    calendarUpdateTextarea()
                    calendarUpdateRemove(index)
                    calendar_erase(index)
                }
            }
        }

        function calendar_erase(index) {
            if(today > Date.parse(calendarArray[index][2])) {
                calendarLi.innerHTML = "<del>" + calendarArray[index][0] + "</del>"
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
            else if(document.getElementById("calendar_time").value == '') {
                alert("시간을 선택해주세요")
                event.preventDefault()
            }
        }

        function calendarUpdateRemove(calendarNumber) {
            var calendarUpdateRemoveLi = document.createElement('li')
            var calendarRemove = document.createElement('input')
            var calendarUpdate = document.createElement('input')
            
            calendarRemove.setAttribute("type", "submit")
            calendarUpdate.setAttribute("type", "button")
            calendarRemove.setAttribute("value", "삭제")
            calendarUpdate.setAttribute("value", "수정")
            calendarRemove.id = "schedule_remove_button"
            calendarUpdate.id = "schedule_update_button"
            calendarRemove.className = "calendar_td_remove_button"
            calendarUpdate.className = "calendar_td_update_button"

            calendarRemove.setAttribute("name", "calendarNum")
            calendarUpdate.setAttribute("name", "calendarNum")
            

            calendarForm.appendChild(calendarRemove)
            calendarForm.appendChild(calendarUpdate)

            $(".calendar_td_remove_button").hide();
            $(".calendar_td_update_button").hide();

            // calendarUpdate.onclick = function() {
            //     // 수정된 값은 그 걸로 네임이랑 벨류 가져가면 될거고
            //     // 캘린더 넘버를 가져와야하는데
            //     // li hide 하고 textarea show
            //     $(updateTextarea).show();
            //     $(calendarLi).hide();

            //     $('input[name=calendarNum]').attr("value", calendarNumber);
            //     $(".calendarForm").attr("action", "../calendar/calendar_update.jsp");
            // }
        }

        function calendarUpdateTextarea() {
            var updateTextarea = document.createElement("input")

            updateTextarea.setAttribute("type", "textarea")
            updateTextarea.setAttribute("name", "updateCalendarContent")

            updateTextarea.className = "calendar_update_textarea"

            calendarForm.appendChild(updateTextarea)
            updateTextarea.setAttribute("value", calendarArray[index][0])

            $(".calendar_update_textarea").hide();
        }

        function calendarUpdateFunction() {
            $(".calendar_td_update_button").show();
            $(".schedule_remove_btn").hide();
            $(".schedule_update_btn").hide();

            $(".schedule_update_remove_finish_btn").show();
            $(".schedule_update_submit").show();

            $("#schedule_container").attr("action", "../calendar/calendar_update.jsp");     
        }

        function calendarRemoveFunction() {
            $(".calendar_td_remove_button").show();
            $(".schedule_remove_btn").hide();
            $(".schedule_update_btn").hide();
            $(".schedule_update_remove_finish_btn").show();

        }

        function calendarUpdateRemoveFinishFunction() {
            $(".schedule_update_btn").show();
            $(".schedule_remove_btn").show();
            $(".calendarLi").show();
            $(".calendar_td_update_button").hide();
            $(".calendar_td_remove_button").hide();
            $(".calendar_update_textarea").hide();
            $(".schedule_update_remove_finish_btn").hide();
            $(".schedule_update_submit").hide();         

        }
        
        function clickRemoveButton(calendarNumber) {
            if(confirm("정말 삭제하시겠습니까?")) {
                $('input[name=calendarNum]').attr("value",calendarNumber);
                $(".schedule_remove_update_form").attr("action", "../calendar/calendar_remove.jsp");
            }
            else {      
                return false
            }
        }

    </script>
</body>
