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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkall").on("click",function(){
			  if( $(this).is(":checked") ) {
				   $("input[name=giftyconCode]:checkbox").each(function() {
				    	$(this).attr("checked", true);
				 	});
			  }else{
				  $("input[name=giftyconCode]:checkbox").each(function() {
				    	$(this).attr("checked", false);
				 	});
			  }
		});
	});
</script>
<title>Insert title here</title>
<style type="text/css">
.container hr input h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
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
	margin-left: 30px;
	width:100%;
	height: 450px;
}
.cartList{
	width:100%;
	margin-top: 30px;
	margin-left: 40px;
	margin-bottom: 20px;
	font-family:'나눔바른고딕';
}
#list{
	padding: 0 auto;
	width: 90%;
	border-top: 2px solid #1E486A;
	border-bottom: 2px solid #1E486A;
	border-collapse : collapse;	
	margin-bottom: 20px;
	color:black;
}
#list th{
	height: 30px;
	border: thin;
	color:black;
	background-color: #FEFDF8;
	border-bottom: 1px solid silver;
	font-weight:bold;
	text-align: center;
}
#list img{
	width: 80px;
	margin-right:10px; 
}
#list span{
	padding-top:40px; 
}
#list td{
	text-align: center;
	background-color: #FEFDF8;
	padding:10px 20px 10px 20px;
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
	
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px; padding-bottom: 50px;">
		<div class="container"style="width: 90%;">
			<br>
			<div >
				<h3  style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;">장바구니</h3>
			</div>
			<hr>
			<div class="agile_top_brands_grids" id="detaildiv">
				<form action="../cart/cartGiftyconBuy.do" method="post">
			<div class="cartList">
				<table id="list">
					<tr>
						<th><input type="checkbox" id="checkall" name="bcheck" ></th> 
						<th>상품정보</th>
						<th>판매가</th>
						<th>선택</th>				
					</tr>	
					<c:if test="${empty cartList }">
							<tr>
								<td colspan="7" style="text-align: center;" >장바구니에 담긴 상품이 존재하지 않습니다.</td>
							</tr>
							</c:if>
							<c:if test="${!(empty cartList) }">
								<c:forEach var="giftycon" items="${cartList }">
								<tr>
									<td><input type="checkbox" id="bcheck" name="giftyconCode" value="${giftycon.giftyconCode }"></td>
									<td>
									<div style="float: left">
										<img style="width: 200px; height: 200px;" src="${giftycon.image }"> 
									</div>
									<p style="padding-top: 80px; font-size:20px; margin-right:50px;">&nbsp&nbsp&nbsp&nbsp&nbsp ${giftycon.giftyconName }</p>
									</td>
									<td style="text-align: center;"><fmt:formatNumber value="${giftycon.price }" pattern="#"></fmt:formatNumber>   원</td>
									<td style="padding-bottom: 10px;">
									<a href='../shop/giftyconBuy.do?giftyconCode=${giftycon.giftyconCode }' class='btn btn-default btn-xs add-to-cart' style=' float: right; margin-right: 10px; '> <i class='fa fa-shopping-cart'></i>&nbsp&nbsp바로구매</a>
									<br>
									<a href='../cart/cartDel.do?giftyconCode=${giftycon.giftyconCode }'  class='btn btn-default btn-xs add-to-cart' style=' float: right; margin-right: 10px;'> <i class='fa fa-trash'></i>&nbsp&nbsp삭제</a>
									</td>
																		
								</tr>
							</c:forEach>
					</c:if>
				</table>
			</div>
			<div style="margin-right: 100px; float: right;">				
					<input type="submit" style="background:#286090" class="btn btn-primary" value="선택상품 삭제" onclick="this.form.action='../cart/cartDel.do';">	
					<input type="submit" style="background:#D9534F" class="btn btn-danger" value="선택상품 주문하기">	
			</div>
			</form>
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