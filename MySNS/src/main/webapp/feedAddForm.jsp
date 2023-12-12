<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    String currentUser = (String) session.getAttribute("id");

    if (currentUser == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        form {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        tr {
            margin-bottom: 10px;
        }

        td {
            padding: 8px;
        }

        textarea {
            width: 100%;
            height: 150px;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="file"] {
            padding: 8px;
        }
    </style>
</head>
<body>
    <form action="feedAdd.jsp" method="post" enctype="multipart/form-data">
        <header>
            <h1>글 작성</h1>
        </header>
        <table>
            <tr>
                <td align="right">아이디</td>
                <td><%= currentUser %></td>
            </tr>
            <tr>
                <td align="right">작성글</td>
                <td><textarea name="content" rows="10" cols="40"></textarea></td>
            </tr>
            <tr>
                <td align="right">이미지</td>
                <td><input type="file" name="image"></td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="50">
                    <input type="submit" value="업로드하기">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
