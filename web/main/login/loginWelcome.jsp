<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = (int) session.getAttribute("id");
    String name = (String) session.getAttribute("user");
%>
<p>
<%=name %> 님 안녕하세요
</p>
<a href="main/login/logout.jsp">로그아웃</a><br/>
