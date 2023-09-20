<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String res = "<h3>User ID: "+ uid +"</h3>";
	out.print(res);
%>
