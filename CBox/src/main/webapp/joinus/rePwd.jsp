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
	background: url(./image/banner.jpg) no-repeat center center;
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
#ok_btn {
	display:inline-block;
	border-radius:3px;
	border:1px solid #333;
	background-color: #333;
	font-weight:bold;
	color: white;
	min-width: 160px;
	min-height: 40px;
	font-size: 17px;
}
</style>
<script type="text/javascript">
	function validate() {
		if($("#pwd").val()=="") {
			alert("재설정할 비밀번호를 입력하세요.");
			return false;
		}else if($("#pwd").val().length<4) {
			alert("4자리 이상 입력해주세요.");
			return false;
		}/* else {
			alert("");
		} */
	}
</script>
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
	<div class="luncher" style="padding-right: 15px;">
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
	<!-- 비밀번호 찾기 -->
	<div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#FEFCF0; padding-top:30px; border-radius: 10px;">
		<!-- 비밀번호찾기 -->
		<div class="container" style="margin-top: 5%; ">
			<ul class="nav nav-tabs" style="margin-bottom: 40px; clear: both; list-style: none; border-bottom: 2px solid #898987;">
				<li class="on" style="width: 130px; background: #898987; height: 50px; border-radius:5px;">
					<a href="login.do" style="display: block; color:#ffffff; font-size: 15px; text-align: center; font-weight: bolder;">아이디 찾기</a>
				</li>
				<li style="width: 130px; background: firebrick; height: 50px; border-radius:5px; margin-left: 1px;">
					<a href="login.do" style="display: block; color:#ffffff; font-size: 15px; text-align: center; font-weight: bolder;">비밀번호 찾기</a>
				</li>
			</ul>
			<h3 style="text-align: left; height: 45px; padding-left:30px; background-color: #e8e8dd; font-size:15px; line-height: 45px;"><b>비밀번호 찾기</b></h3>
			<p style="text-align:left; margin-bottom: 10px;">비밀번호가 기억나지 않으세요? 원하시는 방법을 선택하여 비밀번호를 재설정하실 수 있습니다.</p>
			<div>
				<h4 style="height: 45px; padding-left:30px; background-color: #e8e8dd; font-size:15px; line-height: 45px; text-align: left; font-weight: bold;">비밀번호 재설정</h4>
				<div class="result" style="height: auto; padding: 70px 110px 70px 110px; text-align: center; border: 1px solid #e8e8dd;  "> 
					<div class="result2" style="text-align: center; width:750px; height: 160px; margin: 0 auto; background:#f7f6ea; vertical-align: middle;">
						<form action="rePwd.do" method="post" onsubmit="return validate()">
							<div style="padding-top: 65px;">
								<!-- <h4>새비밀번호 설정</h4> -->
								<input type="hidden" name="mid" id="id" value="${id }"/>
								<span style="font-size: 20px;">비밀번호 : </span>
								<input type="text" name="pwd" id="pwd" value="" style="width:200px; height: 40px;"/>
								<input type="submit" id="ok_btn" value="확인" style="width:60px; height: 40px;"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>