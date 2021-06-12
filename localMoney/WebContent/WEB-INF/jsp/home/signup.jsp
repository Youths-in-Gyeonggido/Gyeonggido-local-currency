<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script type="text/javascript" src ="/"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <% request.setCharacterEncoding("utf-8"); %>
<html lnag="KR">
<head>
	<title>내 주변 경기도 지역화폐 가맹점 회원가입</title>
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sign_up.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
      rel="stylesheet"
    />	
</head>
<body>
   <!-- wrapper -->
    <section class="signup-form">
      <h1>회원가입</h1>
      <h2>내 주변 경기도 지역화폐 가맹점에 오신 걸 환영합니다!</h2>
      <form class="all-form" action="regist_Member" method="post">
        <div id="content">
          <!-- 아이디 -->
          <div>
            <h3 class="join_title">
              <label for="id">아이디</label>
            </h3>
            <span class="box int_id">
              <input type="text" id="id" name="id"class="int" maxlength="20" required />
            </span>
            <span class="error_next_box">
            
            </span>
            <p class="error_next_box2"></p>
          </div>

          <!-- 비밀번호 -->
          <div>
            <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
            <span class="box int_pass">
              <input
                type="password"
                id="pswd1"
                name = "password"
                class="int"
                maxlength="20"
                required
              />
              <span id="alertTxt">사용불가</span>
              <img
                src="<%=request.getContextPath()%>/static/img/m_icon_pass.png"
                id="pswd1_img1"
                class="pswdImg"
              />
            </span>
            
            <span class="error_next_box">
           		 
            </span>
          </div>

          <!-- 비밀번호 확인 -->
          <div>
            <h3 class="join_title">
              <label for="pswd2">비밀번호 재확인</label>
            </h3>
            <span class="box int_pass_check">
              <input
                type="password"
                id="pswd2"
                class="int"
                maxlength="20"
                required
              />
              <img
                src="<%=request.getContextPath()%>/static/img/m_icon_check_disable.png"
                id="pswd2_img1"
                class="pswdImg"
              />
            </span>
            <span class="error_next_box"></span>
          </div>

          <!-- 닉네임 -->
          <div>
            <h3 class="join_title"><label for="name">닉네임</label></h3>
            <span class="box int_name">
              <input
                type="text"
                id="name"
                name ="name"
                class="int"
                maxlength="20"
                required
              />
            </span>
            <span class="error_next_box"></span>
          </div>

          <!-- 이메일 -->
          <div>
            <h3 class="join_title">
              <label for="email"
                >이메일<span class="optional">(선택)</span></label
              >
            </h3>
            <div id="email_wrap">
              <span class="box int_email">
                <input
                  type="text"
                  id="email"
                  name="email"
                  class="int"
                  maxlength="100"
                  placeholder="email@gmail.com"
                />
              </span>
            </div>
            <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
          </div>

          <!-- 가입버튼-->
          <div class="btn_area">
            <button type="submit" id="btnJoin">
              <span>가입하기</span>
            </button>
          </div>
        </div>
      </form>
    </section>
    <!-- wrapper -->
    <script src="<%=request.getContextPath()%>/static/js/sign_up.js"></script>

<!-- 	<form action="signUp" id="signForm" name="signForm" method="post">
		아이디<input type="text" name="id"><br/>
		<p id="temp"></p>
		비밀번호<input type="password" name="password"><br/>
		비밀번호 확인<input type="password" name="passwordCheck"><br/>
		<p id="passwordCheckRegex"></p>
		닉네임<input type="text" name="name"><br/>
		email<input type="text" name="email"><br/>
		<button type="button" id="signUpBtn">회원가입</button>
	</form>
-->
</body>
</html>

 <!--    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


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
		$('input[name=passwordCheck]').blur(function(){
			var passwordTest=pwRegex.test($('input[name=password]').val());
			if(passwordTest&&$('input[name=password]').val()==$('input[name=passwordCheck]').val()){
				passwordPass=true;
				$('#passwordCheckRegex').text('성공');
			}else if(!passwordTest){
				passwordPass=false;
				$('#passwordCheckRegex').text('비밀번호가 형식에 맞지 않습니다.');
			}else if($('input[name=password]').val()!=$('input[name=passwordCheck]').val()){
				passwordPass=false;
				$('#passwordCheckRegex').text('비밀번호가 일치하지 않습니다.');
			}
		})
		
	//회원가입 버튼 작동
	$('#signUpBtn').click(function(){
		var name=$('input[name=name]').val();
		if(idPass&&name!=''&&passwordPass){
			$('#signForm').submit();
		}else{
			alert('조건에 만족하지 않습니다.');
		}
	})
});
   </script>
    -->
