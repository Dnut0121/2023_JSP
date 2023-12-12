<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*, dao.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = (String) session.getAttribute("id");
    String feedNoStr = request.getParameter("feedNo");
    String commentForm = request.getParameter("commentForm");

    if (uid == null || feedNoStr == null || commentForm == null) {
        // 필수 파라미터가 누락된 경우 에러 처리 또는 리다이렉션을 수행할 수 있습니다.
        response.sendRedirect("error.jsp");
        return;
    }

    int feedNo = Integer.parseInt(feedNoStr);

    CommentDAO commentDAO = new CommentDAO();
    boolean success = commentDAO.insert(feedNo, uid, commentForm);

    if (success) {
        // 댓글 추가 성공
        response.sendRedirect("viewComments.jsp?feedNo=" + feedNo);
    } else {
        // 댓글 추가 실패
        response.sendRedirect("error.jsp");
    }
%>