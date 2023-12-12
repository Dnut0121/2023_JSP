<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            background-color: #f0f0f0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
        table {
            width: 50%;
            margin: 0 auto;
            margin-top: 20px;
        }
        td {
            padding: 8px;
        }
        .update-button {
            display: block;
            margin-top: 20px;
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
    UserDAO dao = new UserDAO();
    UserBean user = dao.getUser(uid);
%>
<header>
    <h1 align=center>내 정보 수정</h1>
</header>
<form action="updateProfile.jsp" method="post">
    <table align=center>
        <tr>
            <td align=right>아이디&nbsp;</td>
            <td><%= user.getId() %></td>
        </tr>
        <tr>
            <td align=right>이름&nbsp;</td>
            <td><input type="text" name="name" value="<%= user.getName() %>" required></td>
        </tr>
        <tr>
            <td align=right>주소&nbsp;</td>
            <td><input type="text" name="address" value="<%= user.getAddress() %>" required></td>
        </tr>
        <tr>
            <td align=right>생년월일&nbsp;</td>
            <td><input type="text" name="birth" value="<%= user.getBirth() %>" required></td>
        </tr>
        <tr>
            <td align=right>새 비밀번호&nbsp;</td>
            <td><input type="password" name="newPassword" required></td>
        </tr>
        <tr>
            <td align=right>비밀번호 확인&nbsp;</td>
            <td><input type="password" name="confirmPassword" required></td>
        </tr>
    </table>
    <button type="submit" class="update-button">정보 수정</button>
</form>
</body>
</html>
