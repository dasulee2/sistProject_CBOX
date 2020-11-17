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
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/main2.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">

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
#detaildiv{

	width:90%;
	height: 450px;
	margin:auto;
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
#binfo2 table{
	width: 550px;
	font-family: "나눔바른고딕";
}
.messege{
	width:90%;
	margin:auto;
	margin-top: 30px;
	margin-bottom: 20px;
	font-family:'나눔바른고딕';
	text-align: center;
}

.messege span{
	font-size: 17px;
	font-weight: bold;
}
#res{
	width:960px;
	margin-top: 30px;
	margin-left: 80px;
	margin-bottom: 20px;
	font-family:'나눔바른고딕';
	border-top: 1px solid #79ABFF;
	border-bottom: 1px solid silver;
	border-collapse : collapse;	
}
#res th{
	height: 50px;
	border: thin;
	background-color: #D9E5FF;
	text-align: left;
	padding-left: 20px;
}
#res td{
	border: 1px solid #D9E5FF;
	border-bottom: 1px solid #79ABFF;
	text-align: right;
	padding-right: 50px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-weight: bord;
}
#res span{
	font-size: 30px;
}
#giftyconInfo{
	margin:auto;
	width:90%;
	height:300px;
	border: 1px solid black;
	margin-bottom: 5px;
}
#giftyconInfo img{
	width: 300px;
	height: 295px;
	float:left;
}
#giftyconInfo table{
	margin-top: 50px;
}
#th{
	width:400px;
	text-align:center;
	font-size: 17px;
	font-family: "나눔바른고딕";
}
#td{
	width:400px;
	padding-left:15px;
	text-align:center;
	font-family: "나눔바른고딕";
	font-size: 20px;
}
#num{
	margin-top:50px;
	margin-bottom:20px;
	width:90%;
	margin:auto;
	height: 50px;
	background-color: #761212;
	color: white;
	font-family: "나눔바른고딕";
	text-align: left;
	padding-top:8px;
	font-size:20px;
	font-weight: bold;
}
#phoneInfo{
	padding-top:10px;
	text-align: left;
	font-family: "나눔바른고딕";
	width:90%;
	margin: auto;
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
				<a class="login" href="../mypage/mypage.do" style="color:white;"><span class="glyphicon glyphicon-user"></span> MyCbox</a>&nbsp&nbsp
			</li>
			<li style="padding-right:10px;">
				<a class="login" href="../joinus/logout.do" style="color:white;"><span class="glyphicon glyphicon-off"></span> 로그아웃</a>&nbsp&nbsp
			</li>
			</c:if>
			<c:if test="${mid==null}">
			<li style="padding-right:10px;">
				<a class="login" href="../joinus/login.do" style="color:white;"><span class="glyphicon glyphicon-log-in"></span> 로그인</a>
			</li>
			</c:if>
		</ul>
	</div>
	<br>
	
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px;  padding-bottom: 50px;">
		<div class="container"style="width: 90%;">
			<br>
			<div >
				<h3  style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;">스낵바</h3>
			</div>
			<hr>
			<div class="buyform">
				<div class="messege">
					<h1 style="color:black;">구매가 성공적으로 접수되었습니다.</h1>
					<p><span>${m.name }</span> 고객님 감사합니다.</p>
					<p>구매하신 기프티콘은 마이페이지 > My Giftycon에서 확인 가능합니다.</p>
				</div>		
				<hr id="bline">		
				<div class="memberinfo" style="margin-left: 20px;">
					<div  id="num">
						<p style="padding-left:10px;">01 결제정보</p>
					</div>
					<c:forEach var="giftycon" items="${gList }">
						<div id="giftyconInfo" >
							<img src="${giftycon.image }">
							<table>
								<tr><th id="th">상품</th><th id="th">수량</th><th id="th">결제금액</th></tr>
							</table>
							<hr style="width: 700px; border-color:#BDBDBD;">
							<table>
								<tr><td id="td">${giftycon.giftyconName }<br></td><td id="td">${amount }</td><td id="td"><fmt:formatNumber value="${giftycon.price*amount }"  groupingUsed="true"/>원</td></tr>
							</table>
						</div>
					</c:forEach>
				</div>					
				<hr id="bline">	
				<div class="memberinfo" style="margin-left: 20px;">
					<div  id="num">
						<p style="padding-left:10px;"> 02 주문정보</p>
					</div>
					<div id="phoneInfo">
						<p style="font-size:18px; margin-left: 10px; font-weight: bold;">구매하는 분</p>
						<p style="font-size:16px; margin-left:10px; margin-top: 10px;">이름 &nbsp&nbsp&nbsp&nbsp &nbsp ${m.mid } | ${m.name }    &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp  &nbsp
							<%-- <input type="hidden" id="phone" value=${m.phone } name="buyPhone"> --%>
						</p>
						<hr style="border: 1px solid black; margin-top:10px; margin-bottom:10px;">
						<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
						<c:forEach var="ga" items="${rList }" varStatus="s" >
							<hr style="border: 1px solid sliver; margin-top:10px; margin-bottom:10px;">
							<p style="font-size:16px; margin-left:10px;">${s.count} &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp${ga.recipient }</p>
							<hr style="border: 1px solid sliver; margin-top:10px; margin-bottom:0px;"">
						</c:forEach>
						<hr style="border: 1px solid black; margin-top:10px; margin-bottom:10px;">
					</div>
					<br>
					<a href="../shop/shopMain.do">홈으로</a>
					<br><br><br>
				</div>			
			</div>	
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