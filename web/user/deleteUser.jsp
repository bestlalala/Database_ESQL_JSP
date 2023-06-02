<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>정말 회원 탈퇴 하시겠습니까? 회원 탈퇴를 원하신다면 닉네임을 한번 더 입력하세요.</p>
<form action="deleteUProcess.jsp" method="post">
    <input type="text" name="nickname">
    <button type="submit">회원 탈퇴</button>
</form>

</body>
</html>
