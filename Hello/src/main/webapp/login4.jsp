<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String res = "<h3>User ID: "+ uid +"</h3>";
	res += "<br>로그인 시간:" + (new Date()).toString();
	out.print(res);
%>