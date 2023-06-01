<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전체 병원 목록 조회</title>
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
<h2>병원 관리</h2>
<p>전체 병원 목록</p>
<%@ include file="dbconn.jsp"%>
<table>
    <tr>
        <th>H#</th>
        <th>병원명</th>
        <th>종류</th>
        <th>위치</th>
    </tr>
    <%
        // 3) SQL문 준비
        try {
            String sql = "SELECT * FROM Hospital";
            stmt = con.createStatement();

            // 4) 실행
            rs = stmt.executeQuery(sql);

            // 5) 결과를 테이블에 출력
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
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
<%--메뉴--%>
<p><a type="button" href="newHospital.jsp">병원 등록</a></p>
</body>
</html>
