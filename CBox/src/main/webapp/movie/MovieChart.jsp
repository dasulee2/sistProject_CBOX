<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
		$(".movie").hover(function(){
			var mcode = $(this).find("#mcode").val();
			var summary = $(this).find("#summary").val();
			if(summary.length>100){
				summary = summary.substring(0,120)+"...";
			};
			
			$(this).fadeTo(150,0.1,function(){
				$(this).find(".hover").html("<div class='summary'><p>"+summary+"</p></div><div class='button'><a href='../movie/movieDetail.do?mcode="+mcode+"'>영화정보&nbsp;&nbsp;</a><a href='../Ticket/bookingInfo.do?mcode="+mcode+"'>&nbsp; 예매&nbsp; &nbsp;&nbsp;  </a></div>");
			});
			$(this).fadeTo(150,1,function(){
				$(this).find(".hover").html("<div class='summary'><p>"+summary+"</p></div><div class='button'><a href='../movie/movieDetail.do?mcode="+mcode+"'>영화정보&nbsp;&nbsp;</a><a href='../Ticket/bookingInfo.do?mcode="+mcode+"'>&nbsp; 예매&nbsp; &nbsp;&nbsp;  </a></div>");
			});
		},function(){
			var image = $(this).find("#image").val();
			
			$(this).fadeTo(150,0.1,function(){
				$(this).find(".hover").html("<img src='"+image+"'>");
			});
			$(this).fadeTo(150,1,function(){
 			$(this).find(".hover").html("<img src='"+image+"'>");
			});
		});
	});
</script>
<title>Insert title here</title>
<style type="text/css">
html,body{
	background-color: #2F2F37;
	margin: 0;
	padding: 0;
	
}
p, h1, h2, h3{
	margin:0;
	padding:0;
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
	font-size: 90px;
	font-weight: 400;
	font-family: 'Passion One';
	margin: 0;
	padding-top: 20px;
}
#cbox:hover {
	text-decoration: none;
}
.moviediv{
	margin-left:30px;
	padding-left:60px;
}
.movie{
	height: 350px;
	margin:10px;
	margin-top:5px;
}
.hover{
	border:1px solid black;
	height: 100%;
}
.movie img{
	width :100%;
	height: 100%;
}
.hovoer p {

}
.test{
	padding: 5px;
	background: yellow;
}
.summary {
	height: 270px;
	padding-top:30px;
	padding-left: 20px;
	padding-right: 20px;
	font-size:16px;
	font-family: '나눔바른고딕';
}
.button{
	width:300px;
	padding-right: 20px;
	margin-top:10px;
}
.button a{
	width:40px;
	border:1px solid black;
	padding:15px 10px 10px 17px;
	text-align: center;
	text-decoration: none;
	margin-right: 10px;
	font-size:16px;
	font-family: '나눔바른고딕';
}
.button a:hover {
	color:#C90000;
}
</style>
</head>
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
						<li><a href="../theater/theaterMain.do">THEATER</a></li>
						<li><a href="../shop/shopMain.do">STORE</a></li>
					</ul>
				</nav>
			</div>
	<div class="luncher" style="padding-right: 20px;">
		<ul>
			<li></li>
			<li>
				<a class="basket" href="../cart/cartList.do" style="color:white;"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a>&nbsp&nbsp
			</li>
			
			<c:if test="${mid!=null}">
			<li style="padding-right:10px;">
				<a class="login" href="../mypage/mypage.do" style="color:white;"><span class="glyphicon glyphicon-user"></span> 마이페이지</a>&nbsp&nbsp
			</li>
			<li style="padding-right:10px;">
				<a class="login" href="../joinus/logout.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그아웃</a>&nbsp&nbsp
			</li>
			</c:if>
			<c:if test="${mid==null}">
			<li style="padding-right:10px;">
				<a class="login" href="../joinus/login.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그인</a>
			</li>
			</c:if>
		</ul>
	</div>
	<br>
	<div class="container" style="margin:auto; width:80%; background:#EAEAEA; border-radius: 10px;">
		<div style="">
				<h3 style="text-align: left; padding-left: 10px;">무비차트</h3>
		</div>
<!-- 		<small><span style="float: right; padding-bottom: 0px;"><a href="#">평점순&nbsp;&nbsp;&nbsp;&nbsp;</a></span></small>	
		<small><span style="float: right; padding-bottom: 0px;"><a href="#">개봉순&nbsp;&nbsp;&nbsp;&nbsp;</a></span></small>
		<small><span style="float: right; padding-bottom: 0px; "><a href="#">무비차트&nbsp;&nbsp;&nbsp;&nbsp;</a></span></small>	 -->
								
		<hr style="margin-top:15px; width: 1150px;">
		
		<div class="agile_top_brands_grids moviediv" id="giftycon">
			<c:forEach var="m" items="${mList}" varStatus="s" >
				<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px; width:23%;'>
					<div style="height: 550px;">
						<div style="height: 50px; width:92%; background: #810000; margin:auto; border:4px solid black; ">
							<h1 style="color:white; font-size: 25px; font-weight: bold; text-align: center;">NO.${s.count }</h1>
						</div>
						<div class="movie">
							<div class="hover">
								<img src="${m.image }">
							</div>
							<input type="hidden" id="mcode" value="${m.movieCd}">
							<input type="hidden" id="image" value="${m.image}">
							
							<input type="hidden" id="summary" value="${m.summary}">
						</div>
						<div style="float:text-align: left; padding-left: 10px;">
							<h4 style="font-weight: bold;">${m.movieNm}</h4>
							<p>예매율  : 29.1% &nbsp;&nbsp;|&nbsp;&nbsp; 평점 : ${m.GPA}</p>
							<p>개봉일 : ${m.openDt}</p>	
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	
	</div>
	
	
</body>
</html>