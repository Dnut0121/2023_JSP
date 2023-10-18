<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkMember() {
	var regId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var form = document.Member;
	var id = form.id.value;
	if (!regId.test(id)) {
	alert(“아이디는 문자로 시작해 주세요!”);
	form.id.select();
	return;
	}
</script>
<body>

</body>
</html>