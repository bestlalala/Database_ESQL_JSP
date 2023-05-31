<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>신체 측정 기록</title>
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
<body>

<%@ include file="dbconn.jsp"%>
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
    %>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getFloat(4) %></td>
        <td><%= rs.getFloat(5) %></td>
        <td><%= rs.getFloat(6) %></td>
        <td><%= rs.getFloat(7) %></td>
        <td><%= rs.getFloat(8) %></td>
        <td><%= rs.getFloat(9) %></td>
        <td><%= rs.getInt(10) %></td>
        <td><%= rs.getString(11) %></td>
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
</body>
</html>
