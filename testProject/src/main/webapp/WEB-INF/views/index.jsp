<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script type="text/javascript" src="/"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
request.setCharacterEncoding("utf-8");
%>
<html lnag="KR">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/store_list.css" />
<link rel="stylesheet" href="/resources/css/kakaomap.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet" />
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/includeHTML.js"></script>
<title>내 주변 경기도 지역화폐 가맹점</title>
</head>
<body>
	<!-- header load -->
	<div id="header">
		<jsp:include page="/resources/html/header2.jsp" />
	</div>
	<!-- logout modal load -->
	<div class="out_modal">
		<div class="modal_content">
			<div class="modal_header">
				<h2>로그아웃 하시겠습니까?</h2>
				<button class="btn_close">&times;</button>
			</div>
			<div class="modal_answer">
				<button class="ans_yes" type="button">YES</button>
				<button class="ans_no" type="button">NO</button>
			</div>
		</div>
	</div>
	<div class="overlay"></div>

	<!-- main start -->
	<main>
		<!-- main/menu -->
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
					<div class="title_fix">
						<h3>내 검색 내역</h3>
					</div>
				</div>
				<div class="menu my_page mid" id="mypage">
					<h3>회원 정보</h3>
				</div>
			</div>
		</div>

		<!-- loading image -->

		<!-- main/search main -->
		<div class="search_sec" id="search_sec">
			<div class="logo">
				<a class="logo_a" href="#"> <i class="fas fa-won-sign"></i> <span>내
						주변 경기도 지역화폐 가맹점</span>
				</a>
			</div>
			<div class="search">
				<div class="search_area_div">
					<label>현재위치 :</label> <label>경기도 수원시 장안구 율전동</label>
					<button class="area_change_btn">위치변경</button>
				</div>
				<div class="search_select_div">
					<select name="sectors" id="sectors-select">
						<option value="">업종 선택</option>
						<option value="">1</option>
						<option value="">2</option>
					</select> <select name="sectors" id="sectors-select">
						<option value="">반경 선택</option>
						<option value="">1km</option>
						<option value="">3km</option>
						<option value="">5km</option>
					</select>
				</div>
				<div class="search_button_div">
					<button class="search_button">가맹점 검색</button>
				</div>
			</div>
		</div>

		<div class="map_sec">
			<div class="map" id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>
			<script>
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(37.27499050286018,
									127.0089299711268),
							level : 6
						};

						var map = new kakao.maps.Map(container, options);

						// 주소-좌표 변환 객체
						var geocoder = new kakao.maps.services.Geocoder();

						var marker = new kakao.maps.Marker({
							// 지도 중심좌표에 마커를 생성합니다 
							position : map.getCenter()
						});

						console.log(map.getCenter());
						marker.setMap(map);

						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							// 마커 위치를 클릭한 위치로 옮깁니다
							marker.setPosition(latlng);

							console.log('클릭한 위치의 위도는 ' + latlng.getLat()
									+ ' 이고, 경도는 ' + latlng.getLng() + ' 입니다');
						});

						if (navigator.geolocation) {
							navigator.geolocation
									.getCurrentPosition(function(position) {

										var lat = position.coords.latitude, // 위도
										lon = position.coords.longitude; // 경도

										var locPosition = new kakao.maps.LatLng(
												lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
										message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
										console.log(locPosition);

										map.setCenter(locPosition);
										marker.setMap(map);
									});
						}
				</script>
			<!-- <script type="text/javascript" src="../js/kakaomap.js"></script> -->
		</div>
	</main>
	<!-- main -->
	<!-- footer start -->
	<footer></footer>
	<script type="text/javascript" src="resources/js/header.js"></script>
</body>
</html>
