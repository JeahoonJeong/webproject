// 내용의 값의 빈공백을 trim(앞/뒤)
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};


function sendIt() {
	
	f = document.myForm;
	
	str = f.userId.value;
	str = str.trim();
    if(!str) {
        alert("\n아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }
	f.userId.value = str;
	
	str = f.userPw.value;
	str = str.trim();
    if(!str) {
        alert("\n비밀번호를 입력하세요. ");
        f.userPw.focus();
        return;
    }
	f.userPw.value = str;
	
}