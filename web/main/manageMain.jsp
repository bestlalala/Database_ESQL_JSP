<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
</head>
<body>
<h1>관리자 전용 페이지</h1>
<p>관리자님 안녕하세요!</p>
<ul>
    <li><a href="login/logout.jsp">로그아웃</a></li>
    <li><a href="../user/selectUser.jsp">회원 관리</a></li>
    <li><a href="../hospital/selectHospital.jsp">병원 목록</a></li>
    <li><a href="../hospital_record/HospitalRecord.jsp">병원 진료 기록</a></li>
    <li><a href="../physical_info/Physical.jsp">신체 측정 기록</a></li>
    <li><a href="../summarize/selectAll.jsp">건강 기록 모아 보기</a></li>
</ul>
</body>
</html>
