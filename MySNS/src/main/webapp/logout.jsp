<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();
   	out.print("로그아웃 하였습니다.");
   	response.sendRedirect("loginForm.jsp"); // 로그인 화면으로 이동
%>
