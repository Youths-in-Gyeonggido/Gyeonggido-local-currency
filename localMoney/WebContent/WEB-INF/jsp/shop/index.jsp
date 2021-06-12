<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page import="org.mybatis.domain.Account" %>
<script type="text/javascript" src="/"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%
request.setCharacterEncoding("utf-8");

if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
	Account user = (Account)request.getSession().getAttribute("user");
	String id = user.getId();
}
%>
<html lang="KR">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/store_list.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/kakaomap.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/includeHTML.js"></script>
<title>내 주변 경기도 지역화폐 가맹점</title>

<style>
    .wrap {position: absolute;left: -95px;bottom: 40px;width: 358px;height: 122px;margin-left: -84px;text-align: left;overflow: hidden;font-size: 12px;white-space:normal;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 356px;height: 110px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 5px 0 0 10px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: normal;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>

</head>
<body>
	<!-- header load -->
	<div id="header">
		<jsp:include page="/static/html/header2.jsp" />
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

		<!-- loading image -->

		<!-- main/search main -->
		<div class="search_sec" id="search_sec">
			<div class="logo">
				<a class="logo_a" href="/shop/index"> <i class="fas fa-won-sign"></i> <span>내
						주변 경기도 지역화폐 가맹점</span>
				</a>
			</div>
			<form action="/shop/index" method="get" name="searchForm" onsubmit = "return checkForm()">
			<div class="search">
				<div class="search_area_div">
					<label id="locationLabel">현재위치 :</label>
          			<label id="userLocation"></label>
					<button class="area_change_btn" id="area_change_btn">위치변경</button>
				</div>
				<div class="search_select_div">
					<select name="shopType" id="shopType">
						<option value="업종 선택">업종 선택</option>
						<option value="가구">가구</option>
						<option value="건강식품">건강식품</option>
						<option value="건축자재">건축자재</option>
						<option value="사진관">사진관</option>
						<option value="기타의료기관">기타의료기관</option>
						<option value="농업">농업</option>
						<option value="레저업소">레저업소</option>
						<option value="레저용품">레저용품</option>
						<option value="문화">문화</option>
						<option value="병원">병원</option>
						<option value="보건위생">보건위생</option>
						<option value="사무통신">사무통신</option>
						<option value="서적문구">서적문구</option>
						<option value="수리서비스">수리서비스</option>
						<option value="숙박업">숙박업</option>
						<option value="잡화">잡화</option>
						<option value="약국">약국</option>
						<option value="여행">여행</option>
						<option value="연료판매점">연료판매점</option>
						<option value="용역">용역 서비스</option>
						<option value="유통업">유통업</option>
						<option value="음료식품">음료식품</option>
						<option value="의류">의류</option>
						<option value="일반휴게음식">일반휴게음식</option>
						<option value="자동차정비">자동차정비</option>
						<option value="전기제품">전기제품</option>
						<option value="주방용구">주방용구</option>
						<option value="학원">학원</option>
					</select> 
					<select name="sectors" id="sectors-select">
						<option value="반경">반경</option>
						<option value="1">1km</option>
						<option value="3">3km</option>
						<option value="5">5km</option>
					</select>
					<input type="hidden" id="city" value="" name="city"/>
					<input type="hidden" id="lat" value="" name="lat"/> 
					<input type="hidden" id="lon" value="" name="lon"/>
					<input type="hidden" id="address" value="" name="address"/> 
				</div> 
				<div class="search_button_div">
					<button type="submit" class="search_button">가맹점 검색</button>
				</div>
			</div>
			</form>
		</div>

		<div class="map_sec">
			<div class="map" id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cfbf7dc8c75f6cba5c6e5684a408d0e&libraries=services"></script>
				<script type="text/javascript" src="/static/js/kakaomap.js"></script>
			<script>
			
			function checkForm() {
				let f = document.searchForm
				
				if(f.shopType[0].selected || f.sectors[0].selected) {
					alert("항목을 모두 선택해주세요")
					return false
				}
				
				return true
			}
			
			
			
		/* 	for(i = 0; i < document.getElementById("shopType").options.length; i++) {
				if(document.getElementById())
			} */
			
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			            document.searchForm.lat.value=lat;
			            document.searchForm.lon.value=lon;
			            
			        var callback = function(result, status) {
					    if (status === kakao.maps.services.Status.OK) {

					    	var address = result[0].address.address_name,
							 	code = result[0].address.address_name.split(' ')[1];
					    	
							document.searchForm.city.value=code;
							document.searchForm.address.value=address;
					    }
					};
			            
			        geocoder.coord2Address(lon, lat, callback);
			      });
			}

			
			/* var mapContainer = document.getElementById('map'),
				mapOption = {
				center: new kakao.maps.LatLng(37.1641402031, 127.0620190632),
				level: 3
			};
	
			var map = new kakao.maps.Map(mapContainer, mapOption); */
			
			<c:forEach items="${listShop}" var="shop" varStatus="status">
			var markerPosition = new kakao.maps.LatLng("${shop.shopLocationX}", "${shop.shopLocationY}"); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
		  	  position: markerPosition,
		  	  map: map
			});
			
	 		var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            "			${shop.shopName}" + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis";>' +
            "					${shop.shopAddress}" +
            '				</div>' + 
            '                <div class="jibun ellipsis">(우)' + "${shop.shopPost}" + '</div>' + 
            '                <div>' +
            '				 <a href="/shop/detail?shopName=${shop.shopName}&city=${shop.city}&lat=${shop.shopLocationX}" style="color:blue" target="_blank"">상세정보</a></div>' +
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';
            
            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                position: marker.getPosition()       
            });
         
            (function(marker, overlay) {
            	kakao.maps.event.addListener(marker, 'click', function() {
            	    overlay.setMap(map);
            	});
            })(marker, overlay);

        	 
            
		</c:forEach>
		
		function closeOverlay() {
    	    overlay.setMap(null);  
  
    	}
		const urlParams = new URLSearchParams(window.location.search);
		const hasShopType = urlParams.has('shopType');
		
		if(hasShopType) {
			var shopType = urlParams.get('shopType');
			var sectors = urlParams.get('sectors');
			
			for(i = 0; i < document.getElementById("shopType").options.length; i++) {
				if(document.getElementById("shopType").options[i].value == shopType) {
					document.getElementById("shopType").options[i].selected = "selected";
				}
			}
			
			for(i = 0; i < document.getElementById("sectors-select").options.length; i++) {
				if(document.getElementById("sectors-select").options[i].value == sectors) {
					document.getElementById("sectors-select").options[i].selected = "selected";
				}
			}
			
		}
					/* // 주소-좌표 변환 객체
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
					} */
				</script>
			<!-- <script type="text/javascript" src="../js/kakaomap.js"></script> -->
		</div>
	</main>
	<!-- main -->
	<!-- footer start -->
	<footer></footer>
	<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/header.js"></script>
</body>
</html>