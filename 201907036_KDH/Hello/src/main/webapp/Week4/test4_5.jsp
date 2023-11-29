<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkMember() {
		var regID = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var form = document.Member;
		
		var id = form.id.value;
		
	if (!regID.test(id)){
		alert("아이디는 문자로 시작해 주세요!");
		form.id.select();
		return;
	}
	form.submit();
	}
</script>
<body>
	<form name="Member" action="#" method="post">
		<p>아 이 디 : <input type="text" name="id">
		<p>비밀번호 : <input type="password" name="passwd">
		<p><input type="submit" value="전송" onclick="checkMember()">
		
		</form>
</body>
</html>