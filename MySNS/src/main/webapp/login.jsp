<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%
    request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    
    UserDAO dao = new UserDAO();
    int code = dao.login(uid, upass);

    if (code == 1) {
        // 아이디가 존재하지 않음
        out.print("<script>alert('아이디가 존재하지 않습니다.'); history.back();</script>");
    } else if (code == 2) {
        // 패스워드가 일치하지 않음
        out.print("<script>alert('패스워드가 일치하지 않습니다.'); history.back();</script>");
    } else {
        // 로그인 성공
        session.setAttribute("id", uid);
        response.sendRedirect("main.jsp");
    }
%>