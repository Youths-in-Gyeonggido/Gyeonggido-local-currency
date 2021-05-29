//-------카카오톡 공유하기 기능
const shareBtn = document.getElementById('share_kakao');

shareBtn.addEventListener('click', () => {
	console.log("공유하기버튼");
	shareKakao();
});

//가맹점 명과 주소 넣어주세요!
let storeName = "가맹점 명"
let storeAddress = "가맹점 주소";

function shareKakao() {
	// 사용할 앱의 JavaScript 키 설정
	Kakao.init('2f696dcd122284d8212ec4dcee5b701f');

	// 카카오링크 버튼 생성
	Kakao.Link.createDefaultButton({
		container: '#share_kakao', // 카카오공유버튼ID
		objectType: 'feed',
		content: {
			title: storeName,
			description: storeAddress,
			imageUrl: 'http://www.sisaweekly.com/news/photo/202004/31524_47677_5735.jpg',
			link: { //공유할 링크 넣어주세요. (가맹점 정보)
				mobileWebUrl: "http://localhost:8003/Gyeonggi-youths/html/store_detail.html",
				webUrl: "http://localhost:8003/Gyeonggi-youths/html/store_detail.html"
			}
		}
	});
}

// ------길찾기기능
const findRoadBtn = document.getElementById('find_road'); //길찾기 버튼

//가맹점 위도와 경도 넣어주세요!!
let lat = '37.402056', //위도
	lon = '127.108212'; //경도

//가맹점명, 위도, 경도 입력
let link = 'https://map.kakao.com/link/to/' + storeName + ',' + lat + ',' + lon;

findRoadBtn.addEventListener('click', () => {
	window.open(link);
});