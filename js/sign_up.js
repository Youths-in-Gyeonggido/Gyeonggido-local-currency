/* 변수 선언*/
const id = document.querySelector('#id');
const pw1 = document.querySelector('#pswd1');
const pw2 = document.querySelector('#pswd2');
const userName = document.querySelector('#name');
const email = document.querySelector('#email');
const pwMsg1 = document.querySelector('#alertTxt');
const pwImg1 = document.querySelector('#pswd1_img1');
const pwImg2 = document.querySelector('#pswd2_img1');
//const pwMsgArea = document.querySelector('.int_pass');
const error = document.querySelectorAll('.error_next_box');



/*이벤트 핸들러 연결*/
id.addEventListener("focusout", checkId);
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
email.addEventListener("focusout", isEmailCorrect);






/*콜백 함수*/

//아이디 체크
function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/; //5자 이상 20자 이하
    if(id.value === "") { //아무것도 입력안하면
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)) { //조건에 맞지 않으면 false
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.color = "red";
        error[0].style.display = "block";
    } else {
        error[0].innerHTML = "사용가능한 아이디입니다!";
        error[0].style.color = "#3498db";
        error[0].style.display = "block";
    }
}

//비밀번호 체크
function checkPw() {
    const pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg1.innerHTML = "사용불가";
        error[1].style.color = "red";
        error[1].style.display = "block";
        pwMsg1.style.color = "red";
        pwMsg1.style.display = "block";
        pwImg1.src = "../img/m_icon_not_use.png";
    } else {
        error[1].style.display = "none";
        pwMsg1.innerHTML = "안전";
        pwMsg1.style.display = "block";
        pwMsg1.style.color = "#3498db";
        pwImg1.src = "../img/m_icon_safe.png";
    }
}
//비밀번호 확인 체크
function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "../img/m_icon_check_enable.png";
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "../img/m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}
//닉네임 체크
function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.color = "red";
        error[3].style.display = "block";
    } else {
        error[3].innerHTML = "사용가능한 닉네임입니다!";
        error[3].style.color = "#3498db";
        error[3].style.display = "block";
    }
}



//이메일 체크
function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[4].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[4].style.display = "block";
    } else {
        error[4].style.display = "none"; 
    }

}
