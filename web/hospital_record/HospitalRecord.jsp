<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../main/dbconn.jsp"%>
<%@include file="../main/sessionCheck.jsp"%>
<html>
<head>
    <title>병원 진료 기록 관리</title>
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
<%@include file="../main/header.jsp"%>
<body>
<h2>병원 진료 기록 관리</h2>
<%--일반 회원--%>
<% if (!snick.equals("root")) { %>
<p>나의 병원 진료 기록 목록</p>

<%--관리자--%>
<%   } else { %>
<p>전체 회원의 병원 진료 기록 목록</p>
<% } %>

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
        <th>선택</th>
    </tr>
    <%
        // 3) SQL문 준비 (페이지에서 관리자/회원에 따라 다르게 가져옴)
        try {
            if (!snick.equals("root")) {
                sql = "SELECT R.R#, nickname, username, H.name, H.subject, H.location, " +
                        "R.reason, R.descript, R.disease, R.h_date\n" +
                        "FROM Hospital H, Hospital_Record R, MyUser U\n" +
                        "WHERE H.H# = R.hosp_id\n" +
                        "AND R.u# = U.U#\n" +
                        "AND U.U# = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, uid);
                rs = pstmt.executeQuery();
            } else {
                sql = "SELECT R.R#, nickname, username, H.name, H.subject, H.location, " +
                        "R.reason, R.descript, R.disease, h_date\n" +
                        "FROM Hospital_Record R, Hospital H, MyUser U\n" +
                        "WHERE R.u# = U.U#\n" +
                        "And R.hosp_id = H.H#";
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
            }
            // 5) 결과를 테이블에 출력
            while (rs.next()) {
                int rid = rs.getInt(1);
                String nickname = rs.getString(2);
                String username = rs.getString(3);
                String hname    = rs.getString(4);
                String subject  = rs.getString(5);
                String location = rs.getString(6);
                String reason   = rs.getString(7);
                String descript = rs.getString(8);
                String disease  = rs.getString(9);
                String h_date   = rs.getString(10);
    %>
    <tr>
        <form method="post" action="updateRecord.jsp">
            <input hidden name="rid"      value="<%=rid%>"/>        <td><%=rid%></td>
            <input hidden name="nickname" value="<%=nickname%>"/>   <td><%=nickname%></td>
            <input hidden name="username" value="<%=username%>"/>   <td><%=username%></td>
            <input hidden name="hname"    value="<%=hname%>"/>      <td><%=hname%></td>
            <input hidden name="subject"  value="<%=subject%>"/>    <td><%=subject%></td>
            <input hidden name="location" value="<%=location%>"/>   <td><%=location%></td>
            <input hidden name="reason"   value="<%=reason%>"/>     <td><%=reason%></td>
            <input hidden name="descript" value="<%=descript%>"/>   <td><%=descript%></td>
            <input hidden name="disease"  value="<%=disease%>"/>    <td><%=disease%></td>
            <input hidden name="h_date"   value="<%=h_date%>"/>     <td><%=h_date%></td>
            <td>
                <button type="submit">수정</button>
                <button type="submit" formaction="deleteR.jsp">삭제</button>
            </td>
        </form>
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

<%--메뉴--%>
<a type="button" href="newRecord.jsp">등록하기</a>
<%  // 일반 회원
    if (!snick.equals("root")) {    %>
<a type="button" href="../index.jsp">뒤로가기</a>
<% } else { %>
<a type="button" href="../main/manageMain.jsp">뒤로가기</a>
<% } %>
</body>
</html>