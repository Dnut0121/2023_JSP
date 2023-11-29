<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>

   <jsp:useBean id="user" class="dao.UserBean">
	<jsp:setProperty name="user" property="*" />
	</jsp:useBean>

 <% 
 	UserDAO dao = new UserDAO();
 	if(dao.update(user)){
 		out.print("회원정보 수정이 완료되었습니다.");
 		response.sendRedirect("main.jsp");
 	}else{
 		out.print("회원 정보 수정 처리 중 오류가 발생하였습니다.");
 	}

%>
