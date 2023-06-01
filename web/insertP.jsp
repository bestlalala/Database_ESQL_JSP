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
  location.href = 'newPhysical.jsp';
</script>
<%
    }
    bmi = Math.round(weight / (height * height / 10000));
%>
<script>
  alert("ERROR! 알맞는 값을 입력하세요.");
  location.href = 'newPhysical.jsp';
</script>
<%
} catch (Exception e){
  e.printStackTrace();
  %>
<script>
  location.href = 'newPhysical.jsp';
</script>
<%
  }
  if (ok) {
    sql = "INSERT INTO Physical_info (u#, user_height, user_weight, BMI, waist, fat, muscle, metabolic_rate, p_date)" +
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
