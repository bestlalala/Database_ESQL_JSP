<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>병원 진료 기록 등록</title>
</head>
<body>
<h2>새로운 병원 진료 기록하기</h2>
<%@include file="selectHospital.jsp"%>
<form method="post" action="insertR.jsp">
    <label>병원 선택(H#): <input type="text" placeholder="목록에서 병원 번호를 선택하세요." name="hosp_id" datatype="int"></label><br/>
    <label>방문 이유 (100자 이내): <input type="text" placeholder="왜 방문하셨나요?" name="reason" maxlength="100"></label><br/>
    <label>진단 내용 (100자 이내): <input type="text" placeholder="무슨 진단을 받으셨나요?" name="descript" maxlength="100"></label><br/>
    <label>병명 (20자 이내): <input type="text" placeholder="진단명 입력" name="disease" maxlength="20"></label><br/>
    <label>방문 날짜: <input type="date" min="1900-01-01" name="h_date"></label><br/>
    <button type="submit">등록하기</button>
</form>
<p><a href="HospitalRecord.jsp">뒤로 가기</a></p>

</body>
</html>
