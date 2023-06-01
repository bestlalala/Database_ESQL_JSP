<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%@include file="sessionCheck.jsp"%>
<%
    // POST 방식의 한글처리
    request.setCharacterEncoding("UTF-8");

    // 파라미터 정보 가져오기
    String hname = request.getParameter("hname");
    String subject = request.getParameter("subject");
    String location = request.getParameter("location");

// 입력값이 올바른지 검사
    boolean ok = true;
    try {
        if ((hname.length() > 50) || (subject.length() > 20) || (location.length() > 15)){
            ok = false;
%>
<script>
    alert("ERROR! 알맞는 값을 입력하세요.");
    location.href="newHospital.jsp";
</script>
<%
        }
    } catch (Exception e){
        e.printStackTrace();
    }
    // 3) SQL문 준비
    if (ok) {
        sql = "INSERT INTO Hospital VALUES (?, ?, ?)";
        try {
            assert con != null;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, hname);
            pstmt.setString(2, subject);
            pstmt.setString(3, location);

            // 4) 실행
            pstmt.executeUpdate();
%>
<script>
    alert("등록이 완료되었습니다.");
    location.href="selectHospital.jsp";
</script>
<%
            // JDBC 자원 닫기
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>