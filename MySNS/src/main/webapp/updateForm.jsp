<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
String uid = (String) session.getAttribute("id");
if (uid == null) {
    response.sendRedirect("loginForm.jsp");
    return;
}




%>
   
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
    </style>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

UserDAO dao = new UserDAO();
UserBean uB = dao.getUser(id);
%>
<form action="update.jsp" method="post">
<table align=center>
<header>
        <h1 align = center>회원정보수정</h1>
</header>
<tr>

    <td align=right>아이디&nbsp;</td>
  <td><input type="text" name="id" value="<%=uB.getId()%>"></td>
  
</tr>
<tr>
    <td align=right>패스워드&nbsp;</td>
    <td><input type="password" name="ps" required></td>
</tr>
<tr> 
    <td align=right>패스워드(확인)&nbsp;</td>
    <td><input type="password" name="ps2" required></td>
</tr>
<tr>

    <td align=right>이름&nbsp;</td>
    <td><input type="text" name="name" value="<%=uB.getName()%>"></td>
</tr>
<tr>
    <td colspan=2 align=center height=50>
        <input type="submit"  value="회원정보수정하기">
    </td>
</tr>
</table>
</form>


</body>
</html>