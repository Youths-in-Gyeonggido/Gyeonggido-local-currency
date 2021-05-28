const shareBtn = document.getElementById('share_kakao');

console.log(shareBtn);
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
			imageUrl:'http://www.sisaweekly.com/news/photo/202004/31524_47677_5735.jpg',
			link: { //공유할 링크 넣어주세요. (가맹점 정보)
				mobileWebUrl: "http://localhost:8003/Gyeonggi-youths/html/store_detail.html",
				webUrl: "http://localhost:8003/Gyeonggi-youths/html/store_detail.html"
			}
		}
	});
}