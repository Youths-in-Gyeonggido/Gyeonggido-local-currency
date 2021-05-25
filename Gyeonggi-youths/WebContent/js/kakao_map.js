
const userLocation = document.querySelector('#userLocation'); 
const locationLabel = document.querySelector('#locationLabel'); //사용자 위치 정보 label
const areaChangeBtn = document.querySelector('#area_change_btn'); //현재위치 버튼
			
var container = document.getElementById('map');
var options = {
	center: new kakao.maps.LatLng(37.27499050286018, 127.0089299711268),
	level: 6
};
		
var map = new kakao.maps.Map(container, options);
var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체
var marker1 = new kakao.maps.Marker(); // 클릭한 위치를 표시할 마커입니다

//클릭시 클릭된 위치 좌표와 지번주소 반환
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		var detailAddr = result[0].address.address_name 
       
        // 마커를 클릭한 위치에 표시합니다 
        marker1.setPosition(mouseEvent.latLng);
        marker1.setMap(map);
        
        var latlng = mouseEvent.latLng; 
		  
	    console.log('클릭한 위치의 위도: ' + latlng.getLat() + ' 경도: ' + latlng.getLng());
        console.log('클릭한 곳의 지번 주소: ' + result[0].address.address_name);
        
        //원하는 위치 클릭시 
        locationLabel.textContent = '사용자 지정 위치 :';
        userLocation.textContent = result[0].address.address_name;
        }   
    });
});

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}


// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
        
        //사이트 접속 시 현재위치 html label 표시
        searchDetailAddrFromCoords(locPosition,function(result, status){
        	if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = result[0].address.address_name 
        	
	         	// html 내용 변경    
	            locationLabel.textContent = '현재 위치 :';
	            userLocation.textContent = result[0].address.address_name;
        	}
        })
        
        //현재위치 버튼 클릭시 
        areaChangeBtn.onclick = function(event) {
			//현재위치 html label 표시
	        searchDetailAddrFromCoords(locPosition,function(result, status){
	        	if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = result[0].address.address_name 
	        	
		         	// html 내용 변경    
		            locationLabel.textContent = '현재 위치 :';
		            userLocation.textContent = result[0].address.address_name;
	        	}
	        })
		};
      });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = '현재위치를 불러오는데 실패했습니다.';
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    

console.log('kakao_map.js');