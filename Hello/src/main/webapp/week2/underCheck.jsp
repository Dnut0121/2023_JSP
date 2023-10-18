<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String res = "<h3>매월 12일은 시스템 점검일니다.</h3>";
res += "<br>12일 이후 다시 이용해주세요.";
out.print(res);
%>
</body>
</html>