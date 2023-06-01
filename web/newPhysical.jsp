<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>신체 측정 기록</title>
</head>
<body>
<h1>새로운 신체 측정 정보 기록하기</h1>
<form method="post" action="insertP.jsp">
    <label>키(cm):<input type="text" name="height"></label><br/>
    <label>체중(kg): <input type="text" name="weight"></label><br/>
    <label>허리 둘레(cm): <input type="text" name="waist"></label><br/>
    <label>체지방률(%): <input type="text" name="fat"></label><br/>
    <label>골격근량(kg): <input type="text" name="muscle"></label><br/>
    <label>기초대사량(kcal): <input type="text" name="metabolic_rate"></label><br/>
    <label>측정 날짜 (ex. 2023-05-28)(오늘이라면 0을 입력하세요.): <input type="text" name="measure_date"></label><br/>
    <button type="submit">등록</button>
</form>
<p><a href="Physical.jsp">뒤로 가기</a></p>
</body>
</html>
