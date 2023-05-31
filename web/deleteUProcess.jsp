<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%
    String nickname = request.getParameter("nickname");
    String sessionnick = (String) session.getAttribute("nickname");
    if (!nickname.equals(sessionnick)) {
        %>
<script>
alert("닉네임이 일치하지 않습니다.");
location.href = "deleteUser.jsp";
</script>
<%
    } else {

    // 3) SQL문 준비
    String sql = "DELETE FROM MyUser WHERE nickname = ?";

    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, nickname);
    // 4) 실행
        pstmt.executeUpdate();
        // JDBC 자원 닫기
        pstmt.close();
        con.close();
%>
<%@include file="logout.jsp"%>
<script>
    alert("회원 탈퇴가 완료되었습니다.");
    location.href="index.jsp";
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
<script>
    alert("닉네임이 일치하지 않습니다.");
    location.href="deleteUser.jsp";
</script>
<%
        }
    }
%>
