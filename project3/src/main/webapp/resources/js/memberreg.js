/**
 * 
 */
//id정규식 체크 정규식.test(value)

$(function(){	
//패스워드 정규식 체크 = 영문소문자,대문자,특수문자,숫자가 반드시 하나이상씩 입력 
$('#pass').on('keyup',function(){
	passval = $(this).val().trim();
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*_~]).{4,10}$/;
	
	if(!(passreg.test(passval))){
		regfail(this,"올바른 형식이 아닙니다");
		return;
	}else{
		regpass(this);
		
	}
	
	
	
})//pass	
$('#repass').on('keyup',function(){
	if(!($('#repass').val().trim()== passval)){
		regfail(this,"비밀번호가 맞지않습니다");
		return;
	}else{
		regpass(this);
	}
		
	
	
	
})//repass	
//전화번호 /\d{3}-\d{4}-\d{4}/
//email 
//생년월일 - 10살 이상
	
//우편번호 검색
$('#btnzip').on('click',function(){
	window.open("zip.html","우편번호찾기","width=500 height=400");
	
	
})//btnzip
	
	
$('#id').on('keyup',function(){
	idval = $('#id').val().trim();
	
	regid = /^[a-z][a-zA-Z0-9]{3,11}$/;
	if(!(regid.test(idval))){
		regfail(this,"올바른형식이아닙니다");
		return false;
	}else{
		$(this).parents('.form-group').find('.msg').html('');
	}
	
})//id

//이름 정규식 체크-한글 2~5
$('#name').on('keyup',function(){
	nameval = $(this).val().trim();
	regname = /^[가-힣]{2,5}$/;
	if(!(regname.test(nameval))){
		regfail(this,"올바른 형식이아닙니다");
		return false;
	}else{
		regpass(this);
	}
	
	
})//name

/////////////////////////////////////////////////
//정규식 통과 메서드

function regpass(target){
	sp = $(target).parents('.form-group').find('.sp');
	$(sp).empty();
	
	//체크 이미지 출력
	$('<img>',{
		'src':'/jqpro/images/ck.png',
		'width':'20px',
		'height':'20px'
	}).appendTo(sp);
	//img
	//실패 메시지 지우기
	$(target).parents('.form-group').find('.msg').html('');
	
}
//정규식 실패 메서드
function regfail(target,text){
	sp = $(target).parents('.form-group').find('.sp');
	$(sp).empty();
	
	$(target).parents('.form-group').find('.msg').html(text).css('color','red');
	return false;
}
//////////////////////////////////////////////////
})