<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../main/dbconn.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
</head>
<body>
<%
    // 파라미터 정보 가져오기
    String nickname = request.getParameter("nickname");
    String username = request.getParameter("username");
    String regist_num = request.getParameter("regist_num");
    String gender = "";
    boolean ok = true;
    // 입력값이 올바른지 검사
    try {
        if (nickname.length() <= 15) {
            String sql = "SELECT * FROM MyUser WHERE nickname = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nickname);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                ok = false;
%>
<script>
alert("ERROR! 해당 닉네임은 사용할 수 없습니다.");
location.href = 'signup.jsp';
</script>
<%
            }
        }
        int gen = Integer.parseInt(regist_num.substring(6, 7));
        if (gen > 0 && gen < 5) {
            if (gen == 1 || gen == 3) {
                gender = "M";
            } else {
                gender = "F";
            }
        } else { ok = false;
%>
<script>
alert("ERROR! 주민번호가 알맞지 않습니다. 다시 입력해주세요.");
location.href = 'signup.jsp';
</script>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // 3) SQL문 준비
    String sql = "INSERT INTO MyUser (nickname, username, regist#, gender) " +
            "VALUES (?, ?, ?, ?)";

    if (ok) {
    try {
        assert con != null;
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, nickname);
        pstmt.setString(2, username);
        pstmt.setString(3, regist_num);
        pstmt.setString(4, gender);

        // 4) 실행
        pstmt.executeUpdate();
        %>
<script>
alert("회원가입이 완료되었습니다.");
location.href="../index.jsp";
</script>
<%
        // JDBC 자원 닫기
        pstmt.close();
        con.close();
    } catch (Exception e) {
       e.printStackTrace();
    }
    }
%>
</body>
</html>
