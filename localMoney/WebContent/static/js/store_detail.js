
				// ------길찾기기능
				var findRoadBtn = document.getElementById('find_road'); //길찾기 버튼
	
				var storeName1 = "${listShop.shopName}";
				var storeAddress = "${listShop.shopAddress}";
				
				//가맹점 위도와 경도 넣어주세요!!
				var lat = '${listShop.shopLocationX}', //위도 
					lon = '${listShop.shopLocationY}'; //경도
	
				//가맹점명, 위도, 경도 입력
				var link = 'https://map.kakao.com/link/to/' + storeName1 + ',' + lat + ',' + lon;
	
				findRoadBtn.addEventListener('click', () => {
					window.open(link);
				});
				var shareBtn = document.getElementById('share_kakao');
				
				shareBtn.addEventListener('click', () => {
					shareKakao();
					console.log("공유 ");
				});
				
					function shareKakao() {
					
						// 사용할 앱의 JavaScript 키 설정
					
						Kakao.init('{키}');
						
						// 카카오링크 버튼 생성
						Kakao.Link.createDefaultButton({
							container: '#share_kakao', // 카카오공유버튼ID
							objectType: 'feed',
							content: {
								title: storeName,
								description: storeAddress,
								imageUrl: 'http://www.sisaweekly.com/news/photo/202004/31524_47677_5735.jpg',
								link: { //공유할 링크 넣어주세요. (가맹점 정보)
									mobileWebUrl: "https://map.kakao.com/link/to/" + storeName1 + ',' + lat + ',' + lon,
									webUrl: "https://map.kakao.com/link/to/" + storeName1 + ',' + lat + ',' + lon
								}
							}
							
						});
						}
					
