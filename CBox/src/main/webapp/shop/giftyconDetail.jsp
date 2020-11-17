<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/main2.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
	
</head>
<style>

/*///////////////////////////////////////////////////////////  */
/* 영화순위순위순위순위순위순위 */
.container h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
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

.carousel {
    margin-bottom: 0;
    padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
    height: 40px;
	width: 40px;
    background: none repeat scroll 0 0 #222222;
    border: 4px solid #FFFFFF;
    border-radius: 23px 23px 23px 23px;
    margin-top: 90px;
}
.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}
.carousel-indicators .active {
background: #428bca;
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
	height: 450px;
	margin-left: 90px;
	
}
#infoline{
	width:550px;
	background-color: silver;
	height:2px;
	border-style: hidden;
	margin-right: 47px;
}
#binfo1{
	width:500px;
	margin-left:50px;
	margin-top:20px;
	float: right;
	color:black;
	background-color:#EAEAEA; 
}
#binfo1 table{
	width: 550px;
	padding-top:20px; 
	border-style:hidden;
	font-family: "나눔바른고딕";
	background-color:#EAEAEA; 
}
#binfo2 table{
	width: 550px;
	font-family: "나눔바른고딕";
}
hr{
	margin:20px;
}
</style>
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
				<a class="login" href="../joinus/mypage.do" style="color:white;"><span class="glyphicon glyphicon-user"></span> 마이페이지</a>&nbsp&nbsp
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
	<!-- 영화 순위 -->
	<hr>
	<!-- <h3 style="font-size: 30px; text-align: center; padding-top: 20px;"><img src="http://img.cgv.co.kr/R2014/images/title/h4_menu.png"></h3> -->
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px;  padding-bottom: 50px;">
		<div class="container"style="width: 90%;">
			<br>
			<div >
				<h3 style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;">스낵바 | 영화관람권</h3>
			</div>

		<hr>
		<div class="agile_top_brands_grids" id="detaildiv">
			<div id="bleft" style="float: left;">
				<img alt="" src="${giftycon.image }" st>
			</div>
			<div id="binfo1" style="float: left;">
				<table>
					<tr><td><h3 style="text-align: left; color:black; font-size: 23px; font-weight: bold; ">${giftycon.giftyconName }</h3></td></tr>						
				</table>
				<hr id="infoline">
				<table>
					<tr>
						<td style="width: 50px; text-align: left; padding-left: 40px;" >판매가</td>
						<td style="width: 100px;">${giftycon.price }</td>
					</tr>	
				</table>
				<hr id="dd" style=" border-style: dashed; width: 550px;">
				<table>
					<tr style="font-size: 15px; padding-bottom: 5px;">
						<td style="width: 50px; text-align: left; padding-left: 40px;"><span style="padding-top: 3px;">상품설명</span></td>
						<td style="width: 100px;">${content1}<br>${content2 }</td>
						<%-- <td style="width: 50px;"><span style="padding-left: 20px; float: left; text-align: left; font-size: 15px; ">상품설명</span></td>
						<td style="width: 100px;"><span style="padding-right: 40px; font-size: 15px;">${content1}<br>${content2 }</span></td> --%>
					</tr>
					<tr><td><br></td></tr>
					<tr style="font-size: 15px; ">
						<td style="width: 50px; text-align: left; padding-left: 40px;" >유효기간</td>
						<td style="width: 100px;">구매후 6개월 이내</td>
					</tr>	
					<tr><td><br></td></tr>
					<tr style="font-size: 15px; ">
						<td style="width: 50px; text-align: left; padding-left: 40px;" >상품교환</td>
						<td style="width: 100px;">관람 예정 극장의 매점</td>
					</tr>						
				</table>
				<hr id="infoline">
				<a href='../shop/shopMain.do?type=${giftycon.giftyconCode }' class='btn btn-primary add-to-cart' style='margin-left:30px; float: left; '> <i class='glyphicon glyphicon-list'></i>&nbsp&nbsp목록으로</a>
				<a href='../shop/giftyconBuy.do?giftyconCode=${giftycon.giftyconCode }' class='btn btn-danger add-to-cart' style='margin-left:10px; float: right; margin-right: 7px; '> <i class='glyphicon glyphicon-shopping-cart'></i>&nbsp&nbspNow Buy</a>
				<a href='../shop/giftyconBuy.do?giftyconCode=${giftycon.giftyconCode }' class='btn btn-danger add-to-cart' style='margin-left:100px; float: right; '> <i class='glyphicon glyphicon-gift'></i>&nbsp&nbsp&nbspGift&nbsp&nbsp&nbsp</a>
			</div>	

		</div>
		<hr>
		
		
		<ul style="margin-left: 50px;">
			<li style="list-style-type: dosc; color:black; font-size:15px;"><span style="float: left; color:black;">기프트콘으로는 매점상품 및 영화관람권을 구매/이용하실 수 있습니다.</span></li>
			<li style="list-style-type: dosc; color:black; font-size:15px;'" >
				<span style="float: left; color:#DB0000;">구매 후 전송 받으신 기프트콘 중,</span><br> 
				<span style="float: left;"><span style="font-weight:bold;">매점상품:</span> 매점상품은 각 영화관의 매점에서 실제 상품으로 교환하실 수 있습니다.</span><br>
				<span style="float: left;">(각 영화관 매점에서 기프트콘 제시 > 해당 매점 제품으로 교환)</span><br>
				<span style="float: left;">콤보 中 팝콘을 고소팝콘 이외의 팝콘으로 바꿀 경우, 추가 비용이 발생합니다.</span><br>
				<span style="float: left;"><span style="font-weight:bold;">영화관람권:</span> 영화관람권은 홈페이지,모바일, 또는 영화관 매표소를 통해 영화를 예매하실 수 있습니다.</span><br>
				<span style="float: left;">(홈페이지 빠른예매 > 결제 수단 > '할인/무료/포인트' 선택 > '기프트콘' 선택 > 기프트콘 번호 입력)</span><br>
			</li>
			<li style="list-style-type: dosc; color:black; font-size:15px;">
				<span style="float: left; color:#DB0000;">기프트콘 상품은 일부극장에서 사용이 불가능합니다.</span><br>
				<span style="float: left;">결제가 완료된 기프트콘 중 사용내역이 전혀 없으신 경우, ‘마이페이지 > My 구매정보 > 매점상품’ 에서 취소하실 수 있습니다. </span><br>
				<span style="float: left;">(단, 기프트콘 상품은 현금으로 환불은 불가능합니다.)</span><br>
			</li>
			<li style="list-style-type: dosc; color:black; font-size:15px;">
				<span style="float: left; color:#DB0000;">기프트콘은 부분 환불이 불가합니다.</span><br>
				<span style="float: left;">(예: 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 사용하신 쿠폰이 있는 경우 미사용 쿠폰의 환불은 불가합니다.) </span><br>
				<span style="float: left;">기프트콘의 사용기한은 기프트콘 발송일로부터 6개월입니다.</span><br>
				<span style="float: left;">매점상품 기프트콘은 극장매점에서 기프트콘 사용 후 수령한 영수증으로 CJONE 적립이 가능합니다.</span><br>
			</li>
		</ul>
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
						<p class="copyright">&copy; Untitled. Design: TEMPLATED. Images: Unsplash. Videos: Coverr.</p>
					</div>
				</footer>
	
</body>
</html>