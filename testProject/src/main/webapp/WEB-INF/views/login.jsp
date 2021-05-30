<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 주변 경기도 지역화폐 가맹점 로그인</title>
    <link rel="stylesheet" href="/resources/css/log_in.css" />
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
    <section class="login-form">
      <h1><a href="login">내 주변 경기도 지역화폐 가맹점</a></h1>
      <form action="login" method="Post">
        <div class="int-area">
          <input type="text" name="id" id="id" autocomplete="off" required />
          <label for="id">USER NAME</label>
        </div>
        <div class="int-area">
          <input type="password" name="passWord" id="passWord" autocomplete="off" required/>
          <label for="id">PASSWORD</label>
        </div>
        <div class="btn-area">
          <button id="btn" type="submit">로그인</button>
        </div>
      </form>
      <div class="caption">
       <a href="signPage">회원가입</a>
      </div>
    </section>
    
    
    <script src="/resources/js/log_in.js"></script>
<!--	<form action="Login" id="LoginForm" name="LoginForm" method="post">
		아이디<input type="text" name="id"><br /> 
		비밀번호<input type="passWord" name="passWord"><br /> 
		<input type="submit" value="로그인"></input>
		<button onclick = "location='signUp.jsp'">회원가입</button>
	</form> -->
</body>
</html>