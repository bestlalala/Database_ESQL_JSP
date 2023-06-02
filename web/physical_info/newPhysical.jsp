<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/sessionCheck.jsp"%>
<html>
<head>
    <title>신체 측정 기록</title>
</head>
<body>
<h2>새로운 신체 측정 정보 기록하기</h2>
<form method="post" action="insertP.jsp">
    <% if (snick.equals("root")) { %>
    <label>회원 번호:        <input type="number" min="0" name="newPid"/></label><br/>
    <% } %>
    <label>키(cm):           <input type="number" min="10" step="0.1" name="height"></label><br/>
    <label>체중(kg):          <input type="number" min="1" step="0.1" name="weight"></label><br/>
    <label>허리 둘레(cm):       <input type="number" min="10" step="0.1" name="waist"></label><br/>
    <label>체지방률(%):         <input type="number" min="0" step="0.1" name="fat"></label><br/>
    <label>골격근량(kg):        <input type="number" min="0" step="0.1" name="muscle"></label><br/>
    <label>기초대사량(kcal):     <input type="number" min="0" step="0.1" name="metabolic_rate"></label><br/>
    <label>측정 날짜:           <input type="date" min="1900-01-01" name="measure_date" ></label><br/>
    <button type="submit">등록</button>
</form>
<p><a href="Physical.jsp">뒤로 가기</a></p>
</body>
</html>
