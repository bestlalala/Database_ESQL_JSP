<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // POST 방식의 한글처리
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
    <title>회원가입 페이지</title>
</head>
<body>
    <h1>회원가입</h1>
    <form action="insertUser.jsp" method="post">
        닉네임: <input type="text" name="nickname" ><br /><br />
        이름: <input type="text" name="username" ><br />
        주민번호 앞6자리+뒤1자리 (ex.0106274): <input type="text" name="regist_num" ><br /><br />
        <button type="submit">저장</button>
    </form>

</body>
</html>
