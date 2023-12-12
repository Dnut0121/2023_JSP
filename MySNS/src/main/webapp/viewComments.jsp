<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.*, dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            background-color: #f0f0f0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
        table {
            width: 80%;
            margin: 0 auto;
        }
        .feed-image {
            width: 240px;
        }
        .button-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-top: 10px;
        }
        .button-container a {
            margin-left: 10px;
        }
        .button {
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
        .delete-button {
            padding: 3px 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-left: auto;
            margin-top: 5px;
        }
        .update-button {
            padding: 3px 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-left: 5px;
            margin-top: 5px;
        }
        .comments-button {
            padding: 3px 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-left: 5px;
            margin-top: 5px;
        }
        .view-comments-button {
            padding: 3px 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-left: 5px;
            margin-top: 5px;
        }
        .comment-form-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            margin-top: 50px;
        }
        .form-label {
            display: block;
            margin-bottom: 10px;
        }
        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
        }
        .form-button {
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        .comment-container {
            margin-top: 20px;
        }
        .comment {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
        }
        .comment-action {
            padding: 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-right: 5px;
            cursor: pointer;
        }
    </style>
    <script>

 	function showCommentForm(feedNo) {
        var commentForm = prompt('댓글을 입력하세요.');
        if (commentForm !== null) {
            window.location.href = 'addComment.jsp?feedNo=' + feedNo + '&commentForm=' + encodeURIComponent(commentForm);
        }
    }
 // 삭제 및 수정 함수
    function deleteComment(commentId) {
        var confirmDelete = confirm('댓글을 삭제하시겠습니까?');
        if (confirmDelete) {
            window.location.href = 'deleteComment.jsp?commentId=' + commentId;
        }
    }

    function updateComment(commentId) {
        var updatedContent = prompt('댓글을 수정하세요.');
        if (updatedContent !== null) {
            window.location.href = 'updateComment.jsp?commentId=' + commentId + '&updatedContent=' + encodeURIComponent(updatedContent);
        }
    }
    </script>
</head>
<body>
    <header>
        <h1 align=center>커뮤니티 - 댓글 보기</h1>
    </header>
    <div class="comment-form-container">
        <%
        	String uid = (String)session.getAttribute("id");
        
            int feedNo = Integer.parseInt(request.getParameter("feedNo"));
            ArrayList<CommentObj> comments = (new CommentDAO()).getCommentsForFeed(feedNo);

            for (CommentObj comment : comments) {
                out.println("<div class='comment'>");
                out.println("<p><strong>" + comment.getUserId() + "</strong> (" + comment.getTs() + ")</p>");
                out.println("<p>" + comment.getContent() + "</p>");
                out.println("<div class='comment-actions'>");
                
                // 현재 로그인한 사용자의 아이디와 댓글 작성자의 아이디를 비교하여 일치하는 경우에만 삭제, 수정 버튼 표시
                if (uid != null && uid.equals(comment.getUserId())) {
                    out.println("<span onclick='deleteComment(" + comment.getCommentId() + ")' class='comment-action'>삭제</span>");
                    out.println("<span onclick='updateComment(" + comment.getCommentId() + ")' class='comment-action'>수정</span>");
                }
                
                out.println("</div>");
                out.println("</div>");
            }
        %>
    
        <form action="addCommentAction.jsp" method="post">
            <label class="form-label">댓글 작성</label>
            <textarea name="commentForm" class="form-input" rows="4" required></textarea>
            <input type="hidden" name="feedNo" value="<%= request.getParameter("feedNo") %>">
            <input type="submit" value="댓글 작성" class="form-button">
        </form>
    <div class="button-container">
        <a href="main.jsp" class="comment-action">돌아가기</a>
    </div>
</body>
</html>