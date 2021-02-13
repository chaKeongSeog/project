<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

  <div class="col-xl-12">
      <div class="card mb-4">
          <div class="card-header">
              <i class="fas fa-chart-area mr-1"></i>
              	내정보
          </div>
    <form action="<%=request.getContextPath() %>/member/modify" class="form-horizontal"  method="post" enctype="multipart/form-data">
    	<input type="hidden" name="originFileName" id="originFileName" value="${member.fileName}"/>
     <div class="row">
        <div class="col-md-4">
        <div id="profileImg">
            <img alt="" style="width:288.5px;height:400px;" title="" class="img-circle img-thumbnail isTooltip" src="<%=request.getContextPath() %>/resources/upload/${member.fileName}" data-original-title="Usuario">
        </div>   
				<div class="col-sm-9">
					<input id="fileInput" type="file" data-class-button="btn btn-default" id="picture" name="file" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="control-label col-sm-3" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group" style="width:288.5px;">
						<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
						<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default">
								<span class="glyphicon"><i class="fas fa-upload"></i></span>
							</label>
						</span>
					</div>
				</div>
		
            <ul title="Ratings" class="list-inline ratings text-center">
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
            </ul>
        </div>
        <div class="col-md-6">
            <div class="table-responsive">
            <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                ID                                           
                            </strong>
                        </td>
                        <td style="vertical-align: middle;height:50px;">
                        <span class="glyphicon glyphicon-asterisk text-primary"></span>
                           <input class="form-control" type="text" placeholder="ID"  name="id" id="id" value="${member.id}" readonly="readonly">      
                        </td>
                    </tr>
                    <tr>    
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                Password                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="password" name="pwd" id = "password" value="${member.pwd}">
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               Name                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="Name" name="name" id = "name" value="${member.name}"readonly="readonly">
                        </td>
                    </tr>

                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                               Email                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="email" name="email" id = "email" value="${member.email}"> 
                        </td>
                    </tr>


                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                Tel                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                       		<input class="form-control" type="text" placeholder="tel" name="tel" id = "tel" value="${member.tel}">
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                                	created                                             
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="created" name="regdate" id = "regdate" value="${member.regdate}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            
                        </td>
                        <td class="text-primary">
                            <button type="submit" class="btn btn-primary">회원정보 수정</button> 
                            <button type="button" class="btn btn-primary" onclick="memberDelete('${member.id}')">회원 탈퇴</button>
                        </td>
                    </tr>                                    
                </tbody>
            </table>
            </div>
        </div>
        </div>
        </form>
    	</div>
      </div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(function(){
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
		 
		})
		function memberDelete(id){
			location.href="<%=request.getContextPath()%>/member/delete?id="+id;	
		}
</script>      
</body>
</html>