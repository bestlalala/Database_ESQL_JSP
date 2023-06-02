<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/02
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/dbconn.jsp"%>
<%
    String rid = request.getParameter("rid");

        // 3) SQL문 준비
        String sql = "DELETE FROM Hospital_Record WHERE R# = ?";

        try {
            assert con != null;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rid);
            // 4) 실행
            pstmt.executeUpdate();
            // JDBC 자원 닫기
            pstmt.close();
            con.close();
            %>
            <script>alert("삭제되었습니다.");</script>
<%
        } catch (Exception e) {
            e.printStackTrace();
        } %>
    <script>location.href="HospitalRecord.jsp";</script>
