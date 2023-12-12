<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%
    request.setCharacterEncoding("utf-8");
	UserDAO dao = new UserDAO();
	
	String uid = (String) session.getAttribute("id");
    String password = request.getParameter("password");
    int code =dao.getPassword(uid,password);

    if (code==0) {
        // Passwords match, proceed with account deletion
        if (dao.delete(uid)) {
%>
            <script>
                alert("회원탈퇴가 완료되었습니다.");
                window.location.href = "loginForm.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("회원탈퇴 중 오류가 발생하였습니다.");
                history.back();
            </script>
<%
        }
    } else {
%>
        <script>
            alert("비밀번호가 올바르지 않습니다.");
            history.back();
        </script>
<%
    }
%>

