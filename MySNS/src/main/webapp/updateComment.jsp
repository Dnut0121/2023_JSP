<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.io.*, java.sql.*, dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
    int commentId = Integer.parseInt(request.getParameter("commentId"));
    String updatedContent = request.getParameter("updatedContent");

    CommentDAO commentDAO = new CommentDAO();
    boolean success = commentDAO.updateComment(commentId, updatedContent);

    if (success) {
        out.println("<script>alert('댓글이 수정되었습니다.'); window.history.back();</script>");
    } else {
        out.println("<script>alert('댓글 수정에 실패했습니다.'); window.history.back();</script>");
    }
%>