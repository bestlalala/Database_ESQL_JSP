<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/sessionCheck.jsp"%>
<html>
<head>
    <title>회원 정보 조회</title>
    <style>
        table {
            border-collapse: collapse;
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
<h2>회원 관리</h2>
<p>회원 정보 조회</p>
<%@ include file="../main/dbconn.jsp"%>
    <table>
        <tr>
            <th>id</th>
            <th>닉네임</th>
            <th>이름</th>
            <th>주민번호</th>
            <th>성별</th>
            <th>선택</th>
        </tr>
        <%
            // 3) SQL문 준비
            try {
                // 일반 회원
                if (!snick.equals("root")) {
                    sql = "SELECT * FROM MyUser WHERE U# = ?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, uid);
                    rs = pstmt.executeQuery();
                } else {    // 관리자
                    sql = "SELECT * FROM MyUser";
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(sql);
                }
                // 5) 결과를 테이블에 출력
                while (rs.next()) {
        %>
        <tr>
            <form method="post" action="updateUser.jsp">
                <td><%=rs.getInt(1)%><input name="user_id"   value="<%= rs.getInt(1)%>" hidden/></td>
                <td><input name="nickname"      value="<%= rs.getString(2)%>" maxlength="20"/></td>
                <td><input name="username"  value="<%= rs.getString(3)%>" maxlength="20"/></td>
                <td><input name="regist_num"    value="<%= rs.getString(4)%>"/></td>
                <td><%= rs.getString(5)%></td>
                <td><button type="submit">수정완료</button></td>
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

        <%  // 일반 회원
            if (!snick.equals("root")) {    %>
        <a type="button" href="../index.jsp">뒤로가기</a>
        <% } else { %>
        <a type="button" href="signup.jsp">새로 등록하기</a><br/>
        <a type="button" href="../main/manageMain.jsp">뒤로가기</a>
        <% } %>

    </table>
</body>
</html>
