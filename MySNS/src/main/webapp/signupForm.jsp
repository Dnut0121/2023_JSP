<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            padding: 3px 5px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
            margin-left: auto;
            margin-top: 5px;
        }
        .button:hover {
            background-color: #555;
        }
    </style>
    <script type="text/javascript"> 
        function id_check() {
            var id = document.getElementsByName("id")[0].value;
            if (id == "") {
                alert("ID를 입력하세요");
                return;
            }
            var url = "confirmId.jsp?id=" + id;
            window.open(url, "confirm", "width=300,height=200");
        }

        function goToLoginForm() {
            window.location.href = "loginForm.jsp";
        }
    </script>
</head>
<body>
    <form action="signup1.jsp" method="post">
        <table align=center>
            <header>
                <h1 align=center>회원가입</h1>
            </header>
            <tr>
                <td align=right>아이디&nbsp;</td>
                <td><input type="text" name="id" placeholder="Email address" required></td>
                <td>
                    <!-- Apply the smaller button class -->
                    <input type="button" value="중복체크" onclick='id_check()' class="button">
                </td>
            </tr>
            <tr>
                <td align=right>패스워드&nbsp;</td>
                <td><input type="password" name="ps" required></td>
            </tr>
            <tr> 
                <td align=right>패스워드(확인)&nbsp;</td>
                <td><input type="password" name="ps2" required></td>
            </tr>
            <tr>
                <td align=right>이름&nbsp;</td>
                <td><input type="text" name="name" required></td> 
            </tr>
            <!-- Add new fields for address and birth -->
            <tr>
                <td align=right>주소&nbsp;</td>
                <td><input type="text" name="address" required></td>
            </tr>
            <tr>
                <td align=right>생년월일&nbsp;</td>
                <td><input type="text" name="birth" value="1999-01-01" required></td>
            </tr>
            <tr>
                <td colspan=2 align=center height=50>
                    <input type="submit" value="회원가입하기" class="button">
                    <!-- Add login button -->
                    <input type="button" value="로그인하기" onclick='goToLoginForm()' class="button">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
