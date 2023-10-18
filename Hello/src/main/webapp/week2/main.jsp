<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    session.setAttribute("uid", username);
	if(uid == null){
		out.print("로그인 정보가 없습니다.");
	}
	else{
		out.print("메인 페이지입니다.");
		session.setAttribute("id",uid);
	}
	%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 여기서 실제로 데이터베이스와 연동하여 로그인을 확인합니다. --%>
<%


    if ("사용자이름".equals(username) && "비밀번호".equals(password)) {
        // 로그인이 성공하면 세션에 사용자 정보를 저장합니다.
        
        response.sendRedirect("mainMenu.jsp");
    } else {
        // 로그인 실패 시 메시지를 표시하거나 다시 로그인 페이지로 이동할 수 있습니다.
        response.sendRedirect("login.jsp?error=1");
    }
%>
	