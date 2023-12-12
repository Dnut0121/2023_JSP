<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
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
    </style>
    <script>

</script>
</head>
<header>
    <h1 align=center>커뮤니티</h1>
</header>
<body>
    <%
        String uid = (String) session.getAttribute("id");
        if (uid == null) {
            response.sendRedirect("loginForm.jsp");
            return;
        }
        session.setAttribute("id", uid);

        ArrayList<FeedObj> feeds = (new FeedDAO()).getList();

        String str = "<table align=center>";
        str += "<tr height=40><td><b>작성글 리스트</b></td>";
        str += "<td>";
        str += "<div class='button-container'>";
        str += "<a href='feedAddForm.jsp' class='button'>글쓰기</a>";
        str += "<a href='viewProfile.jsp' class='button'>내정보</a>";
        str += "<a href='logout.jsp' class='button logout-button'>로그아웃</a>";
        str += "</div>";
        str += "</td></tr>";

        for (FeedObj feed : feeds) {
            String img = feed.getImages();
            String imgstr = "";
            if (!img.equals("0")) {
                imgstr = "<tr><td colspan=2><img class='feed-image' src='images/" + img + "' alt='이미지'></td></tr>";
            }

            str += "<tr><td colspan=2><hr></td></tr>";
            str += "<tr>";
            str += "<td><small>" + feed.getId() + "</small></td>";
            str += "<td align=right><small>&nbsp;(" + feed.getTs() + ")</small></td>";
            str += "</tr>";
            str += imgstr; // 이미지 표시 여부에 따라 추가
            str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
            str += "<tr><td colspan=2>";

            // 현재 로그인한 사용자의 아이디와 글 작성자의 아이디를 비교하여 일치하는 경우에만 수정, 댓글 버튼 표시
            if (uid.equals(feed.getUserId())) {
                str += "<a href='javascript:void(0);' onclick='deleteFeed(" + feed.getNo() + ")' class='delete-button'>삭제</a>";
                str += "<a href='updateFeed.jsp?feedNo=" + feed.getNo() + "' class='update-button'>수정</a>";
            }
            
            str += "<a href='viewComments.jsp?feedNo=" + feed.getNo() + "' class='view-comments-button'>댓글 보기</a>";
            str += "</td></tr>";
        }
        str += "</table>";

        // JavaScript 코드 추가
        str += "<script>";
        str += "function deleteFeed(feedNo) {";
        str += "  var confirmDelete = confirm('정말로 삭제하시겠습니까?');";
        str += "  if (confirmDelete) {";
        str += "    window.location.href = 'deleteFeed.jsp?feedNo=' + feedNo;";
        str += "  }";
        str += "}";
        
        str += "</script>";

        out.print(str);
    %>
</body>