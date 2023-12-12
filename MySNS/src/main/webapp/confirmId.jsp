<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
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
            padding: 2px;
        }
    </style>
</head>
<body>
	<header>
        <h3 align = center>중복확인</h3>
	</header>
</body>
</html>
<%

	request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");

    UserDAO dao = new UserDAO();

    if (dao.exists(uid)) {
%>
	    <h4 align = center>이미 사용중인 ID 입니다.</h4>
  <%}else{%>
	    <h4 align = center>사용 가능한 ID 입니다.</h4>
  <%}%>
  
  <input type="submit" value="닫기" onclick='self.close()'>
    
