<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            border-color: black;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<body>
<h2>병원 진료 기록 관리</h2>
<p>전체 회원의 병원 진료 기록 목록</p>
<%@ include file="dbconn.jsp"%>
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
        // 3) SQL문 준비
        try {
            String sql = "SELECT R.R#, nickname, username, H.name, H.subject, H.[location], R.reason, R.descript, R.disease, h_date\n" +
                    "FROM Hospital_Record R, Hospital H, MyUser U\n" +
                    "WHERE R.u# = U.U#\n" +
                    "And R.hosp_id = H.H#";
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
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }
    %>

</table>
</body>
</html>
