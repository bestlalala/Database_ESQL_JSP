<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../main/dbconn.jsp"%>
<%
    String hname = request.getParameter("hname");
    String subject = request.getParameter("subject");
    String location = request.getParameter("location");
    int hosp_id = Integer.parseInt(request.getParameter("hosp_id"));
    %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>수정하기</h2>
<form method="post" action="updateH.jsp">
    <label>병원 번호: <%=hosp_id%><input type="number" name="hosp_id" value="<%=hosp_id%>" hidden></label><br/>
    <label>병원 이름 (50자 이내) : <input type="text" name="hname" maxlength="50" value="<%=hname%>"></label><br/>
    <label>병원 종류 (20자 이내, ex. general) : <input type="text" name="subject" maxlength="20"
                                                value="<%=subject%>"></label><br/>
    <label>지역 (15자 이내) : <input type="text" name="location" maxlength="15"
                                value="<%=location%>"></label><br/>
    <button type="submit">수정하기</button>
</form>
<p><a href="selectHospital.jsp">뒤로 가기</a></p>
</body>
</html>
