<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
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
}
#nav a{

	color:#A6A6A6;
}
#nav a:hover{
	color:#fff;
	font-weight: bold;
	
}
/* /* 메인메인메인메인메인메인메인메인   */
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
.round {
	margin: 0 5px;
}
dd {
	margin-left:94px; 
	padding-left:25px; 
	border-left:1px solid #c5c4bf;
	text-align: left;
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
	<div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#FEFCF0; padding-top:30px; border-radius: 10px;">
		<!-- 아이디찾기 -->
		<div class="container" style="margin-top: 5%; ">
			<ul class="nav nav-tabs" style="margin-bottom: 40px; clear: both; list-style: none; border-bottom: 2px solid #898987;">
				<li class="on" style="width: 130px; background: firebrick; height: 50px; border-radius:5px;">
					<a href="login.do" style="display: block; color:#ffffff; font-size: 15px; text-align: center; font-weight: bolder;">아이디 찾기</a>
				</li>
				<li style="width: 130px; background: #898987; height: 50px; border-radius:5px; margin-left: 1px;">
					<a href="login.do" style="display: block; color:#ffffff; font-size: 15px; text-align: center; font-weight: bolder;">비밀번호 찾기</a>
				</li>
			</ul>
			<h3 style="text-align: left; height: 45px; padding-left:30px; background-color: #e8e8dd; font-size:15px; line-height: 45px;"><b>아이디 찾기</b></h3>
			<p style="text-align:left; margin-bottom: 10px;">아이디가 기억나지 않으세요? 원하시는 방법을 선택하여 아이디를 확인하실 수 있습니다.</p>
			<div>
				<h4 style="height: 45px; padding-left:30px; background-color: #e8e8dd; font-size:15px; line-height: 45px;">처리 결과 안내</h4>
				<div class="result" style="height: auto; padding: 70px 110px 70px 110px; text-align: center; border: 1px solid #e8e8dd;  ">
					<div class="result2" style="text-align: center; width:750px; height: 160px; margin: 0 auto; background:#f7f6ea; vertical-align: middle;">
						<c:if test="${mid!=null }">
							<strong style="font-size: 15px; display: block; margin:15px 0; padding-top:65px;">회원님의 아이디는 <b style="font-size: 20px;">[${mid }]</b> 입니다.</strong>
						</c:if>
						<c:if test="${mid==null }">
							<strong style="font-size: 15px; display: block; margin:15px 0;">입력하신 정보와 일치하는 아이디가 존재하지 않습니다.</strong>
						</c:if>
					</div>
					<div class="box-btn" style="margin-top:25px; text-align: center;">
						<a class="round black" href="login.do" style="border:2px solid #333333; color:#333333; padding:5px 0 5px 0; border-radius:3px;">
							<span style="padding: 0 20px;">로그인 화면으로 이동</span>
						</a>
						<a class="round gray" href="../main.do" style="border:2px solid #7b7b7b; color:#7b7b7b; padding:5px 0 5px 0; border-radius:3px;">
							<span style="padding: 0 20px;">메인화면으로 이동</span>
						</a>
					</div>
				</div>
			</div>
			<div style="margin-top: 40px;">
				<dl style="padding:30px; border:2px solid #d5d4cd; background: #f9f7ec; line-height: 1.8;">
					<dt style="float:left; color:#222222;">이용안내</dt>
					<dd>Charlie 고객센터 : 2580-2580</dd>
					<dd>
						상담가능시간 : 매일 09:00~21:00 (주말 및 공휴일에도 상담 가능합니다)
					</dd>
				</dl>
			</div>
		</div>
	</div>
</body>
</html>