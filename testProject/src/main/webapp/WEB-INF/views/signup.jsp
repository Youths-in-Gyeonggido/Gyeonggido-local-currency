<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- <%@ pagepageEncoding="UTF-8" contentType="text/html; charset-UTF-8" %>
 -->
 <% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
	<title>signup</title>
</head>
<body>

	<form action="signUp" id="signForm" name="signForm" method="post">
		아이디<input type="text" name="id"><br/>
		<p id="temp"></p>
		비밀번호<input type="passWord" name="passWord"><br/>
		비밀번호 확인<input type="passWord" name="passWordCheck"><br/>
		<p id="passWordCheckRegex"></p>
		닉네임<input type="text" name="name"><br/>
		email<input type="text" name="email"><br/>
		<button type="button" id="signUpBtn">회원가입</button>
	</form>
</body>
</html>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script type="text/javascript">
var idPass;
var idRegex = /^[a-zA-Z0-9]{1,12}$/;
$(document).ready(function(){
	//아이디 중복체크
	$('input[name=id]').blur(function(){
		var idCheck=$('input[name=id]').val();
		console.log(idCheck);
		if(idRegex.test(idCheck)){
			$.ajax({
				url:'idCheck?userId='+idCheck,
				type:'get',
	
				success:function(data){
					var color;
					var ans;
					if(data>0){
						ans='이미있는 아이디입니다.';
						color='red';
                        idPass=false;
					}else{
						ans='회원가입 가능한 아이디입니다.';
						color='blue';
						idPass=true;
					}
					$('#temp').text(ans);
					$('#temp').css('color',color);
				}
			})	
		}
	})
	//비밀번호 일치
	//비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 5~10
	var pwRegex =  /^.*(?=^.{1,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		$('input[name=passWordCheck]').blur(function(){
			var passWordTest=pwRegex.test($('input[name=passWord]').val());
			if(passWordTest&&$('input[name=passWord]').val()==$('input[name=passWordCheck]').val()){
				passWordPass=true;
				$('#passWordCheckRegex').text('성공');
			}else if(!passWordTest){
				passWordPass=false;
				$('#passWordCheckRegex').text('비밀번호가 형식에 맞지 않습니다.');
			}else if($('input[name=passWord]').val()!=$('input[name=passWordCheck]').val()){
				passWordPass=false;
				$('#passWordCheckRegex').text('비밀번호가 일치하지 않습니다.');
			}
		})
		
	//회원가입 버튼 작동
	$('#signUpBtn').click(function(){
		var name=$('input[name=name]').val();
		if(idPass&&name!=''&&passWordPass){
			$('#signForm').submit();
		}else{
			alert('조건에 만족하지 않습니다.');
		}
	})
});
   </script>
