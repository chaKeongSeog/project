member = {};
//회원가입 버튼 클릭
$('#joinBtn2').on('click',function(){
	var check = $('#msgid').text();
	if(check == ""){
		alert('중복 체크는 필수입니다')
		return false;
	}
	if(check == 'fail'){
		alert('아이디가 이미 존재합니다')
		return false;
	}
	//아이디 정규식
	var id = $('#mid2').val().trim();
	idreg = /^[a-z][a-z0-9]{3,11}$/;
	if(id == "" || id == null){
		alert('아이디를 입력해주세요');
		return false;
	}else if(!idreg.test(id)){
		alert('아이디는 영어,숫자포함  3~11자까지 입니다');
		return false;
	}
	//비밀번호 정규식
	var pass = $('#mpassword2').val().trim();
	if(pass == "" || pass == null){
		alert('비밀번호를 입력해주세요');
		return false;
	}
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*&_~]).{4,10}$/;
	if(!passreg.test(passval)){
		alert('비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하여 입력해주세요');
		return false;
	}

	var repass = $('#pwdchk2').val().trim();
	if(repass == "" || repass == null){
		alert('비밀번호 확인을 입력해주세요');
		return false;
	}
	if(pass != repass){
		alert('비밀번호가 맞지않습니다');
		return false;
	}
	//이름 정규식
	var name = $('#mname2').val().trim();
	if(name == "" || name == null){
		alert('이름을 입력해주세요');
		return false;
	}
	namereg = /^[가-힣]{2,5}$/;
	if(!namereg.test(name)){
		alert('올바른 이름을 입력해주세요');
	}
	
	//핸드폰 정규식
	var tel = $('#tel2').val().trim();
	if(tel == "" || tel == null){
		alert('핸드폰번호를 입력해주세요');
		return false;
	}
	telreg = /^[0]{1}[0-9]{2}\d{4}\d{4}$/;
	if(!telreg.test(tel)){
		alert('올바른 핸드폰 번호를 입력해주세요');
		return false;
	}
	
	var mail = $('#modalmail2').val().trim();
	if(mail == "" || mail == null){
		alert('이메일을 입력해주세요');
		return false;
	}
	mailreg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	if(!mailreg.test(mail)){
		alert('이메일 형식에 맞게 입력해주세요');
		return false;
	}
	
	if(check == 'success'){
		var form = $('#memberForm');
		form.submit();
	}
});


// id 중복체크
$('#idchk2').on('click',function(){
	 userId = $('#mid2').val();
	 if (userId!=""){
		 $.ajax({
			url : "/project3/member/idCheck", 
			type: "post",
			data : {"id" : userId},
			success : function(res){				
				if(res != ""){
					alert('이미 아이디가 존재합니다');
					$('#msgid').empty();
					$('#msgid').html('fail').css('display','none');
				}else{
					alert('해당 아이디는 사용 가능합니다')
					$('#msgid').empty();
					$('#msgid').append('success').css('display','none');
				}
				
				return false;
			},
			error : function(req){
				alert('상태 : ' + req.status);
			} 			 
		 });
	 }else{
		 alert("ID값을 입력하세요.");
		 return false;
	 }					 
});

























member = {};
//회원가입 버튼 클릭
$('#joinBtn').on('click',function(){
	var check = $('#msgid').text();
	if(check == ""){
		alert('중복 체크는 필수입니다')
		return false;
	}
	if(check == 'fail'){
		alert('아이디가 이미 존재합니다')
		return false;
	}
	//아이디 정규식
	var id = $('#mid').val().trim();
	idreg = /^[a-z][a-z0-9]{3,11}$/;
	if(id == "" || id == null){
		alert('아이디를 입력해주세요');
		return false;
	}else if(!idreg.test(id)){
		alert('아이디는 영어,숫자포함  3~11자까지 입니다');
		return false;
	}
	//비밀번호 정규식
	var pass = $('#mpassword').val().trim();
	if(pass == "" || pass == null){
		alert('비밀번호를 입력해주세요');
		return false;
	}
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*&_~]).{4,10}$/;
	if(!passreg.test(passval)){
		alert('비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하여 입력해주세요');
		return false;
	}

	var repass = $('#pwdchk').val().trim();
	if(repass == "" || repass == null){
		alert('비밀번호 확인을 입력해주세요');
		return false;
	}
	if(pass != repass){
		alert('비밀번호가 맞지않습니다');
		return false;
	}
	//이름 정규식
	var name = $('#mname').val().trim();
	if(name == "" || name == null){
		alert('이름을 입력해주세요');
		return false;
	}
	namereg = /^[가-힣]{2,5}$/;
	if(!namereg.test(name)){
		alert('올바른 이름을 입력해주세요');
	}
	
	//핸드폰 정규식
	var tel = $('#tel').val().trim();
	if(tel == "" || tel == null){
		alert('핸드폰번호를 입력해주세요');
		return false;
	}
	telreg = /^[0]{1}[0-9]{2}\d{4}\d{4}$/;
	if(!telreg.test(tel)){
		alert('올바른 핸드폰 번호를 입력해주세요');
		return false;
	}
	
	var mail = $('#modalmail').val().trim();
	if(mail == "" || mail == null){
		alert('이메일을 입력해주세요');
		return false;
	}
	mailreg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	if(!mailreg.test(mail)){
		alert('이메일 형식에 맞게 입력해주세요');
		return false;
	}
	
	if(check == 'success'){
		var form = $('#memberForm');
		form.submit();
	}
});


//인증 코드 보내기	
$('#btnmailchk').on('click',function(){
	$('.codecls').css('display','block');
	userMail = $('#modalmail').val().trim();
	userName = $('#mname').val().trim();
	$('#mailcode').css('display','block');
	$('#btnchkcode').css('display','inline');
	$.ajax({
		url : "/doit/mainpage/mailchk.do",
		type : "get",
		data : {"mail" : userMail, "name" : userName},
		dataType : 'text',
		success : function(res){
			alert('인증 코드를 전송하였습니다.');
			member.mailcode = res;
		},
		error : function(req){
			alert('상태 : ' + req.status);	
		}  					  				
	}); 				
});

//이메일 인증하기 
$('#btnchkcode').on('click',function(){	
	code = $('#mailcode').val().trim();
	if(code==member.mailcode){
		alert('인증 되었습니다.');
		member.mail="ok";
		$('#btnmailchk').attr('disabled','disabled');
		$('#mailcode').attr('readonly',true);
		$('#btnchkcode').css('display','none');
	}else{
		alert('메일 주소를 확인해 주세요.');		
	} 				
});
	
//id 중복체크
$('#idchk').on('click',function(){
	 userId = $('#mid').val();
	 if (userId!=""){
		 $.ajax({
			url : "/project3/member/idCheck", 
			type: "post",
			data : {"id" : userId},
			success : function(res){				
				if(res != ""){
					alert('이미 아이디가 존재합니다');
					$('#msgid').empty();
					$('#msgid').html('fail').css('display','none');
				}else{
					alert('해당 아이디는 사용 가능합니다')
					$('#msgid').empty();
					$('#msgid').append('success').css('display','none');
				}
				
				return false;
			},
			error : function(req){
				alert('상태 : ' + req.status);
			} 			 
		 });
	 }else{
		 alert("ID값을 입력하세요.");
		 return false;
	 }					 
});







 

 

