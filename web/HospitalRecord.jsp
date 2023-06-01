<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>병원 진료 기록 관리</title>
</head>
<body>
<h2>병원 진료 기록 관리</h2>

<%--조회하기--%>
<%@include file="sessionCheck.jsp"%>

<%--일반 회원--%>
<%  if (!snick.equals("root")) { %>
<p>나의 병원 진료 기록 목록</p>

<%--관리자--%>
<%   } else {   %>
<p>전체 회원의 병원 진료 기록 목록</p>
<% } %>

<%@include file="selectHospitalRecord.jsp"%>
<%--메뉴--%>
<a type="button" href="newRecord.jsp">등록하기</a>
<a type="button" href="index.jsp">뒤로가기</a>
</body>
</html>