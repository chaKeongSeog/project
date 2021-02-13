<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>

<div class="img-wrap">
<div class="slider">
    <div class="side-btns">
        <div><span style="color:white;"><i class="fa fa-angle-left" aria-hidden="true"></i></span></div>
        <div><span style="color:white;"><i class="fa fa-angle-right" aria-hidden="true"></i></span></div>
    </div>
    <div class="slides">
        <div class="active" style="background-image:url(/project3/resources/images/46000069b182d28a8805bcb016c5f5df8d60bf2c_s2_n1.jpg);no-repeat 0 0;width:1350px;background-size:cover;"></div>
        <div style="background-image:url(/project3/resources/images/그룹2.jpg);no-repeat 0 0;width:1350px;background-size:cover;"></div>
        <div style="background-size:contain; background-image:url(/project3/resources/images/book-1031359_1920.jpg);no-repeat 0 0;width:1350px;background-size:cover;"></div>
    </div>
<!--     <div class="pages"> -->
<!--         <div class="active"></div> -->
<!--         <div></div> -->
<!--         <div></div> -->
<!--     </div> -->
</div>

	
	
	
	<div class="img-item">

	
		
	</div>
</div>

<script>




/*
setInterval(function(){
    onClickBtn(0);
},1000);
*/
function onClickBtn(move){
    var $current = $('.slider>.slides>div.active');
    var $currentDot = $('.slider>.pages>div.active');
    var $next;
    var $nextDot;
    if(move == 0){
       $next = $current.prev();
       $nextDot = $currentDot.prev();
       if($next.length == 0){
          if(move == 0){
             $next = $('.slider>.slides>div:last-child');
             $nextDot = $('.slider>.pages>div:last-child');
          }
       }
    }
    if(move == 1){
       $next = $current.next();
       $nextDot = $currentDot.next();
       if($next.length == 0){
          if(move == 1){
             $next = $('.slider>.slides>div:first-child');
             $nextDot = $('.slider>.pages>div:first-child');
          }
       }
    }
    $current.removeClass('active');
    $next.addClass('active');
    $currentDot.removeClass('active');
    $nextDot.addClass('active');
}
$('.slider>.side-btns>div:first-child').click(function(){
    onClickBtn(0);
});
$('.slider>.side-btns>div:last-child').click(function(){
    onClickBtn(1);
});


function join(){
	
}
</script>  
</body>
</html>