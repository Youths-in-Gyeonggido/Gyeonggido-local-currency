<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
</head>
<body>
	<form action="Login" id="LoginForm" name="LoginForm" method="post">
		아이디<input type="text" name="id"><br /> 
		비밀번호<input type="passWord" name="passWord"><br /> 
		<input type="submit" value="로그인"></input>
		<button onclick = "location='signUp.jsp'">회원가입</button>
	</form>
</body>
</html>