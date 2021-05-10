window.onload = function() {
    // 상단바
    const toggleBtn = document.querySelector('.navbar_toggleBtn');
    const navbarMenu = document.querySelector('.navbar_menu');
    
    toggleBtn.addEventListener('click', () => {
      navbarMenu.classList.toggle('active');
    });
  
    // 메뉴 화면
    const navFavorites = document.getElementById('nav_favorites');
    const navSearchHistory = document.getElementById('nav_search_history');
    const navStarReview = document.getElementById('nav_star_review');
    const navMyPage = document.getElementById('nav_my_page');
  
    const menuSec = document.getElementById('menu_sec');
    const searchSec = document.getElementById('search_sec');
  
    const favorites = document.getElementById('favorites');
    const searchHistory = document.getElementById('search_history');
    const starReview = document.getElementById('star_review');
    let menuArray = [0,0,0];
    
    console.log(menuSec);
  
    //즐겨찾기 버튼 클릭시
    navFavorites.addEventListener('click',()=>{
      if(menuArray[0] == 0){
        menuArray[0] = 1;
        favorites.classList.add('active');
        searchHistory.classList.remove('active');
        starReview.classList.remove('active');
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
  
    // 내 검색내역
    navSearchHistory.addEventListener('click',()=>{
      if(menuArray[1] == 0){
        menuArray[1] = 1;
        favorites.classList.remove('active');
        searchHistory.classList.add('active');
        starReview.classList.remove('active');
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
  
    // 내 별점 후기
    navStarReview.addEventListener('click',()=>{
      if(menuArray[2] == 0){
        menuArray[2] = 1;
        favorites.classList.remove('active');
        searchHistory.classList.remove('active');
        starReview.classList.add('active');
        if(menuArray[0] == 0 && menuArray[1] == 0){
          menuSec.classList.add('active');
          searchSec.classList.add('menu_active');
        }
        if(menuArray[0] == 1 || menuArray[1] == 1){
          menuArray[0] = 0;
          menuArray[1] = 0;
        }
      }else if(menuArray[2] == 1){
        menuArray[2] = 0;
        starReview.classList.remove('active');
        menuSec.classList.remove('active');
        searchSec.classList.remove('menu_active');
      }
      console.log(menuArray);
    });
  }