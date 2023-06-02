<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%@include file="sessionCheck.jsp"%>
<%
    // 파라미터 정보 가져오기
    int pid = Integer.parseInt(request.getParameter("p_id"));
    float height = Float.parseFloat(request.getParameter("p_height"));
    float weight = Float.parseFloat(request.getParameter("p_weight"));
    float waist = Float.parseFloat(request.getParameter("p_waist"));
    float fat = Float.parseFloat(request.getParameter("p_fat"));
    float muscle = Float.parseFloat(request.getParameter("p_muscle"));
    int metabolic_rate = Integer.parseInt(request.getParameter("p_metabolic_rate"));
    String measure_date = request.getParameter("p_measure_date");
    float bmi = 0;

// 입력값이 올바른지 검사
    boolean ok = true;
    try {
        String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        // 미래 날짜인지 확인
        int check = today.compareTo(measure_date);
        if (check < 0) {
            ok = false;
%>
<script>
    alert("ERROR! 미래 날짜로 설정할 수 없습니다.");
    location.href = 'updatePhysical.jsp';
</script>
<%
    }
    bmi = Math.round(weight / (height * height / 10000));
} catch (Exception e){
    e.printStackTrace();
%>
<script>
    alert("ERROR! 알맞는 값을 입력하세요.");
    location.href = 'updatePhysical.jsp';
</script>
<%
    }
    if (ok) {
        sql = "UPDATE Physical_info " +
                "SET user_height = ?, user_weight = ?, bmi = ?," +
                "waist=?, fat=?, muscle=?, metabolic_rate=?, p_date=? " +
                "WHERE P# = ?";
        try {
            assert con != null;
            pstmt = con.prepareStatement(sql);
            pstmt.setFloat(1, height);
            pstmt.setFloat(2, weight);
            pstmt.setFloat(3, bmi);
            pstmt.setFloat(4, waist);
            pstmt.setFloat(5, fat);
            pstmt.setFloat(6, muscle);
            pstmt.setFloat(7, metabolic_rate);
            pstmt.setString(8, measure_date);
            pstmt.setInt(9, pid);

            // 4) 실행
            pstmt.executeUpdate();
%>
<script>
    alert("수정이 완료되었습니다.");
    location.href = 'Physical.jsp';
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
