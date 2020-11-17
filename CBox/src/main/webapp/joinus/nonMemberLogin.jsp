<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
			$("#nomember-form").fadeOut(100);
			$('#nomember-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#nomember-form-link').click(function(e) {
			$("#nomember-form").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});

		$("#login-form-link").click(function() {
			location.href = "login.do";
		}); 

	});
	
	function validate() {
			
		//alert($("#uname").val()+"~~~");
		//alert($("#head").val());
		
		if($("#name").val()=="") {
			alert("이름을 입력해주세요.");
			return false;
		}else if($("#middle").val()=="" || $("#end").val()=="") {
			alert("핸드폰번호를 입력해주세요.");
			return false;
		}else if($("#upwd1").val()=="" || $("#upwd2").val()=="") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if($("#upwd1").val().lenght<4 || $("#upwd2").val().length<4 || $("#upwd1").val().lenght>4 || $("#upwd2").val().length>4) {
			alert("비밀번호 4자리를 입력해주세요.");
			return false;
		}else if($("#pwd1").val()!=$("#pwd2").val()) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			return false;
		}else {
			var birthday = $("#nfront").val()+"-"+$("#nmiddle").val()+"-"+$("#nend").val();
			$("#birthday").val(birthday);
			
			var phone = $("#head").val()+"-"+$("#middle").val()+"-"+$("#end").val();
			//alert(phone);
			$("#phone").val(phone);
		}
	}
	
	
</script>
<style type="text/css">
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

/* 로그인과 비회원 로그인 */
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: black;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: firebrick;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: firebrick;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: maroon;
	border-color: maroon;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.forgot-username {
	text-decoration: underline;
	color: #888;
}

.forgot-username:hover, .forgot-username:focus {
	text-decoration: underline;
	color: #666;
}

.btn-nomember {
	background-color: firebrick;
	outline: none;
	color: #fff;
	font-size: 12px;
	/* height: auto; */
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: firebrick;
	border-radius: 7px;
}

.btn-nomember:hover, .btn-nomember:focus {
	color: #fff;
	background-color: maroon;
	border-color: maroon;
}
/* 테이블 */
table {
	width:100%;
	padding-bottom:20px;
}
p {
	color:black;
	font-weight: bold;
	padding:10px;
}
th {
	width:100px;
	padding: 10px;
}
td {
	padding: 10px;
	width:80%;
}
th, td {
	border-bottom: 1px solid #EAEAEA;
}
.input1 {
	width: 40%;
}
div {
	/* text-align: center; */
	padding-top: 10px;
}
#noMemberSubmit {
	width: 150px;
	height: 35px;
	background: firebrick;
	border: firebrick;
	color: #fff;
	font-size: 16px;
	border-radius: 3px;
}
#noMemberSubmit:hover, #noMemberSubmit:focus {
	color: #fff;
	background-color: maroon;
	border-color: maroon;
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
	<div class="luncher" style="padding-right: 15px;">
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
	<!-- <div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#FEFCF0;"> -->
		<!-- 비회원 로그인 -->
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" class="active" id="nomember-form-link">비회원 로그인</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="nonMemberLogin.do" method="post" role="form" style="display: none;" onsubmit="return validate()">
								</form>
								<!-- 비회원로그인 -->
								<div id="nomember-form" role="form" style="display: block;">
									<form name="myform" method="post" onsubmit="return validate()">
										<input type=hidden id="logintype" name="type" value="${logintype }" />
										<h3 style="font-weight: bold; font-size: 15px; text-align: left; height: auto; line-height: 1.2;">개인정보 입력 후 로그인</h3>
										<p style="background-color: #EAEAEA; text-align: center;">비회원 로그인 입력정보</p>
										<table style="border-top: 2px solid gray;">
											<caption>모든 입력사항은 필수 입력사항입니다.</caption>
											<tr>
												<th>이름</th>
												<td>
													<input type="text" class="input1" name="name" id="name" value="" style="width: 180px; height: 30px; text-align: left;"/>
												</td>
											</tr>
											<tr>
												<th>핸드폰 번호</th>
												<td>
													<select name="head" id="head" class="select1" style="font-size: 16px; width: 100px; height: 30px; text-align-last:center; ">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>-
													<input type="text" class="input1" name="middle" id="middle" maxlength="4" style="width: 180px; height: 30px;"/>-
													<input type="text" class="input1" name="end" id="end" maxlength="4" style="width: 180px; height: 30px;"/>
													<input type="hidden" name="phone" id="phone"/>
												</td>
											</tr>
											<tr>
												<th>성별</th>
												<td>
													<input type="radio" id="gender" name="gender" value="남성"/>남성
													<input type="radio" id="gender" name="gender" value="여성"/>여성
												</td>
											</tr>
											<tr>
												<th>생년월일</th>
												<td>
													<select id="nfront" style="font-size: 16px; width: 180px; height: 30px; text-align-last:center;">
														<c:forEach var="nfront" begin="1930" end="2017">
															<option>${nfront }</option>
														</c:forEach>
													</select>년
													<select id="nmiddle" style="font-size: 16px; width: 180px; height: 30px; text-align-last:center;">
														<c:forEach var="nmiddle" begin="1" end="12">
															<option>${nmiddle }</option>
														</c:forEach>
													</select>월
													<select id="nend" style="font-size: 16px; width: 180px; height: 30px; text-align-last:center;">
														<c:forEach var="nend" begin="1" end="31">
															<option>${nend }</option>
														</c:forEach>
													</select>일
													<input type="hidden" name="birthday" id="birthday"/>
												</td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td>
													<input type="password" class="input1" name="pwd" id="upwd1" value="" maxlength="4" style="width: 180px; height: 30px;"/>
												</td>
											</tr>
											<tr class="chkpwd">
												<th>비밀번호 확인</th>
												<td>
													<input type="password" class="input1" name="pwd2" id="upwd2" value="" maxlength="4" style="width: 180px; height: 30px;"/>
												</td>
											</tr>
										</table>
										<div style="text-align: center;">
											<input type="submit" id="noMemberSubmit" value="비회원로그인"/>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- </div> -->
	
</body>
</html>