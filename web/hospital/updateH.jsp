<%@ page import="com.sun.tools.javac.Main" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/dbconn.jsp"%>
<%@include file="../main/sessionCheck.jsp"%>
<%

    // 파라미터 정보 가져오기
    String hname = request.getParameter("hname");
    String subject = request.getParameter("subject");
    String location = request.getParameter("location");
    int hosp_id = Integer.parseInt(request.getParameter("hosp_id"));

    sql = "UPDATE Hospital SET name = ?, subject = ?, location = ? WHERE H# = ?";

    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, hname);
        pstmt.setString(2, subject);
        pstmt.setString(3, location);
        pstmt.setInt(4, hosp_id);

        // 4) 실행
        pstmt.executeUpdate();
%>
<script>
    alert("수정이 완료되었습니다.");
    location.href="selectHospital.jsp";
</script>
<%
        // JDBC 자원 닫기
        pstmt.close();
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
