<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전체 회원 정보 조회</title>
    <style>
        table {
            border-collapse: collapse;
        }

        th {
            width: 100px;
            background-color: rgb(255, 140, 140);
            border-color: black;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<body>
<h2>회원 관리</h2>
<p>전체 회원 정보 조회</p>
<%@ include file="dbconn.jsp"%>
    <table>
        <tr>
            <th>id</th>
            <th>닉네임</th>
            <th>이름</th>
            <th>주민번호</th>
            <th>성별</th>
        </tr>
        <%
            // 3) SQL문 준비
            try {
                String sql = "SELECT * FROM MyUser";
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
            <td><%= rs.getString(5)%></td>
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
