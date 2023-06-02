<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/02
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/dbconn.jsp"%>
<%@include file="../main/sessionCheck.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 파라미터 정보 가져오기
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    String nickname = request.getParameter("nickname");
    String username = request.getParameter("username");
    String regist_num = request.getParameter("regist_num");
    String gender = "";

    boolean ok = true;

    try {
        int gen = Integer.parseInt(regist_num.substring(6, 7));
        if (gen > 0 && gen < 5) {
            if (gen == 1 || gen == 3) {
                gender = "M";
            } else {
                gender = "F";
            }
        } else {
            throw new Exception();
        }
    } catch (Exception e){
        ok = false;
%>
<script>
    alert("ERROR! 주민번호가 알맞지 않습니다.");
    location.href = 'selectUser.jsp';
</script>
<%
    }
    if (ok) {
        // 3) SQL문 준비
        sql = "UPDATE MyUser " +
                "SET nickname = ?, username = ?, regist# = ? " +
                "WHERE U# = ?";

        try {
            assert con != null;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nickname);
            pstmt.setString(2, username);
            pstmt.setString(3, regist_num);
            pstmt.setInt(4, user_id);

            // 4) 실행
            pstmt.executeUpdate();
%>
<script>
    alert("수정이 완료되었습니다.");
    location.href="index.jsp";
</script>
<%
            // JDBC 자원 닫기
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
