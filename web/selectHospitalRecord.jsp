<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp"%>
<html>
<head>
    <title>전체 병원 진료 기록</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px;
        }

        th {
            width: 150px;
            background-color: rgb(16,229,170);
            border: 1px solid rgb(1,27,20);
            padding: 3px;
        }

        td {
            text-align: center;
            border: 1px solid rgb(1,27,20);
            padding: 3px;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>R#</th>
        <th>회원 닉네임</th>
        <th>회원 이름</th>
        <th>방문 병원명</th>
        <th>병원 종류</th>
        <th>위치</th>
        <th>방문 이유</th>
        <th>진단 내용</th>
        <th>병명</th>
        <th>진료 날짜</th>
    </tr>
    <%
        // 3) SQL문 준비 (페이지에서 관리자/회원에 따라 다르게 가져옴)
        try {
            if (!snick.equals("root")) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, uid);
                rs = pstmt.executeQuery();
            } else {
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
            }
            // 5) 결과를 테이블에 출력
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(9) %></td>
        <td><%= rs.getString(10) %></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e){ e.printStackTrace(); }
        }
    %>

</table>
</body>
</html>