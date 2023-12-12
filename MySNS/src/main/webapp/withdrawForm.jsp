<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.UserBean" %>
<!DOCTYPE html>
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
        .button {
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
<% String uid = (String) session.getAttribute("id");
%>

<header>
    <h1 align=center>회원탈퇴</h1>
</header>
<form name="withdrawForm" action="withdraw.jsp" method="post">
    <table align=center>
        <tr>
            <td align=right>아이디&nbsp;</td>
            <td><%= uid %></td>
        </tr>
        <tr>
            <td align=right>비밀번호&nbsp;</td>
            <td><input type="password" id="password" name="password" required></td>
        </tr>
        <tr>
            <td colspan=2 align=center height=50>
                <input type="submit" value="회원탈퇴하기" class="button">
            </td>
        </tr>
    </table>
</form>
</body>
</html>