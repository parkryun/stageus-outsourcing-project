<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>

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

//=================================================쿼리2 캘린더

    String sql2 = "SELECT * FROM calendar WHERE userID=?";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1, userID);

    ResultSet result2 = query2.executeQuery();
    ArrayList<ArrayList<String>> data2 = new ArrayList<ArrayList<String>>();
    
    while(result2.next()) {
        ArrayList<String> tmpData2 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData2.add(result2.getString(2)); // 일정 내용  
        tmpData2.add(result2.getString(3)); // 일정 날짜
        data2.add(tmpData2);  //2차원 배열에 이 배열 추가 
    }      

    //=================================================쿼리3 팀원

    String sql3 = "SELECT * FROM users";
    PreparedStatement query3 = connect.prepareStatement(sql3);

    ResultSet result3 = query3.executeQuery();
    ArrayList<ArrayList<String>> data3 = new ArrayList<ArrayList<String>>();
    
    while(result3.next()) {
        ArrayList<String> tmpData3 = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData3.add(result3.getString(3));  
        data3.add(tmpData3);  //2차원 배열에 이 배열 추가 
    }  
    String team_Name = data3.get(0).get(0);
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
        
        <div id="diary_logo"><%=data.get(0).get(0)%>의 diary</div>
        <form action="../calendar/calendar.jsp" id="diary_write_container">
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
        <div id="prev_next_month_container">
            <a href="#" class="material-icons">
                arrow_back
            </a>
            <a href="#" class="material-icons">
                arrow_forward
            </a>
        </div>
    </div>
    
    <script src="main.js"></script>    
</body>