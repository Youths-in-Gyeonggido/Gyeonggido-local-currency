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
    const navStarReview = document.getElementById('nav_star_review');
    const navMyPage = document.getElementById('nav_my_page');
  
    const menuSec = document.getElementById('menu_sec');
    const searchSec = document.getElementById('search_sec');
  
    const favorites = document.getElementById('favorites');
    const searchHistory = document.getElementById('search_history');

    //즐겨찾기 모달 변수 
    const favBtn = document.querySelector('.btn_store_fav');
    const modal=document.querySelector('.modal');
    const overlay=document.querySelector('.overlay');
    const closeBtn=document.querySelector('.btn_close');
    const ansNo=document.querySelector('.ans_no');

    //로그아웃 모달 변수
    const outModal=document.querySelector('.out_modal');


    let menuArray = [0,0];
    
    console.log(menuSec);

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
      if(menuArray[0] == 0){
        menuArray[0] = 1;
        favorites.classList.add('active');
        searchHistory.classList.remove('active');
        if(menuArray[1] == 0 && menuArray[2] == 0){
          menuSec.classList.add('active');
          searchSec.classList.add('menu_active');
        }
        if(menuArray[1] == 1 || menuArray[2] == 1){
          menuArray[1] = 0;
          menuArray[2] = 0;
        }
      }else if(menuArray[0] == 1){
        menuArray[0] = 0;
        favorites.classList.remove('active');
        menuSec.classList.remove('active');
        searchSec.classList.remove('menu_active');
      }
      console.log(menuArray);
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

  
    // 내 검색내역
    navSearchHistory.addEventListener('click',()=>{
      if(menuArray[1] == 0){
        menuArray[1] = 1;
        favorites.classList.remove('active');
        searchHistory.classList.add('active');
        if(menuArray[0] == 0 && menuArray[2] == 0){
          menuSec.classList.add('active');
          searchSec.classList.add('menu_active');
        }
        if(menuArray[0] == 1 || menuArray[2] == 1){
          menuArray[0] = 0;
          menuArray[2] = 0;
        }
      }else if(menuArray[1] == 1){
        menuArray[1] = 0;
        searchHistory.classList.remove('active');
        menuSec.classList.remove('active');
        searchSec.classList.remove('menu_active');
      }
      console.log(menuArray);
    });
  }