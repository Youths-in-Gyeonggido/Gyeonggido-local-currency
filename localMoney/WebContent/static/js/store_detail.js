
const shareBtn = document.getElementById('share_kakao');

shareBtn.addEventListener('click', () => {
	console.log("공유하기버튼");
	shareKakao();
});

//가맹점 명과 주소 넣어주세요!
let storeName = "${listShop.shopName}";
let storeAddress = "${listShop.shopAddress}";
let lat = '${listShop.shopLocationX}', //위도 
	lon = '${listShop.shopLocationY}'; //경도

function shareKakao() {
	// 사용할 앱의 JavaScript 키 설정
	Kakao.init('1cfbf7dc8c75f6cba5c6e5684a408d0e');

	// 카카오링크 버튼 생성
	Kakao.Link.createDefaultButton({
		container: '#share_kakao', // 카카오공유버튼ID
		objectType: 'feed',
		content: {
			title: storeName,
			description: storeAddress,
			imageUrl: 'http://www.sisaweekly.com/news/photo/202004/31524_47677_5735.jpg',
			link: { //공유할 링크 넣어주세요. (가맹점 정보)
				mobileWebUrl: "https://map.kakao.com/link/to/" + storeName + ',' + lat + ',' + lon,
				webUrl: "https://map.kakao.com/link/to/" + storeName + ',' + lat + ',' + lon
			}
		}
	});
}

// ------길찾기기능
const findRoadBtn = document.getElementById('find_road'); //길찾기 버튼

//가맹점 위도와 경도 넣어주세요!!
let lat = '${listShop.shopLocationX}', //위도 
	lon = '${listShop.shopLocationY}'; //경도

//가맹점명, 위도, 경도 입력
let link = 'https://map.kakao.com/link/to/' + storeName + ',' + lat + ',' + lon;

findRoadBtn.addEventListener('click', () => {
	window.open(link);
});