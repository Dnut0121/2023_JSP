<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
	<style>
        body {
            background-color: #f0f0f0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
    </style>
</head>
<body>
	<header>
        <h1>가입정보확인</h1>
    </header>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<p> 아이디 : <%=request.getParameter("id") %>
	<p> 비밀번호 : <%=request.getParameter("passwd") %>
	<p> 이름 : <%=request.getParameter("name") %>
	<p> 연락처 : <%=request.getParameter("phone1") %>-<%=request.getParameter("phone2") %>-<%=request.getParameter("phone3") %>
	<p> 이메일 : <%=request.getParameter("email") %>
	<p> 주소 : <%=request.getParameter("address") %>
</body>
</html>