<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 1.드라이버 로딩 & 연결
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HealthCare-prj;encrypt=true;trustServerCertificate=true", "sa", "Yslee0627@");
    } catch(Exception e) {
        System.err.println("con 오류:" + e.getMessage());
        e.printStackTrace();
    }
%>
</body>
</html>
