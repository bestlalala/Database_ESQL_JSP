<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
</head>
<body>
    <h1>회원가입</h1>
    <form action="insertUser.jsp" method="post">
        닉네임: <input type="text" name="nickname" maxlength="15"><br /><br />
        이름: <input type="text" name="username" maxlength="20"><br />
        주민번호 앞6자리+뒤1자리 (ex.0106274): <input type="number" name="regist_num" minlength="7" maxlength="7"><br /><br />
        <button type="submit">저장</button>
    </form>
</body>
</html>
