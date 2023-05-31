<%--
  Created by IntelliJ IDEA.
  User: iyeonsu
  Date: 2023/06/01
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int uid = 0;
    String snick = ""; String sql = "";
    try {
        if (session.getAttribute("id") != null) {
            uid = (int) session.getAttribute("id");
        }
        if (session.getAttribute("nickname") == null) {
            System.out.println("nickname 세션 없음");
        }
        snick = (String) session.getAttribute("nickname");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>