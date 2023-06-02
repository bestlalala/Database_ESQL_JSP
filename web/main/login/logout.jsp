<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/05/31
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("../../index.jsp");
%>
