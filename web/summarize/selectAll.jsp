<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../main/dbconn.jsp"%>
<%@include file="../main/sessionCheck.jsp"%>
<html>
<head>
    <title>건강 기록 모아 보기</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid rgb(1,27,20);
        }

        th {
            width: 100px;
            background-color: rgb(9,137,102);
            border: 1px solid rgb(1,27,20);
            padding: 3px 2px;
            color: white;
        }

        td {
            text-align: center;
            border: 1px solid rgb(1,27,20);
            padding: 3px;
        }
    </style>
</head>
<body>
<%@include file="../main/header.jsp"%>
<h2>건강 기록 모아 보기</h2>
<p>한 달에 병원에 방문한 횟수와 가장 많이 방문한 병원, 그리고 평균 키와 체중, BMI를 보여줍니다.</p>
<table>
    <tr>
        <th>회원 이름</th>
        <th>월</th>
        <th>병원 방문 횟수</th>
        <th>가장 많이 방문한 병원</th>
        <th>평균 키(cm)</th>
        <th>평균 체중(kg)</th>
        <th>평균 체질량 지수(BMI)</th>
    </tr>
    <%
        // 3) SQL문 준비
        try {
            // 일반 회원
            if (!snick.equals("root")) {
                sql = "SELECT U.username, MONTH(R.h_date) AS month, \n" +
                        "       COUNT(*) AS visit_cnt, MAX(H.name) AS most_visited_hospital, \n" +
                        "       P2.avg_height, P2.avg_weight, P2.avg_bmi\n" +
                        "FROM Hospital_Record R\n" +
                        "LEFT JOIN (\n" +
                        "    SELECT u#, MONTH(p_date) AS month, \n" +
                        "           AVG(P.user_height) AS avg_height, AVG(P.user_weight) AS avg_weight, AVG(P.BMI) avg_bmi\n" +
                        "    FROM Physical_info P\n" +
                        "    GROUP BY u#, MONTH(p_date)\n" +
                        ") P2 ON MONTH(R.h_date) = P2.month AND R.u# = P2.u#\n" +
                        "JOIN Hospital H ON R.hosp_id = H.H#\n" +
                        "JOIN MyUser U ON R.u# = U.U# AND U.U# = ?\n" +
                        "GROUP BY U.username, P2.avg_height, P2.avg_weight, P2.avg_bmi, MONTH(R.h_date)";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, uid);
                rs = pstmt.executeQuery();
            } else {    // 관리자
                sql = "SELECT U.username, MONTH(R.h_date) AS month, \n" +
                        "       COUNT(*) AS visit_cnt, MAX(H.name) AS most_visited_hospital, \n" +
                        "       P2.avg_height, P2.avg_weight, P2.avg_bmi\n" +
                        "FROM Hospital_Record R\n" +
                        "LEFT JOIN (\n" +
                        "    SELECT u#, MONTH(p_date) AS month, \n" +
                        "           AVG(P.user_height) AS avg_height, AVG(P.user_weight) AS avg_weight, AVG(P.BMI) avg_bmi\n" +
                        "    FROM Physical_info P\n" +
                        "    GROUP BY u#, MONTH(p_date)\n" +
                        ") P2 ON MONTH(R.h_date) = P2.month AND R.u# = P2.u#\n" +
                        "JOIN Hospital H ON R.hosp_id = H.H#\n" +
                        "JOIN MyUser U ON R.u# = U.U#\n" +
                        "GROUP BY U.username, P2.avg_height, P2.avg_weight, P2.avg_bmi, MONTH(R.h_date)";
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
            }

            // 5) 결과를 테이블에 출력
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getInt(2) %></td>
        <td><%= rs.getInt(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getFloat(5) %></td>
        <td><%= rs.getFloat(6) %></td>
        <td><%= rs.getFloat(7)%></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }
    %>
</table>
<%  // 일반 회원
    if (!snick.equals("root")) {    %>
<a type="button" href="../index.jsp">뒤로가기</a>
<% } else { %>
<a type="button" href="../main/manageMain.jsp">뒤로가기</a>
<% } %>
</body>
</html>
