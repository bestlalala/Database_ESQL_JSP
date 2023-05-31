<%@ page import="java.util.InputMismatchException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>
<%@include file="sessionCheck.jsp"%>
<%
    // POST 방식의 한글처리
    request.setCharacterEncoding("UTF-8");

    // 파라미터 정보 가져오기
    float height = Float.parseFloat(request.getParameter("height"));
    float weight = Float.parseFloat(request.getParameter("weight"));
    float waist = Float.parseFloat(request.getParameter("waist"));
    float fat = Float.parseFloat(request.getParameter("fat"));
    float muscle = Float.parseFloat(request.getParameter("muscle"));
    int metabolic_rate = Integer.parseInt(request.getParameter("metabolic_rate"));
    String measure_date = request.getParameter("measure_date");
    float bmi = 0;

// 입력값이 올바른지 검사
    try {
        String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        if (measure_date.equals("0")) {
            measure_date = today;
        } else { // 미래 날짜인지 확인
            int check = today.compareTo(measure_date);
            if (check < 0) {
%>
<script>
    alert("ERROR! 미래 날짜로 설정할 수 없습니다.");
    location.href = 'newRecord.jsp';
</script>
<%
            }
        }
    if (height*weight > 0 && waist*fat > 0 && muscle*metabolic_rate > 0) {
        bmi = Math.round(weight / (height * height / 10000));
    } else {
%>
<script>
    alert("ERROR! 알맞는 값을 입력하세요.");
</script>
<%
    }
    } catch (Exception e){
        e.printStackTrace();
<%
    }

    // 3) SQL문 준비
    sql = "INSERT INTO Hospital_Record (u#, user_height, user_weight, BMI, waist, fat, muscle, metabolic_rate, p_date)" +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, uid);
        pstmt.setFloat(2, height);
        pstmt.setFloat(3, weight);
        pstmt.setFloat(4, bmi);
        pstmt.setFloat(5, waist);
        pstmt.setFloat(6, fat);
        pstmt.setFloat(7, muscle);
        pstmt.setFloat(8, metabolic_rate);
        pstmt.setString(9, measure_date);
        
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