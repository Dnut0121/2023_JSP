<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>

<meta charset="UTF-8">
<%
	request.setCharacterEncoding("utf-8");
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
   
    String newName = request.getParameter("name");
    String newAddress = request.getParameter("address");
    String newBirth = request.getParameter("birth");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
	
    if (!newBirth.matches("\\d{4}-\\d{2}-\\d{2}")) {
        out.print("<script>alert('생년월일 형식이 올바르지 않습니다.'); history.go(-1);</script>");
        return;
    }
    
    UserDAO dao = new UserDAO();
    UserBean user = dao.getUser(uid);

    // 기존 비밀번호 확인 로직을 추가할 수도 있습니다.

    // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (!newPassword.equals(confirmPassword)) {
        out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
        return;
    }

    // 새로운 정보로 사용자 업데이트
    user.setName(newName);
    user.setAddress(newAddress);
    user.setBirth(newBirth);
    user.setPs(newPassword);
    
    if (dao.update(user)) {
        out.print("<script>alert('정보가 수정되었습니다.'); window.location.href='main.jsp';</script>");
    } else {
        out.print("<script>alert('정보 수정에 실패하였습니다.'); history.go(-1);</script>");
    }
%>