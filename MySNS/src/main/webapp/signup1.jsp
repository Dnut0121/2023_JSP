<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="dao.UserBean">
    <jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String upass2 = request.getParameter("ps2");
    String uname = request.getParameter("name");
    String uaddress = request.getParameter("address");
    String ubirth = request.getParameter("birth");
    UserDAO dao = new UserDAO();
    boolean isDuplicate = dao.exists(uid);
    boolean isSuccess = false;
    boolean isPasswordMatch = upass.equals(upass2);

    if (isPasswordMatch && !isDuplicate) {
        isSuccess = dao.insert(user);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
    <script>
        <% if (isDuplicate) { %>
            alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
            history.back();
        <% } else if (!isPasswordMatch) { %>
            alert("패스워드와 패스워드 확인이 일치하지 않습니다. 다시 입력해주세요.");
            history.back();
        <% } else if (isSuccess) { %>
            alert("회원 가입이 완료되었습니다.");
            window.location.href = "loginForm.jsp";
        <% } else { %>
            alert("회원 가입 중 오류가 발생하였습니다.");
            history.back();
        <% } %>
    </script>
</head>
<body>
    <!-- 회원가입 결과를 처리하는 페이지이므로 별도의 내용이 필요하지 않습니다. -->
</body>
</html>
