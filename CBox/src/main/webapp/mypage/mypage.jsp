<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/main2.css" />
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
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
  	position:absolute;
    width: 250px;
    height: auto;
    margin-left: -250px;
    background: white;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
/*     display:  ; */
    text-decoration: none;
    color: #999;
  }

  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
#cbox:hover{
	text-decoration: none;
}
</style>
</head>
<body>
	<header>
		 <h1 style="text-align: center; padding-top: 60px; padding-bottom: 40px;"><a id="cbox" style="font-weight:bold; " href="../main.do.jsp">Charie's BOX</a></h1>
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
	<!-- <div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#FEFCF0;">
	
	
	</div> -->
	<div style="width:80%; margin:auto;  font-family: '나눔바른고딕'; margin-bottom: 50px;" >
	<div class="sidebar" style="float:left; border-radius: 10px; ">
		<div class="col-sm-6">
	<div id="page-wrapper">
	  <!-- 사이드바 -->
	  <div id="sidebar-wrapper">
	    <ul class="sidebar-nav">
	      <li class="sidebar-brand">
	        <a href="" style="color:black"><b>My CGV Home</b></a></li>
	      <li><a href="myMovie.do?mid=${mid}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My Movie</a></li>
	      <li><a href="MovieDiary.do?mid=${mid}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movie Diary</a></li>
	       <hr>
	        <li class="sidebar-brand"><a href="" style="color:black"><b>CBox 멤버십</b></a></li>
	      <li><a href="../Membership/pointPage.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 적립/사용내역</a></li>
	      <li><a href="../Membership/membership.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쿠폰/기프티콘 내역</a></li>
	      <hr>
	        <li class="sidebar-brand"><a href="" style="color:black"><b>티켓/팝콘 스토어</b></a></li>
	      <li><a href="../mypage/shopMygiftycon.do?type=M">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화관람권 기프티콘</a></li>
	      <li><a href="../mypage/shopMygiftycon.do?type=">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매점상품 기프티콘</a></li>
	      <hr>
	        <li class="sidebar-brand"><a href="" style="color:black"><b>회원정보</b></a></li>
	      <li><a href="../mypage/memberInfo.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보 변경</a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
	    </ul>
	    <hr>
	  </div>
	  </div>
	  </div>
	  <!-- /사이드바 -->
	
	  <!-- /본문 -->
	</div>
	
	<div class="container" style="margin-left:296px; width: 78%; border-radius:6px; border:1px solid #EEEEEE; background:#EEEEEE; padding:10px;">	
			<br><br><br>		
			<div class="container" style=" apdding:10px;">
			<div class="panel panel-primary">
			<div class="panel-heading" style="background-color: black;">
				<h4>&nbsp;<span class="pull-left"><b style="color: orange; font-weight: bold;">${m.name}</b>님 &nbsp;환영합니다</span>
				<span class="pull-right" >회원등급 | <b style="color: orange; font-weight: bold;">${grade}</b></span></h4> 
			</div>
			<div class="panel-body">
				<hr>
				<div class="col-sm-6" >
					<p><b class="pull-left" style="font-weight: bold;">Point</b><button class="btn btn-default pull-right">조회하기</button></p>
					<br>
					<br>
					<br>
					<p><span class="pull-left">포인트</span><span class="pull-right">${point}&nbsp;&nbsp;point</span></p>

				</div>
				<div class="col-sm-6" style="border-left: 1px solid grey;">
					<p><b class="pull-left" style="font-weight: bold;">보유 쿠폰 정보</b><a href="#" class="btn btn-default pull-right">조회하기<span class="sr-only"></span></a></p>
					<br>
					<br>
					<br>
					<p><span class="pull-left">영화관람쿠폰</span><span class="pull-right">${count}&nbsp;&nbsp;매</span></p>
					<br>
					<br>
					<p><span class="pull-left">매점쿠폰</span> <span class="pull-right">${ccount}&nbsp;&nbsp;매</span></p>
				</div>

				</div>
			</div>
			</div>	
		<br><br>
			<div>
			dfdf
			</div>		
			</div>
	</div>	
</body>
</html>