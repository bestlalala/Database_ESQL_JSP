<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/02
  Time: 1:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../main/header.jsp"%>
<%
    int r_id = Integer.parseInt(request.getParameter("rid"));
    String r_reason = request.getParameter("reason");
    String r_descript = request.getParameter("descript");
    String r_disease = request.getParameter("disease");
    String r_h_date   = request.getParameter("h_date");
%>
<body>
<h2>병원 진료 기록 수정하기</h2>
<%@include file="../hospital/selectHospital.jsp"%>
<form method="post" action="updateR.jsp">
    <label>진료 기록 번호: <%=r_id%><input hidden type="number" name="r_id" value="<%=r_id%>"></label><br/>
    <label>병원 선택(H#): <input type="number" name="hosp_id" min="0"/>      </label><br/>
    <label>방문 이유 (100자 이내):<input type="text" placeholder="왜 방문하셨나요?" name="r_reason" maxlength="100" value="<%=r_reason%>"/>   </label><br/>
    <label>진단 내용: <input type="text" placeholder="무슨 진단을 받으셨나요?" name="r_descript" maxlength="100" value="<%=r_descript%>"/> </label><br/>
    <label>병명 (20자 이내):  <input type="text" name="r_disease"  value="<%=r_disease%>"/>  </label><br/>
    <label>방문 날짜: <input type="date" name="r_h_date" min="1900-01-01" value="<%=r_h_date%>"/>   </label><br/>
    <button type="submit">등록하기</button>
</form>
<p><a href="HospitalRecord.jsp">뒤로 가기</a></p>
</body>
</html>
