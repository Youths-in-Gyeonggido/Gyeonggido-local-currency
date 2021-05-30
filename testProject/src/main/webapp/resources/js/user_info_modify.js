/* 변수 선언*/
const pw1 = document.querySelector('#pswd1');
const pw2 = document.querySelector('#pswd2');
const userName = document.querySelector('#name');
const email = document.querySelector('#email');
const pwMsg = document.querySelector('#alertTxt');
const pwImg1 = document.querySelector('#pswd1_img1');
const pwImg2 = document.querySelector('#pswd2_img1');
const pwMsgArea = document.querySelector('.int_pass');
const error = document.querySelectorAll('.error_next_box');



/*이벤트 핸들러 연결*/
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
email.addEventListener("focusout", isEmailCorrect);






/*콜백 함수*/

//비밀번호 체크
function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        pwMsg.style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        error[0].style.color = "red";
        error[0].style.display = "block";
        pwMsg.style.color = "red";
        pwMsg.style.display = "block";
        pwImg1.src = "/resources/img/m_icon_not_use.png";
    } else {
        error[0].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#3498db";
        pwImg1.src = "resources/img/m_icon_safe.png";
    }
}
//비밀번호 확인 체크
function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "resources/img/m_icon_check_enable.png";
        error[1].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "resources/img/m_icon_check_disable.png";
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
    } 

    if(pw2.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    }
}
//닉네임 체크
function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[2].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[2].style.color = "red";
        error[2].style.display = "block";
    } else {
        error[2].innerHTML = "사용가능한 닉네임입니다!";
        error[2].style.color = "#3498db";
        error[2].style.display = "block";
    }
}



//이메일 체크
function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[3].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none"; 
    }

}