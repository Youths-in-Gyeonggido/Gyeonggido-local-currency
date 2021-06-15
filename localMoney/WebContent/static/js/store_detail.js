// ------길찾기기능
var findRoadBtn = document.getElementById('find_road'); //길찾기 버튼
var storeName1 = '${listShop.shopName}';
var storeAddress = '${listShop.shopAddress}';
//가맹점 위도와 경도 넣어주세요!!
var lat = '#{listShop.shopLocationX}', //위도 
	lon = '${listShop.shopLocationY}'; //경도
//가맹점명, 위도, 경도 입력
var link = 'https://map.kakao.com/link/to/' + storeName1 + ',' + lat + ',' + lon;
//길찾기 버튼 클릭 이벤트
findRoadBtn.addEventListener('click', () => {
	window.open(link);
});
var shareBtn = document.getElementById('share_kakao');
//공유하기 버튼 클릭 이벤트
shareBtn.addEventListener('click', () => {
	shareKakao();
	console.log("공유 ");
});
function shareKakao() {
	// 사용할 앱의 JavaScript 키 설정
	if (!Kakao.isInitialized()) {
		Kakao.init('1cfbf7dc8c75f6cba5c6e5684a408d0e');
	}
	// 카카오 공유하기 객체
	Kakao.Link.sendDefault({
		objectType: 'feed',
		content: {
			title: storeName1,
			description: storeAddress,
			imageUrl: 'http://www.sisaweekly.com/news/photo/202004/31524_47677_5735.jpg',
			link: { //공유할 링크 넣어주세요. (가맹점 정보)
				mobileWebUrl: "https://map.kakao.com/link/to/" + storeName1 + ',' + lat + ',' + lon,
				webUrl: "https://map.kakao.com/link/to/" + storeName1 + ',' + lat + ',' + lon
			}
		}
	});
}

