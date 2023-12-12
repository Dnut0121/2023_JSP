<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="dao.FeedDAO, dao.FeedObj" %>

<%
	request.setCharacterEncoding("utf-8");
    String feedNo = request.getParameter("feedNo");
    String updatedContent = request.getParameter("updatedContent");

    // 추가로 필요한 업데이트 내용을 request.getParameter로 얻어올 수 있음
    // 예: String updatedImages = request.getParameter("updatedImages");

    try {
        FeedDAO feedDAO = new FeedDAO();

        // 피드 내용 업데이트
        feedDAO.setContent(Integer.parseInt(feedNo), updatedContent);

        // 추가로 필요한 업데이트 내용을 설정할 수 있음
        // 예: feedDAO.setImages(Integer.parseInt(feedNo), updatedImages);

        // 메인 페이지로 리다이렉트
        response.sendRedirect("main.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // 예외 처리 로직 추가
    }
%>