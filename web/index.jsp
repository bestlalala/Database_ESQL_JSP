
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>건강 기록 관리</title>
</head>
<%@include file="header.jsp"%>
<body>
<%
  if (session.getAttribute("id") == null) {
%>
<%@include file="login.jsp"%>
<% } else { %>
<%@include file="loginWelcome.jsp"%>
<ul>
  <li><a href="selectHospital.jsp">병원 목록</a></li>
  <li><a href="HospitalRecord.jsp">병원 진료 기록</a></li>
  <li><a href="#">신체 측정 기록</a></li>
  <li><a href="#">건강 기록 모아 보기</a></li>
  <li><a href="selectUser.jsp">회원 정보 조회</a></li>
  <li><a href="deleteUser.jsp">회원 탈퇴</a></li>
</ul>
<% } %>

</body>
</html>
