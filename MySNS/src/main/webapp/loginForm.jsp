<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        .button {
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<script>
	function submit2(frm){
		frm.action="signupForm.jsp";
		frm.submit();
		return true;
	}
</script>
<body>
	<form action="login.jsp" method="post">
	<table align=center>
	<header>
        <h1 align = center>로그인</h1>
	</header>
	<tr>
		<td align=right>아이디&nbsp;</td> 
		<td><input type="text" name="id" placeholder="Email address" required></td>
	</tr>
	<tr>
		<td align=right>패스워드&nbsp;</td> 
		<td><input type="password" name="ps" required></td>
	</tr>
	<tr>
		<td colspan=2 align=left height=50>
			<input type="submit" value="로그인하기" class="button">
		</td>
		<td colspan=2 align=right height=50>
			<input type="button" value="회원가입"class="button" onclick='return submit2(this.form);'>
		</td>
	</tr>
	</table>
	
	
</body>
</html>