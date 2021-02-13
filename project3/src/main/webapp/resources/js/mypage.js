
	$(function(){
	  $('#memberModifyBtn').on('click',function(){
		  var form = $('#memberModify');
		  var email = form.find('#email').val().trim();
		  var tel = form.find('#tel').val().trim();
		  telreg = /^[0]{1}[0-9]{2}\d{4}\d{4}$/;
			if(!telreg.test(tel)){
				alert('연락처 형식이 올바르지 않습니다');
				return false;
			}
			mailreg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
			if(!mailreg.test(email)){
				alert('이메일 형식이 올바르지 않습니다');
				return false;
			}
		    document.memberModify.submit();
	  });	
		
	  $('#Mpwd').on('click',function(){
		  var form = $('#pwdModifyForm');
		  var cpwd = form.find('#currentpassword').val().trim();
		  var pwd = form.find('#password').val().trim();
		  var repwd = form.find('#repassword').val().trim();
		  if(cpwd == "" || cpwd == null){
			  alert('현재 비밀번호를 입력해주세요');
			  return false;
		  }else if(pwd == null || pwd == ""){
			  alert('변경할 비밀번호를 입력해주세요');
			  return false;
		  }else if(repwd == "" || repwd == null){
			  alert('변경할 비밀번호 확인란 입력해주세요');
			  return false;
		  }else if(pwd == "" || pwd != repwd){
			  alert('변경할 비밀번호가 맞지않습니다');
			  return false;
		  }
		  
		  passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*&_~]).{4,10}$/;
			if(!passreg.test(pwd)){
				alert('비밀번호 형식이 올바르지 않습니다')
				return false;
			}
		  
		  
		  
		  document.pwdModifyForm.submit();
		  
		  
	  });	
		
	  $('#fileInput').on('change',function(){
		 document.imgForm.submit();
	  });	
		
	  $("#fileInput").change(function(){
		  if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
	 			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
	
	 		// 추출한 파일명 삽입
			$("#userfile").val(filename);
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     	$("#profileImg img").attr("src", data.target.result).width(400);  
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
	  });
	 
	});
	function memberDelete(id){
		$.ajax({
			url:'/project3/member/delete',
			type:'post',
			data:{"id":id},
			success:function(res){
				alert('회원 탈퇴하였습니다');
				location.href="/project3/index";
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
		
	}
			
	
