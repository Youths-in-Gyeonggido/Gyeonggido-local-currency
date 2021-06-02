<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<header>
	<div class="wrap_header">
		<nav class="navbar">
			<a href="#" class="navbar_toggleBtn"> <i class="fas fa-bars "></i>
			</a>

			<ul class="navbar_menu">
				<li><a href="#" id="nav_favorites">즐겨찾기</a></li>
				<li><a href="#" id="nav_search_history">내 검색내역</a></li>
				<li><a href="mypage" id="nav_my_page">회원 정보</a></li>
			</ul>
			<!-- 프로필 부분 -->
			<div class="user_area">
				<div class="wrap_user">
					<span class="user_icon"><i class="fas fa-user-circle"></i>
						${user.id}</span>

				</div>
				<div class="user_menu">
					<c:if test="${user!=null}">
						<i class="far fa-smile"></i>
						<span>${user.name}</span>
						<div class="log-out">
							<button class="btn_log_out" onclick="location.href='logout'">
								<i class="fas fa-sign-out-alt"></i> LOG OUT
							</button>
						</div>
					</c:if>
					<c:if test="${user==null}">
						<i class="far fa-smile"></i>
						<span>${user.name}</span>
						<div class="log-out">
							<button class="btn_log_out" onclick="location.href='LoginPage'">
								<i class="fas fa-sign-out-alt"></i> LOG IN
							</button>
						</div>
					</c:if>
				</div>
			</div>
		</nav>
	</div>
</header>
</html>