<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>신체 측정 기록 관리</title>
</head>
<body>
<h2>신체 측정 기록 관리</h2>
<%
    int uid = 0;
    String snick = ""; String sql = "";
    try {
        if (session.getAttribute("id") != null) {
            uid = (int) session.getAttribute("id");
        }
        if (session.getAttribute("nickname") == null) {
            System.out.println("nickname 세션 없음");
        }
        snick = (String) session.getAttribute("nickname");

    } catch (Exception e) {
        e.printStackTrace();
    }
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

<p><a type="button" href="newPhysical.jsp">새로 등록하기</a></p>
</body>
</html>
