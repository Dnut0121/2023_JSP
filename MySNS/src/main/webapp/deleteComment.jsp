<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.io.*, java.sql.*, dao.*" %>
<%
    int commentId = Integer.parseInt(request.getParameter("commentId"));
    CommentDAO commentDAO = new CommentDAO();
    boolean success = commentDAO.deleteComment(commentId);

    if (success) {
        out.println("<script>alert('댓글이 삭제되었습니다.'); window.history.back();</script>");
    } else {
        out.println("<script>alert('댓글 삭제에 실패했습니다.'); window.history.back();</script>");
    }
    
%>
