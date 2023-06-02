
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>건강 기록 관리</title>
</head>
<%@include file="main/header.jsp"%>
<body>
<%
  if (session.getAttribute("id") == null) {
%>
<%@include file="main/login/login.jsp"%>
<% } else { %>
<%@include file="main/login/loginWelcome.jsp"%>
<ul>
  <li><a href="hospital/selectHospital.jsp">병원 목록</a></li>
  <li><a href="hospital_record/HospitalRecord.jsp">병원 진료 기록</a></li>
  <li><a href="physical_info/Physical.jsp">신체 측정 기록</a></li>
  <li><a href="#">건강 기록 모아 보기</a></li>
  <li><a href="user/selectUser.jsp">회원 정보 조회</a></li>
  <li><a href="user/deleteUser.jsp">회원 탈퇴</a></li>
</ul>
<% } %>

</body>
</html>
