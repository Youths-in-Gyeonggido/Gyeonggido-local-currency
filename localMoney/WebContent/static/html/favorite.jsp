<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<div class="section_content">
		<div class="store_row">
			<button type="button" class="btn_store_fav" onclick="favorite()">
				<i class="fas fa-heart"></i>
			</button>
			
			<div class="store_info">
				<span class="store_name"> <c:out value="${favorite.shopName}" /></span> 
				<span class="store_address"><c:out value="${favorite.address}" /></span>
			</div>
			<div class="star_div">
				<span class="star_score">2.5</span> <i class="fas fa-star"></i>
			</div>
		</div>
		<div class="store_detail_div">
			<button class="store_detail" type="button" onclick="location.href='${favorite.hrefURL}'">상세보기</button>
		</div>
	</div>
	<link rel="stylesheet" href="/static/css/store_list.css" />
	<src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous">
</body>
</html>