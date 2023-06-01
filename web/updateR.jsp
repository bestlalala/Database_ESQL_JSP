<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/02
  Time: 1:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%@include file="sessionCheck.jsp"%>
<%

    // 파라미터 정보 가져오기
    int rid = Integer.parseInt(request.getParameter("r_id"));
    int hosp_id = Integer.parseInt(request.getParameter("hosp_id"));
    String reason   = request.getParameter("r_reason");
    String descript = request.getParameter("r_descript");
    String disease  = request.getParameter("r_disease");
    String h_date   = request.getParameter("r_h_date");

    // 입력값이 올바른지 검사
    boolean ok = true;
    try {
        String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        // 미래 날짜인지 확인
        int check = today.compareTo(h_date);
        if (check < 0) {
            ok = false;
%>
<script>
    alert("ERROR! 미래 날짜로 설정할 수 없습니다.");
    location.href = 'newRecord.jsp';
</script>
<%
    }
} catch (Exception e){
    e.printStackTrace();
%>
<script>
    alert("ERROR! 알맞는 값을 입력하세요.");
    location.href = 'newRecord.jsp';
</script>
<% }
    sql = "UPDATE Hospital_Record SET hosp_id = ?, reason = ?, descript = ?, disease = ?, h_date = ? WHERE R# = ?";
    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, hosp_id);
        pstmt.setString(2, reason);
        pstmt.setString(3, descript);
        pstmt.setString(4, disease);
        pstmt.setString(5, h_date);
        pstmt.setInt(6, rid);

        pstmt.executeUpdate();
%>
<script>
    alert("수정이 완료되었습니다.");
    location.href="HospitalRecord.jsp";
</script>
<%
        // JDBC 자원 닫기
        pstmt.close();
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
