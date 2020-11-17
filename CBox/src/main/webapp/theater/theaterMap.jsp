<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/main2.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpj0xPimF1pJKD_FR8eceOTpFIFEBGi7k"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#theatertimetable").click(function(){
			var location = $("#selectLoc").val();
			//alert(location);
			window.location.assign("../theater/theaterMain.do?location="+encodeURIComponent(location)+"&date=0");
		});
		$(".theatertd").click(function(){
			// alert( $("#location").val());
			//alert( $(this).find("#date").val());
			var location = $(this).find("#location").val();
			//alert(location);
			var date = 0;
			window.location.assign("../theater/theaterMain.do?location="+encodeURIComponent(location)+"&date="+date);
		});
		
		var Lat= $("#lat").val();
		var Lng= $("#lng").val();
		//alert(Lat);
		//alert(Lng);
		
		var mapCanvas = document.getElementById("locationMap");
		
		var myCenter = new google.maps.LatLng(Lat, Lng);
		var mapOption = {
				center: myCenter,
				zoom: 18				
		};
		
		var mapObj = new google.maps.Map(mapCanvas,mapOption);
		
		var marker = new google.maps.Marker({
			position: myCenter
			
		});
		marker.setMap(mapObj);
		
		var markerPosition = new google.maps.LatLng(Lat, Lng);
		var marker2 = new google.maps.Marker({
			position: markerPosition
			
		});
		marker2.setMap(mapObj); 
	
	}); 
		

</script>
<title>Insert title here</title>
<style type="text/css">
.container  h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
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

.theaterL{
	width:70%;
	margin:auto;
}
.theaterL td{
	border-top:1px solid black;
	border-bottom:1px solid black;
	width:18%;
	height: 50px;
	vertical-align: middle;
}
.theaterL td:hover {
	font-weight:bold;
	cursor: pointer;
}
.theater img{
	border-radius: 10px;
}
.container{
	color:black;
}
#location{
	font-size: 25px;
	color:black;
	font-weight: bold;
	text-align: left;
	margin-left:180px;
}
.theater p{
	font-size:16px;
	text-align: left;
	margin-left:180px;
	font-family: '나눔바른고딕';
}
.theaterMenu a{
	border:1px solid silver;
	margin:10px;
	padding:5px;
}
.theaterMenu a:hover {
	text-decoration: none;
	cursor: pointer;
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
						<li><a href="#">THEATER</a></li>
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
	
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px;  padding-bottom: 50px;">
		<div class="container"style="width: 90%;">
			<br>
			<input type="hidden" id="selectLoc" value="${location }">
				<table class="theaterL">
					<tr>
					<c:forEach var="theater" items="${theaterList}">
						<td class="theatertd"> ${theater.location }<input id="location" type="hidden" value="${theater.location }"></td>
					</c:forEach>
					</tr>
				</table>
		<div class="theater">
			<br>
			<h3 id="location">CBOX ${theater.location }</h3>
			<img alt="" src="${theater.image }">
			<p>${theater.information }</p>
			<p>1544-1122<br>8관 / 1,184석<br>편리한 접근성,다양한 문화시설의 상권,젊은 감각의 인테리어,층 마다 마련된 넓은 대기공간</p>
		</div>
		<br>
		<div class="theaterMenu">
			<a id="theatertimetable">상영시간표</a> <a href="#" style="font-weight: bold;">위치</a>
		</div>
		<hr style="background-color: black; border-width: 2px;  width:75%;">
		<div id="locationMap" style="height: 500px; width:73%; margin:auto; border:1px solid black;">
			${theater.lat }
			${theater.lng }
			<input type="hidden" id="lat" value="${theater.lat }">
			<input type="hidden" id="lng" value="${theater.lng }">
		</div>
		<hr style="background-color: black; border-width: 2px;  width:75%;">
		</div>
	</div>
	
	
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
						<p class="copyright">&copy; Untitled. Design: TEMPLATED. Images: Unsplash. Videos: Coverr.</p>
					</div>
				</footer>
	
</body>
</html>