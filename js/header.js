window.onload = function() {
  const toggleBtn = document.querySelector('.navbar_toggleBtn');
  const menu = document.querySelector('.navbar_menu');
  
  console.log(toggleBtn,menu);
  
  toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    console.log("메뉴 클릭");
  });
}
