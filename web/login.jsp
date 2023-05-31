<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp"%>

<%
    if (session.getAttribute("id") == null) {
%>
<p>환영합니다!</p>
<h1>로그인</h1>
<form method="post" action="loginProcess.jsp">
    닉네임: <input type="text" name="nickname" >
    <button type="submit">로그인</button>
</form>
<p>닉네임이 없다면?<a href="signup.jsp">회원가입 하러 가기</a></p>

<%
    } else {
%>
<%@include file="logout.jsp"%>
<% } %>
