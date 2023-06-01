<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%@include file="sessionCheck.jsp"%>
<%
    String hosp_id = request.getParameter("hosp_id");
    String nickname = (String) session.getAttribute("nickname");
    if (!nickname.equals("root")) {
%>
<script>
    alert("닉네임이 일치하지 않습니다.");
    location.href="selectHospital.jsp";
</script>
<%
    }
%>
<script>
    const password = prompt("정말 삭제하시겠습니까?\n삭제하려면 비밀번호를 입력하세요.");
    if (password === "1234") {
        alert("삭제되었습니다.");
<%
        // 3) SQL문 준비
        sql = "DELETE FROM Hospital WHERE H# = ?";

        try {
            assert con != null;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, hosp_id);
            // 4) 실행
            pstmt.executeUpdate();
            // JDBC 자원 닫기
            pstmt.close();
            con.close();
        } catch (Exception e) {
                e.printStackTrace();
        }
%>
    } else {
        alert("비밀번호가 틀렸습니다.");
    }
    location.href="selectHospital.jsp";
</script>
