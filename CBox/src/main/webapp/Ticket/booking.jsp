<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.seat-charts.js"></script>
<title>Insert title here</title>
<style type="text/css">
#cbox:hover{
	text-decoration: none;
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
	font-size: 90px;
	font-weight: 400;
	font-family: 'Passion One';
	margin: 0;
	padding-top: 20px;
}
.movie{
	border: 1px thin black;
	text-align: center;
	font-family: '다음';
}
.movieT {
	width:100%;
	padding:3px;
}
.theaterT{
	width:100%;
	padding:3px;
	font-family: '다음';
}
.dateT{
	width:100%;
	padding:3px;
}
.timeT{
	width:100%;
	padding:3px;
	font-family: '다음';
}
.movieT th{
	width:100%;
	border-bottom: 1px solid black;
	text-align: center;
	height:50px;
	font-size: 20px;
}
.movieT tr td{
	height: 55px;
	text-align: left;
	padding-left:20px;
	font-size: 18px;
}
.movieT td{
	border-bottom: 1px thin silver;
}
.movieT td:hover{
	cursor: pointer;
	border:1px solid black;
	background-color:#E4E0CD;
	font-weight:bold;
}
.theaterT th{
	width:100%;
	border-bottom: 1px solid black;
	text-align: center;
	height:50px;
	font-size: 20px;
}
.theaterT tr td{
	height: 55px;
	text-align: left;
	padding-left:20px;
	font-size: 18px;
}
.theaterT td:hover {
	cursor: pointer;
	border:1px solid black;
	background-color:#E4E0CD;
	font-weight:bold;
}
.dateT th{
	width:100%;
	border-bottom: 1px solid black;
	text-align: center;
	height:50px;
	font-size: 20px;
	font-family: '다음';
}
.dateT tr td{
	height: 55px;
	text-align: left;
	padding-left:20px;
	font-size: 16px;
}
.dateT td:hover {
	cursor: pointer;
	border:1px solid black;
	background-color:#E4E0CD;
	font-weight:bold;
}
.timeT th{
	width:100%;
	border-bottom: 1px solid black;
	text-align: center;
	height:50px;
	font-size: 20px;
}
.timeR{
	border:1px solid black;
	width: 26%;
	float:left;
	margin:16px;
}
.timeR:hover{
	cursor: pointer;
	border:1px solid black;
	background-color:#E4E0CD;
	font-weight:bold;
}
.timeR p{
	height: 40px;
	padding-top:13px;
	font-size: 17px;
}
#result{
	margin-top:10px;
	padding-bottom:10px;
	
}

#result div{
	border-right: 1px solid white;
	height: 150px;
	float: left;
}
#image{
	width:100px;
	height: 130px;
}
#resultT {
	float:left;
}
#resultT p{
	color: white;
	margin:20px;
}
#resultT{
 	margin:10px;
 	color:white;
}
#movieInfo{
	padding-left:60px;
	font-size: 16px;
}
#theaterInfo{
	padding-top:35px;
	padding-left:120px;
	padding-right:10px;
	color: white;
	font-size: 16px;
	
}
#theaterInfo p{
	padding:5px;
}
#theaterInfo th{
	width:50px;
}
#next-btn:hover{
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
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px; padding-bottom: 50px;">
		<div>
			<p>&nbsp</p>
		</div>
		<div class="bookingdiv" style="background:#F2F0E6; margin:auto; width: 90%; height: 800px; margin-top:70px; border:2px solid black;">
		<script type="text/javascript">
	var rowName=['A','B','C','D','E','F','G','H','I','J'];
	var price = ${price}; //price
	$(document).ready(function() {
		var $cart = $('#selected-seats'), //Sitting Area
		$counter = $('#counter'), //Votes
		$total = $('#total'); //Total money
		
		var sc = $('#seat-map').seatCharts({
			map: [  //Seating chart
				${seatMap}
			],
			naming : {
				top : false,
				getLabel : function (character, row, column) {
					return column;
				}
			},
			legend : { //Definition legend
				node : $('#legend'),
				items : [
					[ 'a', 'available','공석' ],
					[ 'a', 'unavailable','선택불가'],
					[ 'a', 'selected','선택한 좌석']
				]					
			},
			click: function () { //Click event
				if (this.status() == 'available') { //optional seat
					$('<li>'+rowName[(this.settings.row)]+'열  '+this.settings.label+'석</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);
					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+price);
								
					return 'selected';
				} else if (this.status() == 'selected') { //Checked
						//Update Number
						$counter.text(sc.find('selected').length-1);
						//update totalnum
						$total.text(recalculateTotal(sc)-price);
						//Delete reservation
						$('#cart-item-'+this.settings.id).remove();
						//optional
						return 'available';
				} else if (this.status() == 'unavailable') { //sold
					return 'unavailable';
					alert('선택할 수 없는 좌석입니다');
				}else{
					return this.style();
				}
			}
		});
		//sold seat
		sc.get([ ${occupiedlist} ]).status('unavailable');

		/* $("#btn_book").click(function(){
			if($total.text()!='0'){
				var cw=screen.availWidth;    
				var ch=screen.availHeight;    
				var ml=(cw-550)/2;        
				var mt=(ch-700)/2; 
				window.open("payPage.do?total="+$total.text()+"&timeSeq="+${timeSeq}+"&seat="+cartlist($cart),"결제","width=550px, height=750px, top="+mt+",left="+ml+", menubar=no, location=no, toolbar=no , fullscreen=no, scrollbars=yes");
				return false;
			}		
		}); */
		
		$("#next-btn").click(function() {
			var memberType =  $("#memberType").val();
			if($total.text()!='0'){
				var url = "midprocess.do?total="+$total.text()+"&timeSeq="+${timeSeq}+"&seat="+cartlist($cart)+"&ticket="+$("#counter").text()+"&memberType="+memberType;
				$(location).attr('href', url);
			}
		});
			
	});
	//sum total money
	function recalculateTotal(sc) {
		var total = 0;
		sc.find('selected').each(function () {
			total += price;
		});
				
		return total;
	}
	function cartlist($cart){
		var l1=$cart.text().replace(/ /g,'');
		var l2=l1.replace(/열/g,'');
		var l3=l2.replace(/석/g,'/');
		var list=l3.substring(0, l3.length-1);
		return list;
	}
</script>
<div class="content" style="padding-bottom:50px;">
	<div class="main">
		<h2>${theater.location} ${theater.place}관</h2>
		<div class="demo">
			<div id="seat-map">
				<div class="front">SCREEN</div>					
			</div>
			<div class="booking-details">
				<ul class="book-left">
					<li>Movie </li>
					<li>Time </li>
					<li>Tickets</li>
					<li>Total</li>
					<li>Seats :</li>
				</ul>
				<ul class="book-right">
					<li>: ${title}</li>
					<li>: ${day}, ${time}</li>
					<li>: <span id="counter">0</span></li>
					<li>: <b><i>$</i><span id="total">0</span></b></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
				
				<div id="legend"></div>
			</div>
			<div style="clear:both"></div>
	    </div>
			
	</div>
	    <div style="float:left; width:100%; height: 150px; border: 1px solid black; background-color:#232323; " >
				<div id="result" style="width:100%; float:left;">
					<div id="movieInfo" style="width: 30%;">
						<table class='resultT'>
							<tr>
								<td><img id='image' src="${movie.image }"></td>
								<td><p style='color:white; margin-left:10px;'>${title }</p></td>
							</tr>
						</table>
					</div>
					<div id="theaterInfo"  style="width: 30%;">
						<table>
							<tr>
								<th>극장</th>
								<td style='padding-left:5px;'>CGV ${theater.location}</td>
							</tr>
							<tr><th>일시</th><td> ${day} ${time}</td></tr>
							<tr><th>상영관</th><td>${theater.place}관</td></tr></table>
					</div>
					<input type="hidden" id="memberType" value="${memberType }">
					<div id="next" style="width:35%; margin-right:20px; float:right; border:none;">
						<a id="next-btn" style="width:120px; height:120px; float: right;"><img src="../image/next1.png"></a>
					</div>
				</div>
			</div>
	<!-- <button id="btn_book" class="checkout-button" style="float:right; margin-bottom:70px; margin-right:50px;">예매하기</button> -->	
</div>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>			
		</div>
	</div>
</body>
</html>