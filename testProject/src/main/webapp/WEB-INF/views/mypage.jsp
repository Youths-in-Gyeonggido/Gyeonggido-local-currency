<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!--  header를 사용하기 위한 파라미터 받아와서 contentPage에 담고
  <%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="FirstView.jsp";
  %>
-->
<!DOCTYPE html>
<html lang="KR">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>내 회원 정보 / 내 주변 경기도 지역화폐 가맹점</title>
<link rel="stylesheet" href="/resources/css/user_info.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<script type="text/javascript" src="/resources/js/includeHTML.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet" />
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
		<section class="all_user_info">
			<div class="all_user_info_wrap">
				<h1>
					<i class="fas fa-won-sign"></i> 
					<a href="index.html">내 주변 경기도지역화폐 가맹점</a>
				</h1>
				<h2>회원 정보</h2>
				<hr/>
				<div id="modify_user_info" class="my_page_content">
					<div class="user_column">
						<div class="title title_space">아이디</div>
						<div class="divider"></div>
						<div class="info_content">${user.id}</div>
					</div>
					<div class="user_column">
						<div class="title title_space">닉네임</div>
						<div class="divider"></div>
						<div class="info_content">${user.name}</div>
					</div>
					<div class="user_column">
						<div class="title title_space">이메일</div>
						<div class="divider"></div>
						<div class="info_content">${user.email}</div>
					</div>
				</div>
				<hr/>
				<div class="user_btns">
					<div class="wrap_btns">
						<input id="modify_btn" type="button" value="회원정보수정"
							onclick="location.href='update'" /><input id="cancel_btn"
							type="button" value="취소" onclick="location.href='index'" />
					</div>
					<input id="delete_btn" type="button" value="회원탈퇴"
						onclick="location.href='deletePage'" />
				</div>
			</div>
		</section>
	</main>
	<footer></footer>
    </body>
</html>