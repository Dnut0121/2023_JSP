<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="dao.UserBean">
<jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String uname = request.getParameter("name");
    UserDAO dao = new UserDAO();
    if (dao.insert(user)) {
        out.print("회원 가입이 완료되었습니다.");
    }
    else {
        out.print("오류가 발생하었습니다.");
    }
    
%>
