/**
 * 
 */

	$(function(){
			
			rdImg = Math.floor(Math.random() * 9) + 1;
		
	  		$('#passbtn').on('click', function(){
				
				$('#findPassForm').modal("show");
			});
	  		
	  		$('#IModal').on('click',function(){
	  			$('#IdModal').modal('show');
	  			
	  			$('#idFind').on('click',function(){
	  				$.ajax({
	  	  				url:'/doit/mainPage/MemberIdSearchAction.do',
	  	  				type:'post',
	  	  				data:$('#Idform').serializeArray(),
	  	  				success:function(res){
	  	  					if(res == null){
	  	  						alert("아이디가 존재하지않습니다.");	
	  	  					}else{
	  	  						resnumFull = res.length;
	  	  						resnum = resnumFull/2;
	  	  						res = res.substring(0,resnum);
	  	  						for(i=resnum;i<resnumFull;i++){
	  	  							res +="*";
	  	  						}
	  	  					}
	  	  				alert("아이디:"+res);	
	  	  				$('#IdModal').modal('hide');
	  	  				},
	  	  				error:function(req){
	  	  					alert('상태:'+req.status);
	  	  				},dataType:'json'
	  	  			});//ajax	
	  			});//idFind
	  			
	  			
	  		});//idFind
	  		
	  		
	  		$("#passFind").on("click",function(){
	  			
	  			$.ajax({
	  				
	  				url: "/project3/member/searchPwd",
	  				type : "post",
	  				data : $("#findPass").serializeArray(),
	  				success:function(res){
	  						alert(res);
		  				},
		  				error:function(req){
		  					alert('상태:'+req.status);
		  				},
		  				dataType:'text'
	  			});
	  			
	  		});
	  		
	  		
	  		$("#IdModal").on("hide.bs.modal", function() {
	  			$("#IdModal input:text").val("");
			});
	  		
	  		
	  		$("#findPassForm").on("hide.bs.modal", function() {
	  			
	  			$("#findPassForm input:text").val("");
	  			
	  		});
	  		
	  		$("#mainCard .bg-login-image").css("background-image", "url(/doit/assets/img/dogs/image"+ rdImg +".jpg)");
	  		
	  	});