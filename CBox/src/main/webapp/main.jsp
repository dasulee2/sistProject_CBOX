<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<head>
	<title>Full Motion</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<style type="text/css">
	#nav
	{
	}
	
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
	
	
		#nav-wrapper
		{
			background: #100B0B;
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
#cbox:hover{
	text-decoration: none;
}	
.vedio:hover {
	font-weight: bold;
	text-decoration: none;
}
	</style>
		
	</head>
	<body id="top">
			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->

					<!-- <nav id="nav">
						<ul>
							<li class="active"><a href="index.html">Homepage</a></li>
							<li><a href="left-sidebar.html">Left Sidebar</a></li>
							<li><a href="right-sidebar.html">Right Sidebar</a></li>
							<li><a href="no-sidebar.html">No Sidebar</a></li>
						</ul>
					</nav> -->
	
			
				<section id="banner" data-video="./image/banner">
					<div class="inner"  style="padding-bottom: 10px;">
						
							<header>
								<h1 style="margin-bottom: 10px;">Charie's BOX</h1>
								<p>A responsive video gallery template with a functional lightbox<br />
								designed by <a href="https://templated.co/">Templated</a> and released under the Creative Commons License.</p>
							</header>
						
						 <!-- <div id="header" style="padding-left: 100px; border: hidden; margin-top:100px; font-size: 30px; font-weight: bold;">
						<nav style="text-align: center; border: hidden;" class="nav">
							<ul class="nav navbar-nav">
								<li style="padding-right:5px; border-right: 1px solid silver;" ><a style="text-decoration: none;" href="./movie/MovieChart.do">MOVIE</a></li>
								<li style="padding-right:5px; border-right: 1px solid silver;"><a href="#">RESERVE</a></li>
								<li style="padding-right:5px; border-right: 1px solid silver;"><a href="#">THEATER</a></li>
								<li ><a href="./shop/shopMain.do">STORE</a></li>
							</ul>
						</nav>
					</div>  -->
						
						</div>
						<a href="#nav-wrapper" class="more">Learn More</a>
				</section>

			<!-- Main -->
			

			 <div id="nav-wrapper"> 

				<nav id="nav">
					<ul>
						<li class="active"><a href="./movie/MovieChart.do">MOVIE</a></li>
						<li><a href="./Ticket/bookingInfo.do">RESERVE</a></li>
						<li><a href="./theater/theaterMain.do">THEATER</a></li>
						<li><a href="./shop/shopMain.do">STORE</a></li>
						<c:if test="${mid eq 'green'}">
							<li><a href="./Manager/Manager.do">MANAGER</a></li>
						</c:if>
					</ul>
				</nav>
			</div> 
			
				<div class="luncher" style="padding-right: 20px;">
					<ul>
						<li></li>
						<li>
							<a class="basket" href="./cart/cartList.do" style="color:white;"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a>&nbsp&nbsp
						</li>
						
						<c:if test="${mid!=null}">
						<li style="padding-right:10px;">
							<a class="login" href="./mypage/mypage.do" style="color:white;"><span class="glyphicon glyphicon-user"></span> 마이페이지</a>&nbsp&nbsp
						</li>
						<li style="padding-right:10px;">
							<a class="login" href="./joinus/logout.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그아웃</a>&nbsp&nbsp
						</li>
						</c:if>
						<c:if test="${mid==null}">
						<li style="padding-right:10px;">
							<a class="login" href="./joinus/login.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그인</a>
						</li>
						</c:if>
					</ul>
				</div>

			
			
				<div id="main">
					<div class="inner">
						<div  class="thumbnails">
							<c:forEach var="m" items="${movie }">
								<div style="width: 20%" class="box">
									<a href="${m.movieClip }" class="image fit"><img src="${m.image }" alt="" /></a>
									<div class="inner" style="text-align: left;">
										<h3></h3>
										<p><span style="color:white; font-size: 18px; font-weight: bold;">${m.movieNm }</span><br>
										예매율  : 29.1% &nbsp;&nbsp;|&nbsp;&nbsp; 평점 : ${m.GPA}<br>
										개봉일 : ${m.openDt}</p>				
										
										<!-- <a href='# class='btn btn-danger' data-target="#modal" data-toggle="modal" style='margin-left:10px; float: left;'>예매</a> -->
										<a href="${m.movieClip }" style="font-size:17px; padding-bottom: 30px;" class="button fit vedio" data-poptrox="youtube,800x400">예고편 보기</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<h2>Etiam veroeros lorem</h2>
						<p>Pellentesque eleifend malesuada efficitur. Curabitur volutpat dui mi, ac imperdiet dolor tincidunt nec. Ut erat lectus, dictum sit amet lectus a, aliquet rutrum mauris. Etiam nec lectus hendrerit, consectetur risus viverra, iaculis orci. Phasellus eu nibh ut mi luctus auctor. Donec sit amet dolor in diam feugiat venenatis. </p>

						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a href="http://coverr.co/">Coverr</a>.</p>
					</div>
				</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>