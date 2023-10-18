<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>	
		<%@include file="menu.jsp" %>
		<%!String getDate() {
		return (new Date()).toString();
		}
		%>
	<body>
		<div style="background-color: #808080; color: #000000; padding: 50px; border: 1px solid #ccc; border-radius: 5px; text-align: center;">
        <p style="font-size: 40px;">웹페이지 실습에 오신것을 환영합니다</p>
    	</div>

		
		<div style="text-align: center; padding:30px;">
		<%
		String res = "현재 시간 : " + getDate();
		out.print(res);
		%>
		</div>
	</body>	
		<%@include file="footer.jsp" %>


</html>