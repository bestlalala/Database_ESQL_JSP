<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/dbconn.jsp"%>
<%@include file="../main/sessionCheck.jsp"%>
<%
    // 파라미터 정보 가져오기
    int newRid = 0;
    if (snick.equals("root")) {
        newRid = Integer.parseInt(request.getParameter("newRid"));
    }
    int hosp_id = Integer.parseInt(request.getParameter("hosp_id"));
    String reason   = request.getParameter("reason");
    String descript = request.getParameter("descript");
    String disease  = request.getParameter("disease");
    String h_date   = request.getParameter("h_date");

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
<%
    }

    // 3) SQL문 준비
    sql = "INSERT INTO Hospital_Record (u#, hosp_id, reason, descript, disease, h_date) " +
            "VALUES (?, ?, ?, ?, ?, ?)";
    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        if (snick.equals("root")) {
            pstmt.setInt(1, newRid);
        } else {
            pstmt.setInt(1, uid);
        }
        pstmt.setInt(2, hosp_id);
        pstmt.setString(3, reason);
        pstmt.setString(4, descript);
        pstmt.setString(5, disease);
        pstmt.setString(6, h_date);
        
        // 4) 실행
        pstmt.executeUpdate();
%>
<script>
    alert("등록이 완료되었습니다.");
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