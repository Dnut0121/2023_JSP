<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%
	Date now = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(now);
	if (date.endsWith("04")) {
		response.sendRedirect("underCheck.jsp");
		return;
	}
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디: " + uid + "</h3>";
	res += "<br>로그인 시간: " + now.toString();
	out.print(res);
	%>
</body>
</html>