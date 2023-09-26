// 유효성 검사 객체
const checkObj = {
    "inputId" : false, // 아이디
    "inputPw" : false, // 비밀번호
    "inputPwConfirm" : false, // 비번확인
    "inputNickname" : false
}

document.getElementById("check").addEventListener("click", function() {
            // 아이디 중복 확인을 위해 새로고침하여 서버로 요청 보냄
            window.location.href = "${pageContext.request.contextPath}/signup?inputId=" + document.getElementById("userId").value;
        });

document.getElementById("inputId").addEventListener("change", function() {

    const regExp = /^[a-z][\w-_]{5,13}$/;
                // 소문자시작(1) + 나머지(5~13) = 6~14글자

    if(regExp.test(this.value)) {
        this.style.backgroundColor = "springgreen";
        this.style.color = "black";
        checkObj.inputId = true;
    } else {
        this.style.backgroundColor = "red";
        this.style.color = "white";
        checkObj.inputId = false;
    }


});

const inputPw = document.getElementById("inputPw");
const inputPwConfirm = document.getElementById("inputPwConfirm");

inputPwConfirm.addEventListener("keyup", function() {

    if(inputPw.value.length == 0) {
        this.value = "";
        alert("비밀번호를 입력해주세요");
        inputPw.focus();
        checkObj.inputPw = false;
    }
});

const pwMessage = document.getElementById("pwMessage");

inputPw.addEventListener("keyup", function() {

    if( (inputPw.value == inputPwConfirm.value) && inputPw.value.length != 0 ) {
        pwMessage.innerText = "비밀번호 일치";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        checkObj.inputPw = true;
        checkObj.inputPwConfirm = true;
    }else {
        pwMessage.innerText="비밀번호 불일치";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.inputPwConfirm = false;
    }
});

inputPwConfirm.addEventListener("keyup", function() {
    if( (inputPw.value == inputPwConfirm.value) && inputPw.value.length != 0 ) {
        pwMessage.innerText = "비밀번호 일치";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        checkObj.inputPw = true;
        checkObj.inputPwConfirm = true;
    }else {
        pwMessage.innerText="비밀번호 불일치";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.inputPwConfirm = false;
    }
});


function validate() {

    for(let key in checkObj) {
        if( !checkObj[key] ) {
            return false;
        }
    }

    alert("회원가입 완료");
    return true;

}