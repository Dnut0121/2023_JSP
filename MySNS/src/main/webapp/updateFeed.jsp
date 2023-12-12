<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.FeedDAO, dao.FeedObj" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.naming.NamingException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피드 수정</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        textarea {
            width: 100%;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="updateFeedAction.jsp" method="post">
        <input type="hidden" name="feedNo" value="<%= request.getParameter("feedNo") %>">
        
        <%
            String feedNo = request.getParameter("feedNo");

            try {
                FeedDAO feedDAO = new FeedDAO();
                FeedObj feed = feedDAO.getFeed(Integer.parseInt(feedNo));

                if (feed != null) {
        %>
                    <textarea name="updatedContent" rows="4" cols="50"><%= feed.getContent() %></textarea>

        <%
                }
            } catch (SQLException | NamingException e) {
                e.printStackTrace();
            }
        %>

        <br>
        <input type="submit" value="피드 수정">
    </form>

</body>
</html>