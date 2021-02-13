$(function(){	
	var index = 0;
	//그룹 인증 게시판 글수정
	$('#grBoardModify').on('click',function(){
		var form = $('#grBoardModifyForm');
		var title = form.find('#grBoardTitle').val();
		var content = form.find('#grBoardModifyContent').val();
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length >25){
			alert('제목은 25자 이하입니다');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
        var data = new FormData(form[0]);
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/project3/group/grBoardModify",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (res) {
            	$('#grBoardModifyModal').find('#grBoardModifyForm #grBoardTitle').val('');
            	$('#grBoardModifyModal').find('#grBoardModifyForm #grBoardModifyContent').val('');
            	var page = $('#grBoardModifyModal').find('#grBoardModifyForm #curPage').val();
            	var gno = $('#grBoardModifyModal').find('#grBoardModifyForm #gno').val();
            	var search_option = $('#search_option').val();
            	var keyword = $('#keyword').val();
            	$('#grBoardModifyForm').find('#ganoArea').html('');
            	$('#grBoardModifyModal').modal('hide');
            	
            	groupBoardList(page,gno,search_option,keyword)
            },error: function(req) {
               alert('상태:'+req.status);
            }
        });
	});
	//그룹방 인증게시판 글수정 첨부파일 삭제
	$(this).on('click','#attachFileCancel',function(){
		var gano = $(this).attr('idx');
		$('#grBoardModifyForm #ganoArea').append('<input type="hidden" name="gano" id="gano" value="'+gano+'"/>');
		$(this).parent().remove();
		
	});
	//그룹방 인증게시판 글수정 파일추가
	$('#modifyAddFile').on('click',function(){
		index++;
		code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
		$('#mofidyAttachArea').append(code);
	});
	//그룹방 인증게시판 글수정 파일삭제
	$('#modifyDeleteFile').on('click',function(){
		var file = $('#mofidyAttachArea #inputRow');
		for(var i= 0;i<file.length;i++){
			var last = parseInt(file.length-1);
			file[last].remove();
		}
	});
	//그룹방 인증게시판 글쓰기 파일추가
	$('#addFile').on('click',function(){
		index++;
		code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
		$('#fdsArea').append(code);
	});
	//그룹방 인증게시판 글쓰기 파일삭제
	$('#deleteFile').on('click',function(){
		var file = $('#fdsArea #inputRow');
		for(var i= 0;i<file.length;i++){
			var last = parseInt(file.length-1);
			file[last].remove();
		}
	});
	//인증 게시판 글쓰기 파일 추가시 용량 제한
	$(this).on('change','#fileName',function(){
		if(this.files[0].size>1024 * 1024 * 10){
	  		alert('파일 사이즈가 10MB 초과하였습니다');
	  		$(this).val('');
	  		return false;
	  	}	
	});
	//to do List 글쓰기
	$('#todoListWriteBtn').on('click',function(){
		var form = $('#todoListWriteForm');
		var gno = form.find('#gno').val();
		var id = form.find('#id').val();
		var title = form.find('#title').val();
		var content = form.find('#content').val();
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(title.length > 25){
			alert('글자는 25자 이하로 입력해주세요');
			return false;
		}
		$.ajax({
			url:'/project3/group/todoListWrite',
			type:'post',
			data:{"gno":gno,
				"title":title,
				"content":content,
				"id":id},
			success:function(res){
				form.find('#title').val('');
				form.find('#content').val('');
				GroupInfoCard(gno);
				//인증 게시판 수정 모달
				$('#todoListWrite').modal('hide');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
			
		});
	});
	//인증 게시판 검색하기
	$(this).on('click','#groupSearchBtn',function(){
		var search_option = $(this).parents('#GroupBoardSearchForm').find('#search_option').val();
		var keyword = $(this).parents('#GroupBoardSearchForm').find('#keyword').val();
		var gno = $(this).parents('#GroupBoardSearchForm').find('#gno').val();
		groupBoardList(1,gno,search_option,keyword);
		
		
	});

	//인증게시판 글쓰기 모달
	$('#vertify').on('click',function(){
		$('#grBoardTitle').val('');
		$('#grBoardContent').val('');
		var file = $('#fdsArea #inputRow');
		for(var i= 0;i<file.length;i++){
			file[i].remove();
		}
		$('#grBoardModal').modal('show');
		
	});
	//인증 게시판 글쓰기
	$('#grBoardWrite').on('click',function(){
		var form = $('#grBoardForm');
		var user = $('#grBoardForm').find('#id').val();
		var gno = $('#grBoardForm').find('#gno').val();
		var result = GroupBoardOneWriteCheck(user,gno);
		if(result == 'N'){
			alert('인증글은 하루에 한번 입력 가능합니다');
			return false;
		}
		var title = form.find('#grBoardTitle').val();
		var content = form.find('#grBoardContent').val();
		var gno = form.find('#gno').val();
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
        var data = new FormData(form[0]);
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/project3/group/grBoardWrite",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (res) {
            	$('#grBoardModal').find('#grBoardForm #title').val('');
            	$('#grBoardModal').find('#grBoardForm #content').val('');
            	$('#grBoardModal').modal('hide');
//            	getGroupBoardList(gno);
            	groupBoardList(1, gno,search_option,keyword);
            	
//            	groupBoardList(page, gno, search_option, keyword)
            },error: function(req) {
               alert('상태:'+req.status);
            }
        });
		
	});
	
	//그룹 리스트 페이지 이동
	$('#groupList').on('click',function(){
		var form = $(this).find('#groupListForm');
		var id = form.find('#id').val();
		form.submit();
	});
	//스터디룸 생성 모달 보여주기
	$('#studyroomCreateModal').on('click',function(){
		//스터디룸 3개 이상은 생성안됨
		var id = $(this).attr('val');
		studyroomCheck(id);
	});
	//스터디룸 참여 모달 보여주기
	$('#studyroomJoinModal').on('click',function(){
		$('#studyroomJoin').modal('show');
	});
	//스터디룸 입장
	$(this).on('click','#stRoomList',function(){
		var form = $(this).parents('#form2');
		var gno = $(this).parents('#form2').find('#gno').val();
		form.submit();
	});
	//스터디룸 참여
	$('#studyjoin').on('click',function(){
		var form = $('#studyRoomMemberForm');
		var id = form.find('#id').val();
		var code = form.find('#code').val();
		joinStRoom(id,code);
	});
	
	//스터디룸 생성
	$('#studycreate').on('click',function(){
		$('#studycreate').attr('disabled',false);
		var form = $('#studyRoomForm');
		var id = form.find('#id').val();
		var name = form.find('#name2').val();
//		if(name.length > 13 ){
//			alert('스터디룸은 12글자 이하입니다');
//			return false;
//		}
		var goal = form.find('#goal').val();
		insertStRoom(id,name,goal);
	});
	//그룹방 드라이브공유 파일첨부
	  $("#fileInput").change(function(){
		    if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
	 			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
		  	if(this.files[0].size>1024 * 1024 * 10){
		  		alert('파일 사이즈가 10MB 초과하였습니다');
		  		$(this).val('');
		  		return false;
		  	}
	 		// 추출한 파일명 삽입
			$("#userfile").val(filename);
			$('#btnupload').prop('disabled',false);
			$('#btndelete').prop('disabled',false);
//		   if(this.files && this.files[0]) {
//		    var reader = new FileReader;
//		    reader.onload = function(data) {
//		     	  
//		    }
//		    reader.readAsDataURL(this.files[0]);
//		   }
	  });
	
});//$(function({}))

function joinStRoom(id,code){
	$.ajax({
		url:'/project3/group/insertStRoomMember',
		type:'post',
		data:{"id":id,
			"code":code}
		,success:function(res){
			alert(res.result);
			$('#studyroomJoin').modal('hide');
			$('#studyroomJoin').find('#code').val('');
			GroupListGo();
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
function insertStRoom(id,name,goal){
	$.ajax({
		url:'/project3/group/insertStRoom',
		type:'post',
		data:{"id":id,
			"name":name,
			"goal":goal}
		,success:function(res){
			if(res.gmno == 1){
				alert('스터디룸이 생성되었습니다');
				
			}else{
				alert('생성을 실패하였습니다');
			}
			$('#studyRoomCreate').modal('hide');
			$('#studyRoomCreate').find('#name').val('');
			$('#studyRoomCreate').find('#goal').val('');
			//그룹 목록으로 가기
			GroupListGo();
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
//인증 게시판 하루에 한번쓸수있는데 썻는지 여부 확인
function GroupBoardOneWriteCheck(id,gno){
	var result = "";
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
	var today2 = (year + '-' + month + '-' + day);
	$.ajax({
		url:'/project3/group/GroupBoardOneWriteCheck',
		type:'post',
		async: false,
		data:{"id":id,
			"today":today2,
			"gno":gno}
		,success:function(res){
			result = res.result;
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
	
	return result;
}
function GroupListGo(){
	var form = $('#groupListForm');
	form.submit();
}
//스터디룸 3개 넘는지 체크
function studyroomCheck(id){
	$.ajax({
		url:'/project3/group/groupCountCheck',
		type:'post',
		data:{"id":id}
		,success:function(res){
			if(res.count >=3){
				alert('더이상 스터디룸을 생성할수없습니다');
				return false;
			}
			$('#studyRoomCreate').modal('show');
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
//스터디그룹 들어가기
function groupJoin(t){
	var form = $(t).find('#groupDetailForm');
	var gno = $(t).find('#gno').val();
	form.submit();
	
}
// 성공 시 결과 테이블 만들기
function makeResultList(res) {
	var list = res.map.list;
	var attach = res.map.attach;
	var search_option = res.map.search_option;
	var keyword = res.map.keyword;
	var pager = res.map.pager;
	var gno = res.map.gno;
	var code = "";
	code   += '<div class="form-row">'
	code += '<div class="col">'
	code += '<div class="form-group">'
	code += '<form method="get" action="/project3/group/getGroupBoardList" onsubmit="return false" class="form-inline mt-3" id="GroupBoardSearchForm">';
	code += '<input type="hidden" name="gno" id="gno" value="'+gno+'">'
	code += '<select name="search_option" class="form-control mx-1 mt-2" id="search_option">';		
	if(search_option == 'all'){
		code += '<option value="all" selected>전체</option>'
		code += '<option value="title">제목</option>'
		code += '<option value="content">내용</option>'
	}else if(search_option == 'title'){
		code += '<option value="all">전체</option>'
		code += '<option value="title" selected>제목</option>'
		code += '<option value="content">내용</option>'
	}else if(search_option == 'content'){
		code += '<option value="all">전체</option>'
		code += '<option value="title">제목</option>'
		code += '<option value="content" selected>내용</option>'
	}
	
	code += '</select>'
	code += '<input type="text" name="keyword" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요." id="keyword" value="'+keyword+'"/>'
	code += '<button type="submit" class="btn btn-primary mx-1 mt-2" id="groupSearchBtn">검색</button>'
	code += '</form>'
	code += '<div id = "vertifyBox" style="margin-top:10px;">'
		
	for(var i=0 ; i<list.length ; i++){
		const regdate = list[i].regdate.split(" ");
		code += '<div class="card shadow mb-1 qarea">'
			  + '<a href="#group'+list[i].gbno +'" idx="'+list[i].gbno+'"id="groupList" class="d-block card-header py-2" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="group'+list[i].gbno+ '">'
			  + '<div class="row">'
			  + '<div class="col-8 text-left">'
			  + '<span id="groupTitle" class="m-0 font-weight-bold " idx="'+list[i].gbno+'">'+list[i].title +'</span>'
			  + '</div>'
			  + '<div class="col-4 text-right">'
			  + '<span style="font-weight:bold;">'+[regdate[0]]+'</span>'
			  + '</div>'
			  + '</div>'		
			  + '</a>'
			  + '<div class="collapse" id="group'+list[i].gbno+'">'
			  + '<div class="card-body qadmincontarea">'
			  + '<h5 class="card-title">'
			  + '<img src="/project3/resources/upload/'+list[i].fileName+'" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>'
			  + '<span id="writer" style="font-size:15px;">'+list[i].name+'</span>'
			  + '<span style="font-size:15px;">('+list[i].regdate+')</span>'
			  + '</h5>'
			  + '<div style="margin-top: 10px;">'
			  + list[i].content
			  + '</div>'	
			  + '<span style="font-size: 18px; font-weight: bolder;">첨부파일</span>'
			  + '<div class="row" style="margin-top: 10px;">';
		
		console.log(list[i].groupAttachVOList);
		for(var j=0 ; j<list[i].groupAttachVOList.length ; j++) {
			console.log(list[i].groupAttachVOList[j].originfileName);
			code += '<div class="col-md-1 col-sm-1 col-xs-12"  style="cursor:pointer;" id="file" dropdown-mode="N">'
			code += '<div class="dropdown">'
			code += '<div class="dropdown-toggle" data-toggle="dropdown">'
			code += '<span class="card bg-light text-dark">'
			code += '<i class="fa fa-copy" style="width:90px;height:100px;" id="groupAttach"></i>'
			code += '</span>'
			code += '<div id="fileName">'
			code += list[i].groupAttachVOList[j].originfileName
			code += '</div>'
			code += '<div id="filesubmenuArea">'
			code += '<ul id="filesubmenu">'
			code += '<li><a href="#" onclick="fileDownload('+list[i].groupAttachVOList[j].gano+','+gno+')">Download</a></li>'
			code += '</ul>'
			code += '</div>'    
			code += '</div>'
			code += '</div>'
			code += '</div>'
		}
//		for(var j = 0; j <attach.length;j++){
//			for(var k = 0; k <attach[j].length;k++){
//				if(list[i].gbno == attach[j][k].gbno){
//				
//				}
//			}
//		}
		code += '</div>'
		code += '<hr style="margin-top:30px;">';
		code += '<div class="row">'
		code += '<div class="col-9 text-left">'
			code += '<span style="color: blue;margin-right:5px;cursor:pointer;" id="good" user="'+list[i].id+'" onclick="GroupBoardGood('+pager.curPage+','+gno+','+list[i].gbno+','+search_option+','+keyword+')">좋아요('+list[i].good+')</span>'
			code += '<span style="color: red;cursor:pointer;" id="bad" user="'+list[i].id+'" onclick="GroupBoardBad('+pager.curPage+','+gno+','+list[i].gbno+','+search_option+','+keyword+')">나빠요('+list[i].bad+')</span>'
		code += '</div>'
		code += '<div class="col-3 text-right">'
		code += '<div style="float:right;margin-right: 5px;margin-left: 5px;" id="lectureModifyArea">'
		code += '<form action="<%=request.getContextPath() %>/excludes/lecture/modifyForm" method="post" id="lectureForm">'
		code += '<input type="hidden" name="eno" value="${list.eno}"/>'
		code += '</form>'
		
		code += '<span user="'+list[i].id+'" onclick="GroupBoardModify('+list[i].gbno+','+gno+','+pager.curPage+',this)" style="color:blue;cursor:pointer;">수정</span>'
		code += '</div>'
		code += '<div style="float:right;">'
		code += '<span user="'+list[i].id+'" onclick="GroupBoardDelete('+pager.curPage+','+gno+','+list[i].gbno+',this)" style="color:red;cursor:pointer;">삭제</span>'
		code += '</div>'
		code += '</div>'
		code += '</div>'
		code += '</div>'
		code += '</div>'
		code += '</div>'
	}
	code += '</div>'
	code += '<div class="form-group">'
	code += '<ul class="pagination pagination-sm justify-content-center m-0">'
	code += '<li class="paginate_button page-item previous" id="dataTable_previous">'
	code += '<span aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="groupBoardList('+1+','+gno+','+search_option+')">처음</span>';
	code += '</li>'
	code += '<li class="paginate_button page-item previous" id="dataTable_previous">'
	code += '<span aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="groupBoardList('+pager.prevPage+','+gno+','+search_option+')">이전</span>';
	code += '</li>'
	for(var i = pager.blockBegin;i<=pager.blockEnd;i++){
		if(pager.curPage == i){
			code += '<li class="paginate_button page-item active">'
			code += '<span aria-controls="dataTable" data-dt-idx="'+i+'" class="page-link" onclick="groupBoardList('+i+','+gno+','+search_option+')">'+i+'</span>';
			code += '</li>' 
		}else{
			code += '<li class="paginate_button page-item ">'
			code += '<span aria-controls="dataTable" data-dt-idx="'+i+'" class="page-link" onclick="groupBoardList('+i+','+gno+','+search_option+')">'+i+'</span>';
			code += '</li>'
		}
	}
	code += '<li class="paginate_button page-item next" id="dataTable_next">'
	code += '<span aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="groupBoardList('+pager.nextPage+','+gno+','+search_option+')">다음</span>';
	code += '</li>'
	code += '<li class="paginate_button page-item next" id="dataTable_next">'
	code += '<span aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="groupBoardList('+pager.totPage+','+gno+','+search_option+')">끝</span>'
	code += '</li>'
	code += '</ul>'
	code += '</div>'
	code += '</div>'
	code += '</div>' 
	code += '</div>'
	$('#groupBoardArea').html(code);
}
//스터디 그룹 인증게시판 페이징에서 클릭할 경우
function groupBoardList(page, gno, search_option,keyword){
	var search_option = $('#search_option').val();
	var keyword = $('#keyword').val();
	$.ajax({
		url:'/project3/group/getGroupBoardList',
		type:'get',
		data:{"gno":gno,
			"curPage":page,
			"search_option":search_option,
			"keyword":keyword},
		dataType:'json',
		success:function(res){
			console.log(res);
			makeResultList(res);
		},error:function(req){
			alert('상태:'+req.status);
		}
	});
}
function fileDownload(gano,gno){
	location.href="/project3/group/GroupAttachDownload?gano="+gano+"&gno="+gno;
	
}

//인증게시판 나빠요 체크했는지 확인
function GroupBoardBadCheck(page,gno,gbno,search_option,keyword,id){
	$.ajax({
		url:'/project3/group/GroupBoardBadCheck',
		type:'post',
		data:{"gbno":gbno,
			"id":id}
		,success:function(res){
			if(res.check == null){
				var id = res.id;
				GroupBoardBadInsert(page,gno,gbno,id,search_option,keyword);
			}else{
				alert('이미 선택 하셨습니다');
				return false;
			}
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
//인증게시판 좋아요 체크했는지 확인
function GroupBoardGoodCheck(page,gno,gbno,search_option,keyword,id){
	$.ajax({
		url:'/project3/group/GroupBoardGoodCheck',
		type:'post',
		data:{"gbno":gbno,
			"id":id}
		,success:function(res){
			if(res.check == null){
				var id = res.id;
				GroupBoardGoodInsert(page,gno,gbno,id,search_option,keyword);
			}else{
				alert('이미 선택 하셨습니다');
				return false;
			}
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
function GroupBoardBadInsert(page,gno,gbno,id,search_option,keyword){
	$.ajax({
		url:'/project3/group/GroupBoardBadInsert',
		type:'post',
		data:{"gbno":gbno,
			"id":id}
		,success:function(res){
			alert('나빠요를 선택 하셨습니다');
			groupBoardList(page,gno,search_option,keyword);
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}
function GroupBoardGoodInsert(page,gno,gbno,id,search_option,keyword){
	$.ajax({
		url:'/project3/group/GroupBoardGoodInsert',
		type:'post',
		data:{"gbno":gbno,
			"id":id}
		,success:function(res){
			alert('좋아요를 선택 하셨습니다');
			groupBoardList(page,gno,search_option,keyword)
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
}


function GroupBoardTest(gno){
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
	var today2 = (year + '-' + month + '-' + day);
	$.ajax({
		url:'/project3/group/GroupBoardTest',
		type:'post',
		data:{"gno":gno,
			"today":today2}
		,success:function(res){
			var names = res.names;
			if(names == null || names == ""){
				alert('인증 게시판에 모두 글을 게시하였고 마감합니다');
			}else{
				alert('공부 계획 인증하지않은 명단:'+names);
			}
			var form = $('#groupDetailForm');
			form.submit();
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
	});
	
}



