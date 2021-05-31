window.onload = function() {
  // 상단바
  const toggleBtn = document.querySelector('.navbar_toggleBtn');
  const navbarMenu = document.querySelector('.navbar_menu');
  const navbar=document.querySelector('.navbar');
  
  //사용자 프로필
  const userBtn=document.querySelector('.wrap_user');
  const userMenu=document.querySelector('.user_menu');
  const userArea=document.querySelector('.user_area');
  const logoutBtn = document.querySelector('.btn_log_out');

  // 메뉴 화면
  const navFavorites = document.getElementById('nav_favorites');
  const navSearchHistory = document.getElementById('nav_search_history');

  const menuSec = document.getElementById('menu_sec');
  const searchSec = document.getElementById('search_sec');

  const favorites = document.getElementById('favorites');
  const searchHistory = document.getElementById('search_history');

  //즐겨찾기 모달 변수 
  const favBtn = document.querySelector('.btn_store_fav');
  const modal = document.querySelector('.modal');
  const overlay = document.querySelector('.overlay');
  const closeBtn = document.querySelector('.btn_close');
  const ansNo = document.querySelector('.ans_no');

  //로그아웃 모달 변수
  const outModal=document.querySelector('.out_modal');

  let menuArray = [0,0];
  
  toggleBtn.addEventListener('click', () => {
    navbarMenu.classList.toggle('active');
    navbar.classList.toggle('active');
    userArea.classList.toggle('active');
    
  });

  userBtn.addEventListener('click',()=>{
    userMenu.classList.toggle('active');
  })

  //즐겨찾기 버튼 클릭시
  navFavorites.addEventListener('click',()=>{
    //즐겨찾기 화면이 열려있지 않으면 active상태로 변경
    if(menuArray[0] == 0){
      if(menuArray[1] == 1){
        menuArray[1] = 0;
        searchHistory.classList.remove('active');
      }
      menuArray[0] = 1;
      favorites.classList.add('active');
      menuSec.classList.add('active');
      searchSec.classList.add('menu_active');
    //즐겨찾기 화면이 acive상태라면 닫기(active제거)
    }else if(menuArray[0] == 1){
      menuArray[0] = 0;
      favorites.classList.remove('active');
      menuSec.classList.remove('active');
      searchSec.classList.remove('menu_active');
    }
  });

  // 내 검색내역
  navSearchHistory.addEventListener('click',()=>{
    //내 검색내역 화면이 열려있지 않으면 active상태로 변경
    if(menuArray[1] == 0){
      if(menuArray[0] == 1){
        menuArray[0] = 0;
        favorites.classList.remove('active');
      }
      menuArray[1] = 1;
      searchHistory.classList.add('active');
      menuSec.classList.add('active');
      searchSec.classList.add('menu_active');
    //내 검색내역 화면이 acive상태라면 닫기(active제거)
    }else if(menuArray[1] == 1){
      menuArray[1] = 0;
      searchHistory.classList.remove('active');
      menuSec.classList.remove('active');
      searchSec.classList.remove('menu_active');
    }
  });

  //즐겨찾기 해제 모달
  favBtn.addEventListener('click',()=>{
    modal.classList.add('active');
    overlay.classList.add('active');
  })
  closeBtn.addEventListener('click',()=>{
    modal.classList.remove('active');
    overlay.classList.remove('active');
  })
  overlay.addEventListener('click',()=>{
    modal.classList.remove('active');
    overlay.classList.remove('active');
  })
  ansNo.addEventListener('click',()=>{
    modal.classList.remove('active');
    overlay.classList.remove('active');
  })

  //로그아웃 해제 모달
  logoutBtn.addEventListener('click',()=>{
    outModal.classList.add('active');
    overlay.classList.add('active');
    userMenu.classList.remove('active');
  })
  closeBtn.addEventListener('click',()=>{
    outModal.classList.remove('active');
    overlay.classList.remove('active');
  })
  overlay.addEventListener('click',()=>{
    outModal.classList.remove('active');
    overlay.classList.remove('active');
  })
  ansNo.addEventListener('click',()=>{
    outModal.classList.remove('active');
    overlay.classList.remove('active');
  })

}