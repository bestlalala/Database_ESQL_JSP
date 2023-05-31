<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<html>
<head>
    <title>병원 진료 기록 등록</title>
</head>
<body>
<h1>새로운 병원 진료 기록하기</h1>
<form method="post" action="insertR.jsp">
    키(cm): <input type="text" name="height">
    체중(kg): <input type="text" name="weight">
    허리 둘레(cm): <input type="text" name="waist">
    체지방률(%): <input type="text" name="fat">
    골격근량(kg): <input type="text" name="muscle">
    기초대사량(kcal): <input type="text" name="metabolic_rate">
    측정 날짜 (ex. 2023-05-28)(오늘이라면 0을 입력하세요.): <input type="text" name="measure_date">
    <button type="submit">로그인</button>
</form>
<p><a href="HospitalRecord.jsp">뒤로 가기</a></p>

</body>
</html>
