<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<body>	
<div class="row">
	<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
		<div id="cal_bg" class="card shadow mb-4">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">${pds.title}</span></span>
				</h6>
			</div>
			<div class="card-body">
				<div class="cal-area" id="calarea">
					<span id = "postNum" hidden = "true">1</span>
					<div class = "row">
						<div class = "col-lg-6">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">${pds.name}</span>
							<span id = "ctrgb">(${pds.regdate})</span>
						</div>	
						<div class = "col-lg-6" style="text-align: right;">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">조회수:</span>
							<span>${pds.hit}</span>
						</div>
					</div>
					<div class = "row">
						<span id = "postDt" style = "margin-top: 7px;"></span>
					</div>
					<hr>
					
					<div id = "postCt" style = "width: 90%; min-height: 300px; padding: 5px;">
						${pds.content}
					</div>
				<hr />
				<span style="font-size: 18px; font-weight: bolder;">첨부파일</span>
				<div class="row" style="margin-top: 10px;">
					<c:forEach var="attach" items="${attach}">
						<c:if test="${attach.originFileName != null }">
							<div class="col-md-1 col-sm-1 col-xs-12"  style="cursor:pointer;" id="file" dropdown-mode="N">
								<div class="dropdown">
									<div class="dropdown-toggle" data-toggle="dropdown">
										<span class="card bg-light text-dark">
											<i class="fa fa-copy" style="width:90px;height:100px;"></i>
										</span>
										<div id="fileName">
											${attach.originFileName}
										</div>
										<div id="filesubmenuArea">
											<ul id="filesubmenu">
												<li><a href="#" onclick="Pdsfiledownload('${attach.ano}')">Download</a></li>
										    </ul>
										</div>    
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr style="margin-top: 60px;">	
					<div class = "row">
						<div class = "col-lg-4"><input type="button" class="btn btn-primary" value="LIST" id="list"></div>
						<div class = "col-lg-4" style = "text-align: center;">
							
						</div>
						<div class = "col-lg-4" style = "text-align: right;">
							<div id = "originShowbtn">
							   <c:if test="${pds.ref_step <=8}">
							   	<form id="answerForm" action="<%=request.getContextPath()%>/pds/answerForm" method="post" style="float:right;">
									<input type="hidden" name="bno" id="bno" value="${pds.bno}"/>
									<input type="button" class="btn btn-primary" value="답변" id="answer">
								</form>	
							   </c:if>
								<form id="modifyForm" action="<%=request.getContextPath()%>/pds/modifyForm" method="post" style="float:right;margin: 0 5px;">
									<input type="hidden" name="bno" id="bno" value="${pds.bno}"/>
									<input type="button" class="btn btn-warning" value="수정" id="modify">
								</form>
								<form id="deleteForm" action="<%=request.getContextPath()%>/pds/Delete" method="post" style="float:right;">
									<input type="hidden" name="bno" id="bno" value="${pds.bno}"/>
									<input type="button" class="btn btn-danger" value="삭제" id="delete">
								</form>
								<div style="clear:both;"></div>
							</div>
							<div id="modifyShowbtn" style="display: none;">
								<button type="button" class="btn btn-primary" id="modifyGo">SAVE</button>
								<button type="button" class="btn btn-primary" id="modifyCencel" style="margin-left: 4px;">BACK</button>
							</div>
					 	</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="row">
	<div class="col-lg-12 col-xl-12" style = "margin : auto;width:100%;">
		<div id="cal_bg" class="card shadow mb-4">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;">Reply</span>
				</h6>
			</div>
			<div class="card-body">
				<div class="cal-area" id="calarea">
					<div class = "row">
						<div class="rbox" style = "width : 100%;">
							<div class="col-xs-2 col-md-2 "></div>
							<div class="replyarea">
								<hr style="clear: both" />
								<form name="replyForm1" id="replyForm1" class="form-horizontal" onsubmit="return false" >
									<input type="hidden" name="id" id="id" value="${user.id}"/>
									<input type="hidden" name="bno" id="bno" value="${pds.bno}"/>
									<div class="col-xs-8 col-md-8 replywritearea">
										<p style="width: 80%; float: left">
										<textarea type="text" id="content" name="content" class="form-control" placeholder="댓글을 작성해주세요" style = "height : 100px"></textarea>
										</p>
										<p style="width: 20%; float: right;">
										<button type="button" class="replyWriteBtn btn btn-secondary replybtn" style="height:100px;" onclick="replyWrite(this)">ENTER</button>
										</p>
									</div>
								</form>
								<hr style="clear: both" />
								<div id="replycontent">
									
								</div>
								<br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		var bno = $('#bno').val().trim();
		replyList(bno);
		$('#answer').on('click',function(){
			var form = $(this).parents('#answerForm');
			form.submit();
		});
	
		$('#modify').on('click',function(){
			var id = '${pds.id}';
			if(id != '${user.id}'){
				alert('수정권한이 없습니다');
				return false;
			}
			var form = $(this).parents('#modifyForm');
			form.submit();
		})
		$('#list').on('click',function(){
			location.href="<%=request.getContextPath()%>/pds/list";
		})
		$('#delete').on('click',function(){
			var id = '${pds.id}';
			if(id != '${user.id}'){
				alert('삭제 권한이 없습니다');
				return false;
			}
			var form = $(this).parents('#deleteForm');
			form.submit();
		})
	});
	function replyWrite(el){
		var id = $(el).parents('#replyForm1').find('#id').val();
		var bno = $(el).parents('#replyForm1').find('#bno').val();
		var content = $(el).parents('#replyForm1').find('#content').val();
		
		if(content == ""){
			alert('댓글을 입력해주세요');
			return false;
		}else if(content.length > 180){
			alert('글자수는 180자 이하로 작성하셔야 합니다')
			return false;
		}
		
		content = content.replace(/\n/g,"<br>");
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/reply/write',
			data:{"id":id,
				"bno":bno,
				"content":content},
			success:function(res){
				$('#replyForm1').find('#content').val('');
				var bno = $('#bno').val();
				replyList(bno);
			},error:function(req){
				alert('상태:'+req.status)
			}
		})
		
	}
	function replyList(bno){
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/excludes/reply/replyList',
			data:{"bno":bno},
			success:function(res){
				$('#replycontent').html(res);
			},error:function(req){
				alert('상태:'+req.status)
			}
		})
	}
	function Pdsfiledownload(ano){
		location.href="/project3/pds/download?ano="+ano;
	}
	
</script>
<style>
	.dropdown-toggle::after{
		display:none;
	}
	#fileName{
	  overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      text-align: center;
	}
	table th td{
		color:black;
	}
	a{
		color:black;
	}
	body,ul,li{
		margin: 0;
		padding:0;
	}
	#filesubmenu{
		display:none;
		border:1px solid #dfdfdf;
		border-radius: 10px;
	}
	
	#filesubmenuArea{
		position: relative;
	}
	#filesubmenu{
		position: absolute;
		top:0;
		left: 0;
	}
	#file:hover #filesubmenu{
		display:block;
		width:100%;
	}
	
</style> 
</body>

















