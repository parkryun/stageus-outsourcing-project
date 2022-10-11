<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    // 직급 확인 (사장, 팀장 1명)
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver"); // 우리가 설치한 connecter 파일 가져오는 줄
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/outsourcing", "cono", "1234");

    String sql = "SELECT department, position FROM users WHERE position='팀장' OR position='사장'";
    PreparedStatement query = connect.prepareStatement(sql);

    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>(); // 2차원 배열에 들어갈 배열 생성
        tmpData.add('"' + result.getString(1) + '"');   // 부서
        tmpData.add('"' + result.getString(2) + '"');   // 직급
        data.add(tmpData);  //2차원 배열에 이 배열 추가 
    }
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link rel="stylesheet" type="text/css" href="join.css">
    <link rel="stylesheet" type="text/css" href="../font.css">
    <link rel="stylesheet" type="text/css" href="../header/header.css">

    <link rel="stylesheet" type="text/css" href="assets/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" type="text/css" href="../side_bar/side_bar.css">
</head>

<body>
    <%
      String headerPage = "../header/header.jsp";
    %>
    <jsp:include page="<%=headerPage%>" flush="false"/>

    <main id="join_container">
        <h1 id="join_logo">join</h1>
            <section>
                <form action="join_check.jsp" id="join_content" onsubmit="return JoinInputCheck()">
                    <table>
                        <tr>
                            <th>
                                아이디
                                <img src="../red_star_img.png">
                            </th> 
                            <td>
                                <input type="text" name="userID" id="userID">
                                <input type="button" onclick="idCheck()" name="id_check" value="중복체크">
                                <input type="hidden" id="id_uncheck" name="id_duplication" value="id_uncheck">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                비밀번호
                                <img src="../red_star_img.png">
                            </th>
                            <td><input type="password" id="userPW" name="userPW"></td>
                        </tr>
                        <tr>
                            <th>
                                비밀번호 확인
                                <img src="../red_star_img.png">
                            </th>
                            <td><input type="password" id="userPWCheck" name="userPWCheck"></td>
                        </tr>
                        <tr>
                            <th>
                                이름
                                <img src="../red_star_img.png">
                            </th>
                            <td><input type="text" id="userName" name="userName"></td>
                        </tr>
                        <tr>
                            <th>
                                전화번호
                                <img src="../red_star_img.png">
                            </th>
                            <td><input type="text" id="userPhoneNum" name="userPhoneNum"></td>
                        </tr>
                        <tr>
                            <th>
                                이메일
                                <img src="../red_star_img.png">
                            </th>
                            <td><input type="text" id="userEmail" name="userEmail"></td>
                        </tr>
                        <tr>
                            <th>
                                부서
                            </th>
                            <td>
                                <select name="department" id="department">
                                    <option value="개발팀">개발팀</option>
                                    <option value="인사팀">인사팀</option>
                                    <option value="마케팅팀">마케팅팀</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                직급
                            </th>
                            <td>
                                <select name="position" id="position">
                                    <option value="사장">사장</option>
                                    <option value="팀장">팀장</option>
                                    <option value="대리">대리</option>
                                    <option value="사원">사원</option>
                                </select>
                            </td>
                        </tr>
                    </table>
            </section>
            <section id="join_submit_container">
                <input type="submit" value="회원가입" id="join_button"> 
            </section>
        </form>
    </main>
    <script>
        var positionArray = '<%=data%>'
        positionArray = JSON.parse(positionArray)

        var presidentNum = 0 // 사장 수
        var developmentTeamLeaderNum = 0 // 개발팀장 수 
        var hrTeamLeaderNum = 0 // 인사팀장 수
        var marketingTeamLeaderNum = 0 // 마케팀장 수

        for(var index = 0; index < positionArray.length; index++) { // 사장, 팀장 수 증가
            if(positionArray[index][1] == "사장") {
                presidentNum++
            }
            else if(positionArray[index][1] == "팀장") {
                if(positionArray[index][0] == "개발팀") {
                    developmentTeamLeaderNum++
                }
                else if(positionArray[index][0] == "마케팅팀") {
                        marketingTeamLeaderNum++
                }
                else if(positionArray[index][0] == "인사팀") {
                    hrTeamLeaderNum++
                }
            }
        }
        
        function idCheck() {
            if(document.getElementById("userID").value == "") {
                alert("아이디를 입력해주세요")
            }
            else {
                window.open("join_id_check_form.jsp?userID="+document.getElementById("userID").value,"", "width=400, height=350")
            }
        }

        // 입력값 체크
        function JoinInputCheck() {
            var checkID = document.getElementById("userID").value
            var checkPW = document.getElementById("userPW").value
            var PWReCheck = document.getElementById("userPWCheck").value
            var checkName = document.getElementById("userName").value
            var checkPhoneNum = document.getElementById("userPhoneNum").value
            var checkEmail = document.getElementById("userEmail").value
            var department = document.getElementById("department").value
            var position = document.getElementById("position").value
            
            if(checkID.length == 0 || checkID == "") {
                alert("아이디를 입력해주세요")
                return false
            }
            else if(checkPW.length == 0 || checkPW == "") {
                alert("비밀번호를 입력해주세요")
                return false
            }
            else if(checkName.length == 0 || checkName == "") {
                alert("이름을 입력해주세요")
                return false
            }
            else if(checkPhoneNum.length == 0 || checkPhoneNum == "") {
                alert("전화번호를 입력해주세요")
                return false
            }
            else if(checkEmail.length == 0 || checkEmail == "") {
                alert("이메일을 입력해주세요")
                return false
            }
            else if(document.getElementById("id_uncheck").value == "id_uncheck") {
                alert("아이디 중복체크를 해주세요")
                return false
            }
            else if(checkPW != PWReCheck) {
                alert("비밀번호가 일치하지않습니다.")
                return false
            }

            // 직급 예외 처리================================================================
            if(position == "사장") {
                if(presidentNum > 0) {
                    alert("다른 직급을 선택해주세요")
                    return false
                }
            }
            else if(position == "팀장") {
                if(department == "마케팅팀") {
                    if(marketingTeamLeaderNum > 0) {
                        alert("다른 직급을 선택해주세요")
                        return false
                    }
                }
                else if(department == "인사팀") {
                    if(hrTeamLeaderNum > 0) {
                        alert("다른 직급을 선택해주세요")
                        return false
                    }
                }
                else if(department == "개발팀") {
                    if(developmentTeamLeaderNum > 0) {
                        alert("다른 직급을 선택해주세요")
                        return false
                    }
                }
            }
        }
    </script>
</body>
</html>