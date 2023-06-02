<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="sessionCheck.jsp"%>
<html>
<head>
    <title>신체 측정 기록 관리</title>
</head>
<body>
<h2>신체 측정 기록 관리</h2>
<%
    // 일반 회원
    if (!snick.equals("root")) {
        sql = "SELECT P#, U.nickname, U.username, user_height, user_weight, BMI, waist, fat, muscle, metabolic_rate, p_date\n" +
                "FROM Physical_info P JOIN MyUser U ON P.u#=U.U# \n" +
                "WHERE P.u# = ? ORDER BY p_date";
%>
<p>나의 신체 측정 기록 목록</p>
<p>나의 신체 측정 기록을 날짜 순으로 보여줍니다.</p>
<%
        // 관리자
    } else {
        sql = "SELECT P#, U.nickname, U.username, user_height, user_weight, BMI, waist, fat, muscle, metabolic_rate, p_date\n" +
                "FROM Physical_info P, MyUser U\n" +
                "WHERE P.u# = U.U# ORDER BY p_date";
%>
<p>전체 회원의 신체 측정 기록 목록</p>
<p>전체 회원의 신체 측정 기록을 날짜 순으로 보여줍니다.</p>
<%
    }
%>
<%@include file="selectPhysical.jsp"%>

<a type="button" href="newPhysical.jsp">새로 등록하기</a>
<a type="button" href="index.jsp">뒤로가기</a>
</body>
</html>
