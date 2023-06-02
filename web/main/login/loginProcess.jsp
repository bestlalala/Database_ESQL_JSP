<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@include file="../dbconn.jsp"%>
<%
    String nickname = request.getParameter("nickname");
    if (nickname.equals("root")) {
        %>
<script>
const password = prompt("비밀번호를 입력해주세요.");
if (password === "1234") {
    <%
    request.getSession();
    session.setAttribute("nickname", "root");
    %>
    alert("관리자 로그인 성공");
    location.href="../manageMain.jsp";
} else {
    alert("비밀번호가 틀렸습니다.");
    location.href="../../index.jsp";
}
</script>
<%
    } else {
    try {
        String sql = "SELECT * FROM MyUser WHERE nickname = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, nickname);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            int id = rs.getInt(1);
            String nick = rs.getString(2);
            String user = rs.getString(3);
            request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("nickname", nick);
            session.setAttribute("user", user);
%>
<script>
    alert("로그인 성공");
    location.href="../../index.jsp";
</script>
<%
        } else {
%>
<script>
    alert("로그인 실패");
    location.href="../../index.jsp";
</script>
<%
        }
    } catch(SQLException e) {
        e.printStackTrace();
%>
<script>
alert("로그인 실패");
location.href="../../index.jsp";
</script>
<%
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
    }
%>
