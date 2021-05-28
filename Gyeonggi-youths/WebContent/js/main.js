console.log("main2.js");

const loading_image = document.querySelector('.loading-image');
const search_button = document.querySelector('.search_button');

search_button.addEventListener('click',()=> {
	loading_image.classList.toggle('active');
});