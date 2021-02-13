<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>
<style>
table tr[modify-mode="N"] .modify-visible{
    display:none;
}
table tr[modify-mode="N"] #replyBtnArea{
   display:block;
}
table tr[modify-mode="Y"] .modify-invisible,#replyBtnArea{
   display:none;
}
table td{
	border:0px;
}
table tr[answer-mode="N"] .answer-visible{
    display:none;
}
table tr[answer-mode="N"] #replyBtnArea{
   display:block;
}
table tr[answer-mode="Y"] #replyBtnArea{
    display:none;
}

</style>
  <div style="margin-top:-50px;text-align: left" >
            <table  style="width:100%;text-align: left;" class="table" id="r_table">
				<input type="hidden" name="bnum" id="bnum" value="${map.bno}"/>  
                <c:forEach var="reply" items="${map.list}" >
                    <tr id="tr" modify-mode="N" answer-mode="N">
                    <input type="hidden" name="num" id="num" value="${reply.rno}"/>
                        <td>
                        	<div id="replyArea1">
	                        	<div id="memberArea" style="float:left;">
	                        		<c:if test="${reply.ref_level>0 }">
	                        			<c:forEach begin="1" end="${reply.ref_level}">
	                        				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        			</c:forEach>
			                        </c:if> 
		                        	<img src="/project3/resources/upload/${reply.fileName}" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>
		                        	<span id="r_writer">${reply.name}</span> <span>(<fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>)</span><br />
	                        	</div>	
	                        	<div id="replyBtnArea" style="text-align: right;">
	                        		  <c:if test="${reply.ref_level < 4}">
	                        		  	<button type="button" class="btn btn-default" onclick="replyAnswerForm(this,'${reply.rno}','${reply.id}')">댓글 달기</button>
	                        		  </c:if>
	                                  <button type="button" class="btn btn-default" onclick="replyModifyForm(this,'${reply.rno}','${reply.id}')">댓글 수정</button>
	                                  <button type="button" id="replyDelete" onclick="replyDelete(${reply.rno},'${reply.id}')" class="btn btn-default">댓글 삭제</button>
	                            </div>
	                            <div style="clear:both;"></div>
	                        	<div id="r_content" class="modify-invisible" style="float:left;margin-left:55px;">
	                        	    <c:if test="${reply.ref_level>0 }">
	                        			<c:forEach begin="1" end="${reply.ref_level}">
	                        				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        			</c:forEach>
			                        </c:if>  
			                        <div style="display:inline-block;">
			                        	<span>${reply.content}</span>
			                        </div>
		                        </div>	
		                        <div class="modify-visible">
	                        		<!-- 댓글 수정폼 -->
									<form id ="rForm" action="" onsubmit="return false;">
										<input type="hidden" name="rno" id="rFormRno"/>
										<textarea class="form-control" id="rFormcont" name="rcont" placeholder="댓글을 수정해주세요" rows="5"></textarea> <br />
										<button type="button" class="btn btn-primary" onclick="replyModify(this)">수정</button>
										<button type="button" class="btn btn-primary" onclick="replyModifyCancel(this)">취소</button>						
									</form>
		                        </div>
		                        <div class="answer-visible">
	                        		<!-- 댓글 답변폼 -->
									<form id ="rAnswerForm" action="" onsubmit="return false;">
										<input type="hidden" name="rno" id="rAnswerRno" value="${reply.rno}"/>
										<textarea class="form-control" id="rAnswercont" name="rAnswercont" placeholder="댓글의 답변을 달아주세요" rows="5"></textarea> <br />
										<button type="button" class="btn btn-primary" onclick="replyAnswer(this)">답변</button>
										<button type="button" class="btn btn-primary" onclick="replyAnswerCancel(this)">취소</button>						
									</form>
		                        </div>
	                        </div>
	                       </c:forEach> 
                        </td>
                    </tr>
                    <!-- 폼태그 안에 위쪽에 있는 자바스크립트 구문에 필요한 값들을 노출시키지 않게 하기 위해 hidden타입으로 값들을 전달한다. -->
       </table>
          <hr style="display:none;"/>
           <ul class="pagination justify-content-center m-0">
            <li class="paginate_button page-item previous" id="dataTable_previous">
            	<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="replyList2('1')">처음</a>
            </li>
            <li class="paginate_button page-item previous" id="dataTable_previous">
            	<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="replyList2('${map.pager.prevPage}')">이전</a>
            </li>
            <c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
	            <c:choose>
	            	<c:when test="${map.pager.curPage == num}">
		            	<li class="paginate_button page-item active">
		            		<a href="#" aria-controls="dataTable" data-dt-idx="${num}" class="page-link" onclick="replyList2('${num}')">${num}</a>
			            </li>           	
	           		</c:when>
	           		<c:otherwise>
		           		<li class="paginate_button page-item ">
			            	<a href="#" aria-controls="dataTable" data-dt-idx="${num}" class="page-link" onclick="replyList2('${num}')">${num}</a>
			           </li>
		           </c:otherwise>
	            </c:choose>
            </c:forEach>
            
            <li class="paginate_button page-item next" id="dataTable_next">
            	<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="replyList2('${map.pager.nextPage}')">다음</a>
            </li>
            <li class="paginate_button page-item next" id="dataTable_next">
            	<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="replyList2('${map.pager.totPage}')">끝</a>
            </li>
        </ul>
    </div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){

	
})
function replyList2(page){
	var bno = $('#bnum').val().trim();
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/excludes/reply/replyList',
		data:{"bno":bno,
			"curPage":page},
		success:function(res){
			$('#replycontent').html(res);
		},error:function(req){
			alert('상태:'+req.status)
		}
	})
}
function replyAnswerForm(el,rno,id){
	var tr = $(el).closest('tr');
	tr.attr('answer-mode','Y');
}
function replyAnswer(el){
	var rno = $(el).parents('#rAnswerForm').find('#rAnswerRno').val();
	var rcont = $(el).parents('#rAnswerForm').find('#rAnswercont').val();
	var id = '${user.id}';
	if(rcont.length > 180){
		alert('글자수는 180자 이하로 작성해주세요');
		return false;
	}
	if(rcont == null){
		alert('답변 댓글을 입력해주세요');
		return false;
	}
	rcont = rcont.replace(/\n/g, '<br>');
	$.ajax({
		url:'<%=request.getContextPath()%>/reply/answer',
		type:'post',
		data:{"rno":rno,
			"rcont":rcont,
			"id":id},
		success:function(res){
			$(el).parents('#rAnswerForm').find('#rAnswercont').val('');
			var page = '${map.pager.curPage}';
			replyList2(page);
		},error:function(req){
			alert('상태:'+req.status);
		}
	});
}
function replyAnswerCancel(el){
	var tr = $(el).closest('tr');
	tr.attr('answer-mode','N');
}
function replyModifyForm(el,rno,id){
	if(id != '${user.id}'){
		alert('수정 권한이 없습니다');
		return false;
	}
	var rcont = $(el).closest('tr').find('#r_content span').html();
	rcont = rcont.replace(/<br>/g, '\n');
	var tr = $(el).closest('tr');
	tr.attr('modify-mode','Y');
	$(tr).find('#rFormRno').val(rno);
	$(tr).find('#rFormcont').val(rcont);
}
function replyModify(el){
	var rmcont = $(el).parents('#rForm').find('#rFormcont').val();
	var rmno =$(el).parents('#rForm').find('#rFormRno').val();
	rmcont = rmcont.replace(/\n/g, '<br>');

	if(rmcont == ""){
		alert('댓글을 입력해주세요');
		return false;
	}
	if(rmcont.length > 180){
		alert('글자수는 180자 이하로 작성하셔야합니다');
		return false;
	}
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/reply/modify',
		data:{"rno":rmno,
			"rcont":rmcont},
		success:function(res){
			var page = '${map.pager.curPage}';
			replyList2(page);
		},error:function(req){
			alert('상태:'+req.status)
		}
	})
	
}
function replyModifyCancel(el){
	var tr = $(el).closest('tr');
	tr.attr('modify-mode','N');
}
function replyDelete(rno,id){
	if(id != '${user.id}'){
		alert('삭제 권한이 없습니다');
		return false;
	}
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/reply/delete',
		data:{"rno":rno},
		success:function(res){
			var page = '${map.pager.curPage}';
			replyList2(page);
		},error:function(req){
			alert('상태:'+req.status)
		}
	})
}

</script>        
</body>
</html>
