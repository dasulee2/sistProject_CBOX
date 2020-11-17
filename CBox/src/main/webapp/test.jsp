<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		 $(".movie").hover(function(){
			 var mcode = $(this).find("#mcode").val();
			 var summary =  $(this).find("#summary").val();
			 var img =  $(this).find("#image").val();
			// alert(mcode);
			$(this).fadeTo(200,0.7,function(){
				$(this).find(".change").html("<p class='.movie' style='height: 50%;'>"+summary+"</p><a href='detail.do?mcode="+mcode+">상세</a></p><a href='index.do'>예매</a>");
			});
		 },function(){
			 var img =  $(this).find("#image").val();
			 $(this).fadeTo(200,1,function(){
				 
				 $(this).find(".change").html("<img src='"+img+"'>");
			 });
			 
		 }
		 
		 );

	
	});
	

</script>
<style type="text/css">
div{
	
}
img{
	width:250px; 
	height: 350px;
}
a{
	color:red;
	cursor: pointer
}

</style>
</head>
<body>

	<div class="movie" style="width:250px; height: 350px;">
		<p>1</p>
		<div class="change">dddd
			<img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80056/80056_1000.jpg">
		</div>
		<input type="hidden" id="mcode" id="mcode" value="희생부활자">
		<input type="hidden" id="summary" value="억울한 죽음 뒤 복수를 위해 살아 돌아온 자 ">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80056/80056_1000.jpg">
	</div>
	<div class="movie" style="width:250px; height: 350px;">
		<p>2</p>
		<div class="change">
			<img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79617/79617_1000.jpg">
		</div>
		<input type="hidden" id="mcode" id="mcode" value="애나벨">
		<input type="hidden" id="summary" value="그렇게 소녀는 애나벨이 되었다">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79617/79617_1000.jpg">
	</div>
	
	<div class="movie" style="width:250px; height: 350px;">
		<p>3</p>
		<div class="change">
			<img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79902/79902_1000.jpg">
		</div>
		<input type="hidden" id="mcode" id="mcode" value="남한산성">
		<input type="hidden" id="summary" value="1636년 인조 14년 병자호란.">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79902/79902_1000.jpg">
	</div>
</body>
</html>