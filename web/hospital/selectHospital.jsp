        <%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/sessionCheck.jsp"%>
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
<%@ include file="../main/dbconn.jsp"%>
<table>
    <tr>
        <th>H#</th>
        <th>병원명</th>
        <th>종류</th>
        <th>위치</th>
        <% if (snick.equals("root")) { %>
        <th>선택</th>
        <% } %>
    </tr>
    <%
        // 3) SQL문 준비
        int hosp_id = 0;
        try {

            sql = "SELECT * FROM Hospital";
            stmt = con.createStatement();

            // 4) 실행
            rs = stmt.executeQuery(sql);

            // 5) 결과를 테이블에 출력
            while (rs.next()) {
                hosp_id = rs.getInt(1);
                String hname = rs.getString(2);
                String subject = rs.getString(3);
                String location = rs.getString(4);

    %>
    <tr>
        <form method="post" action="../updateHospital.jsp">
            <input hidden name="hosp_id" value="<%=hosp_id%>"/> <td><%=hosp_id%></td>
            <input hidden name="hname" value="<%=hname%>"/><td><%=hname%></td>
            <input hidden name="subject" value="<%=subject%>"/><td><%=subject%></td>
            <input hidden name="location" value="<%=location%>"/><td><%=location%></td>
            <% if (snick.equals("root")) { %>
            <td>
                <button type="submit">수정</button>
                <button type="submit">삭제</button>
            </td>
            <% } %>
        </form>
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
