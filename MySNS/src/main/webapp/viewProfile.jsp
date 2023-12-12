<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
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
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        .edit-button, .withdraw-button {
            display: flex;
            margin-top: 20px;
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-right: 20px;
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
    <h1 align=center>내 정보</h1>
</header>
<table align=center>
    <tr>
        <th>아이디</th>
        <td><%= user.getId() %></td>
    </tr>
    <tr>
        <th>이름</th>
        <td><%= user.getName() %></td>
    </tr>
    <tr>
        <th>주소</th>
        <td><%= user.getAddress() %></td>
    </tr>
    <tr>
        <th>생년월일</th>
        <td><%= user.getBirth() %></td>
    </tr>
</table>
<a href="editProfile.jsp" class="edit-button">내 정보 수정</a>
<a href="withdrawForm.jsp" class="withdraw-button">회원 탈퇴</a>
</body>
</html>