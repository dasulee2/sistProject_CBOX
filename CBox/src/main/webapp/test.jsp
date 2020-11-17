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
				$(this).find(".change").html("<p class='.movie' style='height: 50%;'>"+summary+"</p><a href='detail.do?mcode="+mcode+">��</a></p><a href='index.do'>����</a>");
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
		<input type="hidden" id="mcode" id="mcode" value="�����Ȱ��">
		<input type="hidden" id="summary" value="����� ���� �� ������ ���� ��� ���ƿ� �� ">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80056/80056_1000.jpg">
	</div>
	<div class="movie" style="width:250px; height: 350px;">
		<p>2</p>
		<div class="change">
			<img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79617/79617_1000.jpg">
		</div>
		<input type="hidden" id="mcode" id="mcode" value="�ֳ���">
		<input type="hidden" id="summary" value="�׷��� �ҳ�� �ֳ����� �Ǿ���">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79617/79617_1000.jpg">
	</div>
	
	<div class="movie" style="width:250px; height: 350px;">
		<p>3</p>
		<div class="change">
			<img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79902/79902_1000.jpg">
		</div>
		<input type="hidden" id="mcode" id="mcode" value="���ѻ꼺">
		<input type="hidden" id="summary" value="1636�� ���� 14�� ����ȣ��.">
		<input type="hidden" id="image" value="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79902/79902_1000.jpg">
	</div>
</body>
</html>