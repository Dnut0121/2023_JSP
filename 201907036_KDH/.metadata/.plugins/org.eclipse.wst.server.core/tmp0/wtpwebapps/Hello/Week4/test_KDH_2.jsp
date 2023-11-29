<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<script type="text/javascript">
function checkMember() {
	var regID = /^[a-z|A-Z]/;
	var form = document.Member;
	var id = form.id.value;
	
	var regNAME = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var form = document.Member;
	var name = form.name.value;
	
if (!regID.test(id)){
	alert("아이디는 영문자로 시작해 주세요!");
	form.id.select();
	return;
} else if (form.passwd.value.length <8){
	alert("비밀번호는 8자 이상으로 입력해야합니다.");
	form.passwd.focus();
	return;
} else if (!regID.test(name)){
	alert("한글과 영문자만 가능합니다.");
	form.passwd.focus();
	return;
} else if (form.passwd.value.length <8){
	alert("비밀번호는 8자 이상으로 입력해야합니다.");
	form.passwd.focus();
	return;
} 



form.submit();
}
</script>
<body>
	<form name="Member" action="test_KDH.jsp" method="post">
		<p>아 이 디 : <input type="text" name="id">
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이름 : <input type="text" name="name">
		<p>연락처 : <input type="number" name="phone1">
			- <input type="number" name="phone2">
			- <input type="number" name="phone3">
		<p>이메일 : <input type="email" name="email">
		<p><input type="submit" value="전송" onclick="checkMember()">
		
		</form>
</body>
</html>