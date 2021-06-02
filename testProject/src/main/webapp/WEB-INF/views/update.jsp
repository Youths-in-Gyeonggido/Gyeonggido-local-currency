<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KR">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/includeHTML.js"></script>
<link rel="stylesheet" href="/resources/css/user_info_modify.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<title>회원 정보 수정</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/resources/html/header2.jsp" />
	<script type="text/javascript" src="/resources/js/header.js"></script>
	<main>
		<div class="menu_sec" id="menu_sec">
			<div class="menu_deco">
				<div class="menu favorites mid" id="favorites">
					<div class="title_fix">
						<h3>즐겨찾기</h3>
					</div>
					<div include-html="/resources/html/store_list.html"></div>
					<div include-html="/resources/html/store_list.html"></div>
					<div include-html="/resources/html/store_list.html"></div>
					<div include-html="/resources/html/store_list.html"></div>
					<div include-html="/resources/html/store_list.html"></div>
					<script>
						includeHTML();
					</script>
				</div>
				<div class="menu search_history mid" id="search_history">
					<div class="title_fix all_dlt_btn">
						<h3>내 검색 내역</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원 정보 수정 form -->
		<section class="all_user_info">
			<div class="all_user_info_wrap">
				<h1>
					<i class="fas fa-won-sign"></i> <a href="index.html">내 주변 경기도
						지역화폐 가맹점</a>
				</h1>
				<h2>회원 정보 수정</h2>
				<hr/>
				<form class="all_form" action="updateUser" method="post">
					<div id="content">
						<!-- 아이디 변경불가 -->
						<div class="user_column">
							<div class="title_column">
								<div class="title">아이디</div>
								<i class="fas fa-star-of-life fa-xs"></i>
							</div>
							<div class="error_area">
								<div class="box int_id">
									<input type="text" id="id" name="id" class="int"
										value="${user.id}" readonly />
									<!-- 아이디를 변경 불가능 하므로 readonly사용 -->
								</div>
							</div>
						</div>
						<!-- 비밀번호 변경가능(필수) -->
						<div class="user_column">
							<div class="title_column">
								<div class="title">비밀번호</div>
								<i class="fas fa-star-of-life fa-xs"></i>
							</div>
							<div class="error_area">
								<div class="box int_pass">
									<input type="password" id="pwsd1" name="passWord" class="int"
										maxlength="20" value="" autocomplete="off" required /> <span
										id="alertTxt">사용불가</span> <img
										src="/resources/img/m_icon_pass.png" id="pswd1_img1"
										class="pswdImg" />
								</div>
								<span class="error_next_box"></span>
							</div>
						</div>
						<!-- 비밀번호 확인 필수 -->
						<div class="user_column">
							<div class="title_column">
								<div class="title">비밀번호 확인</div>
								<i class="fas fa-star-of-life fa-xs"></i>
							</div>
							<div class="error_area">
								<div class="box int_pass_check">
									<input type="text" id="pswd2" class="int" maxlength="20"
										autocomplete="off" required /> <img
										src="/resources/img/m_icon_check_disable.png" id="pswd2_img1"
										class="pswdImg" />
								</div>
								<span class="error_next_box"></span>
							</div>
						</div>
						<!-- 닉네임 필수 -->
						<div class="user_column">
							<div class="title_column">
								<div class="title">닉네임</div>
								<i class="fas fa-star-of-life fa-xs"></i>
							</div>
							<div class="error_area">
								<div class="box int_name">
									<input type="text" id="name" name="name" class="int"
										autocomplete="off" required />
								</div>
								<span class="error_next_box"></span>
							</div>
						</div>
						<!-- 이메일 필수X -->
						<div class="user_column">
							<div class="title_column">이메일</div>
							<div class="error_area">
								<div class="box int_email">
									<input type="text" id="email" name="email" class="int"
										autocomplete="off" />
								</div>
								<span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
							</div>
						</div>
					</div>
					<hr/>
					<!--회원정보수정/취소 버튼-->
					<div class="wrap_btns">
						<input id="modify_btn" type="submit" value="회원정보수정"
							onclick="alert('회원 정보 수정을 성공하였습니다.');" /> <input id="cancel_btn"
							type="button" value="취소하기" onclick="location.href='mypage'" />
					</div>
				</form>
			</div>
		</section>
	</main>
	<script src="/resources/js/user_info_modify.js"></script>
	<script type="text/javascript" src="/resources/js/header.js"></script>
</body>
</html>