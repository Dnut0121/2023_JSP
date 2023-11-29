<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form= document.loginForm;
		if (isNaN(form.passwd.value)){
			alert("비밀번호는 숫자로만 입력 가능 합니다!");
			form.passwd.select();
			return;
		} 
		form.submit();
	}
</script>
<body>
	<form name="loginForm" action="#" method="post">
		<p>비밀번호 : <input type="password" name="passwd">
		<p><input type="submit" value="전송" onclick="checkLogin()">
		
		</form>
</body>
</html>