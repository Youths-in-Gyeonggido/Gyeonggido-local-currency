<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.mybatis.domain.Account" %>
<%@ page session="false"%>
<% request.setCharacterEncoding("utf-8"); 
	
	if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
	Account user = (Account)request.getSession().getAttribute("user");
	String id = user.getId();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="../css/style.css" /> -->
<link rel="stylesheet" href="/static/css/style.css" />
<link rel="stylesheet" href="/static/css/kakaomap.css" />
<link rel="stylesheet" href="/static/css/store_detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet" />
<script type="text/javascript" src="/static/js/main.js"></script>
<script type="text/javascript" src="/static/js/includeHTML.js"></script>
<title>내 주변 경기도 지역화폐 가맹점</title>

<style>
.wrap {
	position: absolute;
	left: -95px;
	bottom: 40px;
	width: 358px;
	height: 122px;
	margin-left: -84px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	white-space: normal;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 356px;
	height: 110px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 5px 0 0 10px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<!-- header load -->
	<jsp:include page="/static/html/header2.jsp" />
	<script type="text/javascript" src="/static/js/header.js"></script>
	<!-- menu -->
	<!-- <div class="menu_sec" id="menu_sec">
		<div class="menu_deco">
			<div class="menu favorites mid" id="favorites">
				<h3>즐겨찾기</h3>
				<div include-html="store_list.html"></div>
				<script>
					includeHTML();
				</script>
			</div>
			<div class="menu search_history mid" id="search_history">
				<h3>내 검색 내역</h3>
			</div>
			<div class="menu star_review mid" id="star_review">
				<h3>내 별점 후기</h3>
			</div>
		</div>
	</div> -->
	<main>
	<div class="menu_sec" id="menu_sec">
		<div class="menu_deco">
			<div class="menu favorites mid" id="favorites">
				<div class="title_fix">
					<h3>즐겨찾기</h3>
				</div>
				<c:forEach items="${listFavorite}" var="favorite" varStatus="status">
					<%@ include file = "/static/html/favorite.jsp" %>
				</c:forEach>
			</div>
			<div class="menu search_history mid" id="search_history">
				<div class="title_fix">
					<h3>내 검색 내역</h3>
				</div>
				<c:forEach items="${listHistory}" var="history" varStatus="status">
					<%@ include file = "/static/html/search_history.jsp" %>
				</c:forEach>
			</div>
			<div class="menu my_page mid" id="mypage">
				<h3>회원 정보</h3>
			</div>
		</div>
	</div>
	</main>
	<!-- store detail main -->
	<div class="store_detail_main">
		<!-- 점수 -->
		<div class="detail_star_div">
			<span class="detail_star_score">2.5</span> <i class="fas fa-star"></i>
		</div>
		<div></div>
		<div class="store_name_div">
			<span class="store_name"><c:out value="${listShop.shopName}" /></span>
		</div>

		<div class="store_info_div">
			<ul class="store_info_ul">
				<li class="store_text">업종</li>
				<li class="store_info_li" id="store_sector"><c:out value="${listShop.shopType}" /></li>
				<li class="store_text">주소</li>
				<li class="store_info_li" id="store_addr"><c:out value="${listShop.shopAddress}" /></li>
			</ul>
		</div>

		<div class="star_review_div">
			<div class="rating">
				<input type="radio" name="store_review" id="0.5"> 
				<input type="radio" name="store_review" id="1"> 
				<input type="radio" name="store_review" id="1.5">
				<input type="radio" name="store_review" id="2">
				<input type="radio" name="store_review" id="2.5"> 
				<input type="radio" name="store_review" id="3">
				<input type="radio" name="store_review" id="3.5"> 
				<input type="radio" name="store_review" id="4"> 
				<input type="radio" name="store_review" id="4.5"> 
				<input type="radio" name="store_review" id="5">
			</div>
		</div>

		<form name="favoriteForm" action="/shop/insert" method="get">
			<input type="hidden" id="shopName" value="${listShop.shopName}" name="shopName"/> 
			<input type="hidden" id="address" value="${listShop.shopAddress}" name="address"/>
			<input type="hidden" id="hrefURL" value="" name="hrefURL"/>
		</form>
		<div class="store_buttons_div">
			<i class="fas fa-heart" onclick="favorite()"></i>
			<button id="find_road">길찾기</button>
			<span id="share_kakao"><i class="fas fa-share-alt-square"></i></span>
		</div>
	</div>
			
	<script type="text/javascript">
				function favorite() {
					if(<%=request.getSession(false) != null && request.getSession().getAttribute("user") != null%>) {
						var url = window.location.href;
						document.favoriteForm.hrefURL.value=url;
						favoriteForm.submit();
					} else {
						alert("로그인 후 사용할수 있는 기능입니다.")
					}
				};
	</script>
			
	<!-- map -->
	<div class="map_sec">
		<div class="map" id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cfbf7dc8c75f6cba5c6e5684a408d0e&libraries=services&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(${listShop.shopLocationX}, ${listShop.shopLocationY}), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);

			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(${listShop.shopLocationX}, ${listShop.shopLocationY})
			});
			
			let storeName = ${listShop.shopLocationX};
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 지도에 마커를 표시합니다 
			var marker = new kakao.maps.Marker({
			    map: map, 
			    position: new kakao.maps.LatLng(${listShop.shopLocationX}, ${listShop.shopLocationY})
			});

			var content = '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ "			${listShop.shopName}"
					+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
					+ '        </div>' + '        <div class="body">'
					+ '            <div class="img">' + '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis";>'
					+ "					${listShop.shopAddress}" + '				</div>'
					+ '                <div class="jibun ellipsis">(우)'
					+ "${listShop.shopPost}" + '</div>' + '            </div>'
					+ '        </div>' + '    </div>' + '</div>';

			//마커 위에 커스텀오버레이를 표시합니다
			//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});

			//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});
			
			

			//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				overlay.setMap(null);
			}
			
			</script>	
	</div>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</html>