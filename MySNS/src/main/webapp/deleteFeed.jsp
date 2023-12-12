<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.FeedDAO" %>
<%@ page import="dao.FeedObj" %>
<%@ page import="java.io.*" %>

<%
    // 현재 로그인한 사용자의 아이디를 세션에서 가져옴
    String currentUser = (String) session.getAttribute("id");

    // 만약 로그인되지 않은 경우 로그인 페이지로 이동하도록 처리할 수 있음
    if (currentUser == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }

    // 삭제할 글의 번호를 파라미터로 받아옴
    int feedNo = Integer.parseInt(request.getParameter("feedNo"));

    // 글 정보를 가져옴
    FeedDAO feedDAO = new FeedDAO();
    FeedObj feed = feedDAO.getFeed(feedNo);

    // 현재 로그인한 사용자와 글 작성자가 다르면 알림창을 띄우고 뒤로 돌아가기
    if (!currentUser.equals(feed.getId())) {
        out.println("<script>alert('글 작성자만 삭제할 수 있습니다.'); history.go(-1);</script>");
        return;
    }

    // 삭제할 글의 번호를 이용하여 글을 삭제
    boolean isDeleted = feedDAO.deleteFeed(feedNo);

    // 삭제가 성공했으면 메인 페이지로 이동, 실패했으면 실패 메시지 표시
    if (isDeleted) {
        response.sendRedirect("main.jsp");
    } else {
        out.println("<script>alert('글 삭제 중 오류가 발생했습니다.'); history.go(-1);</script>");
    }
%>