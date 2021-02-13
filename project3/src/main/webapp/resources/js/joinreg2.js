//정규식
// id 정규식 체크
$('#mid').on('keyup',function(){
	idval = $('#mid').val().trim();
	idreg = /^[a-z][a-z0-9]{3,11}$/;
	if(idreg.test(idval)){
		$('#idchk').prop('disabled',false);
		var result = "양식에 맞는 아이디입니다";
		regpass(this,result);
		member.id=null;
	}else{
		var result = "아이디는 영어,숫자포함  3~11자까지 입니다";
		$('#idchk').prop('disabled',true);
		regfail(this,result);
		member.id=null;
	}	
});

// 비밀번호 정규식 비교
$('#mpassword').on('keyup',function(){
	passval = $('#mpassword').val().trim();
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*&_~]).{4,10}$/;
	if(passreg.test(passval)){
		var result = "양식에 맞는 비밀번호 입니다";
		regpass(this,result);
	}else{
		var result = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하여 입력해주세요";
		regfail(this,result);
		member.pass=null;
	}
});
// password 맞는지 확인
$('#pwdchk').on('keyup',function(){
	passChk = $('#pwdchk').val();
	if(passval==passChk){
		var result = "비밀번호가 맞습니다";
		regpass(this,result);
		member.pass = passChk;
	}else{
		var result = "비밀번호가 맞지않습니다";
		regfail(this,result);
		member.pass = null;
	}
});

// 이름 정규식 비교 (한글 2~5글자)
$('#mname').on('keyup',function(){
	nameval = $(this).val().trim();
	namereg = /^[가-힣]{2,5}$/;
	if(namereg.test(nameval)){
		var result = "양식에 맞는 이름입니다";
		regpass(this,result);
		member.name = nameval;
	}else{
		var result = "올바른 이름을 입력해주세요";
		regfail(this,result);
		member.name = null;
	}
});


 //전화번호
 $('#tel').on('keyup',function(){
		telval = $(this).val().trim();
		telreg = /^[0]{1}[0-9]{2}\d{4}\d{4}$/;
		if(telreg.test(telval)){
			var result = "양식에 맞는 핸드폰번호입니다";
			regpass(this,result);
			$('#btntelchk').prop('disabled',false);
		}else{
			var result = "-없이 핸드폰번호를 입력해주세요";
			regfail(this,result);
		}	 
 }); 
 
//이메일 정규식
 $('#modalmail').on('keyup',function(){
	mailval = $(this).val().trim();
	mailreg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	if(mailreg.test(mailval)){
		var result = "양식에 맞는 이메일입니다";
		regpass(this,result);
		$('#btnmailchk').prop('disabled',false);
	}else{
		var result = "이메일형식에 맞게 입력해주세요";
		regfail(this,result);
		member.mail = null;
	}
 });
 
//실패시
function regfail(target,result){
	$(target).parents('.form-group').find('.msg').text('');
//	$('<img>',{
//		"src" : "/project3/resources/images/fail.jpg",
//		"alt" : "입력양식을 다시 확인해주세요",
//		"width" : "30px",
//		"height" : "30px"		
//	}).appendTo($(target).parents('.form-group').find('.msg'));	
	$(target).parents('.form-group').find('.msg').append(result).css('color','red');	
};

//성공시
function regpass(target,result){
	$(target).parents('.form-group').find('.msg').text('');
//	$('<img>',{
//		"src" : "/project3/resources/images/check.jpg",
//		"alt" : "올바른 입력양식입니다.",
//		"width" : "30px",
//		"height" : "30px"
//	}).appendTo($(target).parents('.form-group').find('.msg'));
	$(target).parents('.form-group').find('.msg').append(result).css('color','green');
	
};

























