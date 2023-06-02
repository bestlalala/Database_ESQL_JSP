<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/02
  Time: 3:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<%  
    int p_id = Integer.parseInt(request.getParameter("pid"));
    float p_height = Float.parseFloat(request.getParameter("height"));
    float p_weight = Float.parseFloat(request.getParameter("weight"));
    float p_waist = Float.parseFloat(request.getParameter("waist"));
    float p_fat = Float.parseFloat(request.getParameter("fat"));
    float p_muscle = Float.parseFloat(request.getParameter("muscle"));
    int p_metabolic_rate = Integer.parseInt(request.getParameter("metabolic_rate"));
    String p_measure_date = request.getParameter("measure_date");
%>
<body>
<h2>신체 측정 기록 수정하기</h2>
<form method="post" action="updateP.jsp">
    <label> 기록 번호: <%=p_id%> <input hidden name="p_id" value="<%=p_id%>"/></label>   <br/>
    <label>키(cm):               <input type="number" min="10" step="0.1"    name="p_height"         value="<%=p_height%>"/></label><br/>
    <label>체중(kg):              <input type="number" min="1" step="0.1"     name="p_weight"         value="<%=p_weight %>"/></label><br/>
    <label>허리 둘레(cm):           <input type="number" min="10" step="0.1"    name="p_waist"          value="<%=p_waist%>"></label><br/>
    <label>체지방률(%):             <input type="number" min="0" step="0.1"     name="p_fat"            value="<%=p_fat%>"/></label><br/>
    <label>골격근량(kg):            <input type="number" min="0" step="0.1"     name="p_muscle"         value="<%=p_muscle%>"/></label><br/>
    <label>기초대사량(kcal):         <input type="number" min="0" step="0.1"     name="p_metabolic_rate" value="<%=p_metabolic_rate%>"/></label><br/>
    <label>측정 날짜:           <input type="date" min="1900-01-01" name="p_measure_date"  value="<%=p_measure_date%>"/></label><br/>
    <button type="submit">수정</button>
</form>
<p><a href="Physical.jsp">뒤로 가기</a></p>
</body>
</html>
