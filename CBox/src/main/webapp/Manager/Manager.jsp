<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container span hr input h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
}
html,body{
	background-color: #2F2F37;
	margin: 0;
	padding: 0;
}
header{
	border:1px solid #2F2F37;
	background: url(../image/banner.jpg) no-repeat center center;
	height: 300px;
}
#logo{
	color:#fff;
	font-size:5em;
	font-weight: 400;
	font-family: "Passion One";
	margin:auto;
	margin-left: 500px;
}
#nav
	{
	}

		#nav-wrapper
		{
			background: black;
			top: 0;
			left: 0;
			width: 100%;
		}
		
		#nav > ul
		{
			margin: 0;
			padding: 0;
			text-align: center;
		}

		#nav > ul > li
		{
			display: inline-block;
			border-right: 1px solid;
			border-color: rgba(255,255,255,.1);
		}
		
			#nav > ul > li:last-child
			{
				padding-right: 0;
				border-right: none;
			}

			#nav > ul > li > a,
			#nav > ul > li > span
			{
				display: inline-block;
				padding: 1.5em 1.5em;
				letter-spacing: 0.06em;
				text-decoration: none;
				text-transform: uppercase;
				font-size: 1.1em;
				outline: 0;
				color: #FFF;
			}

			#nav li.active a
			{
				color: #FFF;
			}

			#nav > ul > li > ul
			{
				display: none;
			}
			#nav a:hover {
				font-weight: bold;
				background-color: #3F4140;
}
.container {
	color:black;

}
#nav a{

	color:#A6A6A6;
}
#nav a:hover{
	color:#fff;
	font-weight: bold;
	
}
/* 메인메인메인메인메인메인메인메인   */
.luncher {
	width: 100%;
	height: 30px;
	line-height: 12px;
}
.luncher>ul>li {
	float: right;
	font-size: 15px;
	padding: 5px 0 0 5px;
	line-height: 12px;
	list-style: none;
}
a {
	color: black;
}
#cbox{
	color: white;
	font-size: 100px;
	font-weight: 400;
	font-family: 'Passion One';
	margin: 0;
	padding-top: 20px;
}
#cbox:hover{
	text-decoration: none;
}
#detaildiv{
	margin:auto;
	width:90%;
	height: 120px;
}
#detaildiv2{
	margin:auto;
	width:90%;
	height: auto;
}
#infoline{
	width:500px;
	background-color: silver;
	height:2px;
	border-style: hidden;
	margin-right: 47px;
}
#binfo1{
	width:500px;
	margin-left:50px;
	margin-top:30px;
	float: right;
}
#binfo1 table{
	width: 550px;
	padding-top:20px; 
	
	font-family: "나눔바른고딕";
}
#num{
	margin-top:50px;
	margin-bottom:20px;
	width:100%;
	height: 50px;
	background-color: #1E486A;
	color: white;
	font-family: "나눔바른고딕";
	text-align: left;
	padding-left:15px;
	padding-top:8px;
	font-size:20px;
	font-weight: bold;
}
#phoneInfo{
	text-align: left;
	font-family: "나눔바른고딕";
	color:black;
}
.reset{
	float: right; 
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #4C4C4C;
	border-radius: 3px;
	font-size: 17px;
	width:60px;
	text-align: center;
}
.reset:HOVER {
	text-decoration: none;
	cursor: pointer;
}
.search{ 
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #CC3D3D;
	border-radius: 3px;
	font-size: 17px;
	padding-left:10px;
	padding-right:10px;
	padding-top:3px;
	padding-bottom:3px;
	text-align: center;
}
.search:HOVER {
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click","#btn_search",function(){		
		if($("#date").val().length>8||$("#date").val().length<6){
			alert('yyyymmdd 8자리를 똑바로 입력할 것');
		}else{
			$.ajax({
				url:"search.do",
				data:{"date":$("#date").val()},	//보내는 parameter
				type:"GET",	//보낼때
				dataType:"json", //받을 타입
				error:function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				success:function(resData){
					alert("받아오기성공.");
					for(var i in resData){
						$("#movieChart").append("<p> 코드: "+resData[i].movieCd+", 제목: "+resData[i].movieNm+", 개봉일 :"+resData[i].openDt+"</p>");
					}
				}
			});
		}
	}) ;
	
/* 	$("#btn_mcode").click(function(){
		$(location).attr('href',"addMovie.do?mcode="+$("#mcode"));
	}); */
	$("#btn_timetable").click(function(){
		if($("#mcode1").val().length>8||$("#mcode1").val().length<6){
			alert('mcode 8자리를 똑바로 입력할 것');
		}else{
			$(location).attr('href',"addTimetable.do?mcode="+$("#mcode1").val()+"&time="+$("#time1").val()+"&day="+$("#day").val()+"&tn="+$("#theaterNo").val());
		}
	});
	
});


</script>
<body>
<header>
		 <h1 style="text-align: center; padding-top: 60px; padding-bottom: 40px;"><a id="cbox" style="font-weight:bold; " href="../main.do">Charie's BOX</a></h1>
</header>
<div id="nav-wrapper"> 
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="../movie/MovieChart.do">MOVIE</a></li>
						<li><a href="../Ticket/bookingInfo.do">RESERVE</a></li>
						<li><a href="#">THEATER</a></li>
						<li><a href="../shop/shopMain.do">STORE</a></li>
						<c:if test="${mid eq 'green'}">
							<li><a href="../Manager/Manager.do">MANAGER</a></li>
						</c:if>
					</ul>
				</nav>
</div>
<c:if test="${mid!=null}">
	<li style="padding-right:10px;">
		<a class="login" href="../joinus/login.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그아웃</a>&nbsp&nbsp
	</li>
	</c:if>
	<c:if test="${mid==null}">
	<li style="padding-right:10px;">
		<a class="login" href="../joinus/login.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그인</a>
	</li>
</c:if>
<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px; padding-bottom: 50px;">
<div class="container"style="width: 90%;">
	<br>
	<div>
		<h3  style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;">관리자 페이지</h3>
	</div>
	<hr>
	<div class="agile_top_brands_grids" id="detaildiv">
		<div  id="num">
			<p>01 예매관리</p>
		</div>
		<form action="bookSeat.do" method="get">
			<label>timeSeq입력</label>
			<input name="timeSeq" id="time">
			<label>SeatNo입력</label>
			<input name="seatNo" id="seat">
			<button type="submit" class='btn btn-danger'>영화예약</button>
			<button type="submit" formaction="setSeat.do" class='btn btn-danger'>시간대별 빈좌석 생성기</button>
		</form>
	</div>
	<div class="agile_top_brands_grids" id="detaildiv2">
		<div  id="num">
			<p>02 날짜로 박스오피스 검색</p>
		</div>
		<label>ex)yyyymmdd</label>
		<input name="date" id="date">
		<button type="button" id="btn_search" class='btn btn-danger'>검색</button>
		<br>
		<p>=========================</p><br>
		<div id="movieChart"></div>	
	</div>
		
	<!-- <label>영화코드 입력</label>
	<input name="mcode" id="mcode">
	<button type="button" id="btn_mcode">영화 DB 생성</button>
	<br><br> -->
	<div class="agile_top_brands_grids" id="detaildiv">
		<div  id="num">
			<p>03 Timetable 생성하기</p>
		</div>
		<label>영화코드</label>
		<input id="mcode1">
		<label>상영관 번호</label>
		<input id="theaterNo">
		<label>상영날짜 yy/mm/dd</label>
		<input id="day">
		<label>상영시간 hh:mm</label>
		<input id="time1">
		<button type="button" id="btn_timetable" class='btn btn-danger'>생성</button>
	</div>
	
	<div class="agile_top_brands_grids" id="detaildiv2">
			<div  id="num">
				<p>04 좌석 대량입력</p>
			</div>
			<button type="button" id="btn_seatMaker" class='btn btn-danger' onclick="location.href='setSeats.do' ">생성</button>
	</div>
</div>
</div>
</body>
</html>