<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/sessionCheck.jsp"%>
<%@ include file="../main/dbconn.jsp"%>
<html>
<head>
    <title>신체 측정 기록 관리</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid rgb(1,27,20);
        }

        th {
            width: 100px;
            background-color: rgb(16,229,170);
            border: 1px solid rgb(1,27,20);
            padding: 3px;
        }

        td {
            text-align: center;
            border: 1px solid rgb(1,27,20);
            padding: 5px;
        }
    </style>
</head>
<%@include file="../main/header.jsp"%>
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
<table>
    <tr>
        <th>P#</th>
        <th>회원 닉네임</th>
        <th>회원 이름</th>
        <th>키(cm)</th>
        <th>체중(kg)</th>
        <th>BMI</th>
        <th>허리 둘레(cm)</th>
        <th>체지방률(%)</th>
        <th>골격근량(kg)</th>
        <th>기초대사량(kcal)</th>
        <th>진료 날짜</th>
        <th>선택</th>
    </tr>
    <%
        // 3) SQL문 준비
        try {
            pstmt = con.prepareStatement(sql);
            if (!snick.equals("root")) {
                pstmt.setInt(1, uid);
            }
            rs = pstmt.executeQuery();

            // 5) 결과를 테이블에 출력
            while (rs.next()) {
                int pid = rs.getInt(1);
                String nickname = rs.getString(2);
                String username = rs.getString(3);
                float height       = rs.getFloat(4);
                float weight       = rs.getFloat(5);
                float bmi          = rs.getFloat(6);
                float waist       = rs.getFloat(7);
                float fat          = rs.getFloat(8);
                float muscle       = rs.getFloat(9);
                int metabolic_rate= rs.getInt(10);
                String measure_date = rs.getString(11);
    %>
    <tr>
        <form method="post" action="updatePhysical.jsp">
            <input hidden name="pid"            value="<%=pid%>"/>              <td><%=pid%></td>
            <td><%=nickname%></td>
            <td><%=username%></td>
            <input hidden name="height"         value="<%=height%>"/>           <td><%=height%></td>
            <input hidden name="weight"         value="<%=weight%>"/>           <td><%=weight%></td>
            <td><%=bmi%></td>
            <input hidden name="waist"          value="<%=waist%>"/>            <td><%=waist%></td>
            <input hidden name="fat"            value="<%=fat%>"/>             <td><%=fat%></td>
            <input hidden name="muscle"         value="<%=muscle%>"/>           <td><%=muscle%></td>
            <input hidden name="metabolic_rate" value="<%=metabolic_rate%>"/>   <td><%=metabolic_rate%></td>
            <input hidden name="measure_date"   value="<%=measure_date%>"/>     <td><%=measure_date%></td>
            <td>
                <button type="submit">수정</button>
                <button type="submit" formaction="deleteP.jsp">삭제</button>
            </td>
        </form>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    %>

</table>

<a type="button" href="newPhysical.jsp">새로 등록하기</a>
<%  // 일반 회원
    if (!snick.equals("root")) {    %>
<a type="button" href="../index.jsp">뒤로가기</a>
<% } else { %>
    <a type="button" href="../main/manageMain.jsp">뒤로가기</a>
<% } %>
</body>
</html>
