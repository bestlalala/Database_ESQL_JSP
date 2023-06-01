<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>새로운 병원 등록</h1>
<form method="post" action="insertH.jsp">
    <label>병원 이름 (50자 이내) : <input type="text" name="hname"></label><br/>
    <label>병원 종류 (20자 이내, ex. general) : <input type="text" name="subject"></label><br/>
    <label>지역 (15자 이내) : <input type="text" name="location"></label><br/>
    <button type="submit">등록</button>
</form>
<p><a href="selectHospital.jsp">뒤로 가기</a></p>
</body>
</html>
