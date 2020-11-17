<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {

		$("#btn-nomember1").click(function() {
			var type = $("#logintype").val("reserve");
			//alert(type.val());
			location.href="nonMemberLogin.do?logintype="+type.val();
		}); 
	});

	$(document).ready(function() {

		$("#btn-nomember2").click(function() {
			var type = $("#logintype").val("select");
			//alert(type.val());
			location.href="nonMemberLogin.do?logintype="+type.val();
		});
	});
	
	$(document).ready(function() {
		//alert('1');
		$("#login-submit").click(function() {
			//alert('2');
			$.ajax({
				type:"POST",
				url:"error.do",
				data:{"mid":$("#mid").val(), "pwd":$("#pwd").val()},
				dataType:"text",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(responseData){
					if($.trim(responseData)=='success'){
						alert("환영합니다.");
						//location.href="welcome.do";
					}else {
						alert("아이디 혹은 비밀번호가 틀렸습니다.");
						//location.href="login.do";
					}
				}
			});
		});
	});
	
	//아이디 조회
	$(document).ready(function() {
		//alert('1');
		$("#psubmitForm").click(function() {
			
			//alert($("#id").val());
			$.ajax({
				type:"POST",
				url:"idSearch.do",
				data:{"id":$("#id").val()},
				dataType:"text",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(responseData){
					if($.trim(responseData)=='success'){
						var id = $("#id").val();
						alert("아이디가 존재합니다.");
						location.href="rePwd.do?id="+id;
					}else {
						alert("조회하신 아이디가 존재하지 않습니다.");
						location.href="login.do";
					}
				}
			});
		});
	});
</script>
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
		$("#btn-nomember1").click(function() {
			$("#btn-nomember1").fadeOut(100);
			$("#btn-nomember2").fadeOut(100);
			$("#service").fadeOut(100);
		});

		$("#btn-nomember2").click(function() {
			$("#btn-nomember1").fadeOut(100);
			$("#btn-nomember2").fadeOut(100);
			$("#service").fadeOut(100);
		});

		$("#login-form-link").click(function() {
			location.href = "login.do";
		});

	});
	
 	$(function() {
		$("#submitForm").click(function() {
			if($("#name").val()=="") {
				alert("이름을 입력하세요");
				return false;
			}else if($("#middle").val()=="" || $("#end").val()=="") {
				alert("전화번호를 입력해주세요.");
				return false;
			}else {
				var phone = $("#front").val()+"-"+$("#middle").val()+"-"+$("#end").val();
				$("#phone").val(phone);
				$("#form").submit();			
			}
		});
	});
 	
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
/* 로그인 화면 css */
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
	/* color: orangered; */
	color:black;
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
	font-size: 16px;
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
dd {
	margin-left: 94px;
	border-bottom: 1px dotted #D5D5D5;
	padding: 7px;
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
	<!-- <div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#FEFCF0;">
	
	
	</div> -->


	<!-- 로그인화면구현 -->
	<div class="container" style="padding-top: 20px; border-radius: 10px;">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="nomember-form-link">비회원 로그인</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="login.do" method="post" role="form" style="display: block;">
									<div style="float: left; background: url('../image/exclamation-point.png') no-repeat 90px 0; top:15px; left:-247px; width: 247px; text-align: center; line-height: 17px;">
										<img src="../image/exclamation-point.png">
										<p style="vertical-align: baseline; word-break:break-all; padding-top:7px;">
											귀하의 정보보호를 위해 실제 사용자가 
											<br>
											요청을 보내고 있는지  
											<br>
											확인하는 절차를 거치고 있습니다.
										</p>
									</div>
									<c:if test="${!empty cookieMid }">
										<div class="form-group" style="text-align: right; padding-right: 10px;">
											<input type="text" name="mid" id="mid" tabindex="1"
												value="${cookieMid }" style="padding-left: 40px; background: url(../image/profile.png) no-repeat 20px;">
										</div>
									</c:if>
									<c:if test="${empty cookieMid }">
										<div class="form-group" style="text-align: right; padding-right: 10px;">  
											<input type="text" name="mid" id="mid" tabindex="1"
												placeholder="ID" value="" style="padding-left: 40px; background: url(../image/profile.png) no-repeat 20px;">
										</div>
									</c:if>
									<c:if test="${!empty cookiePwd }">
										<div class="form-group" style="text-align: right; padding-right: 10px;">
											<input type="password" name="pwd" id="pwd" tabindex="2"
												value="${cookiePwd }" style="background: url(../image/padlock.png) no-repeat 20px; padding-left: 40px;">
										</div>
									</c:if>
									<c:if test="${empty cookiePwd }">
										<div class="form-group" style="text-align: right; padding-right: 10px;">
											<input type="password" name="pwd" id="pwd" tabindex="2" placeholder="Password" value="" style="background: url(../image/padlock.png) no-repeat 20px; padding-left: 40px;">
										</div>
									</c:if>
									<div class="form-group text-center">
										<c:if test="${!empty cookieMid}">
											<input type="checkbox" tabindex="3" class=""
												name="checkBoxMid" id="remember" checked="checked">
											<label for="remember"> 아이디 저장</label>
										</c:if>
										<c:if test="${empty cookieMid}">
											<input type="checkbox" tabindex="3" class=""
												name="checkBoxMid" id="remember">
											<label for="remember"> 아이디 저장</label>
										</c:if>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit"
													tabindex="4" class="form-control btn btn-login" value="로그인">
											</div>
										</div>
									</div>
								</form>
								<!-- 비회원로그인 -->
								<div id="nomember-form" role="form" style="display: none;">
									<div style="text-align: center;">
										<p id="service" style="float:left; padding-top: 9px; font-size: 15px;">
											<b style="padding-left: 25px;">이용할 서비스를 선택해주세요.</b>
										</p>
										<button class="btn-nomember" id="btn-nomember1"
											style="padding-top: 15px; padding-right: 7px;">비회원예매</button>
										<button class="btn-nomember" id="btn-nomember2"
											style="padding-top: 15px; padding-rigth: 7px;">비회원
											예매확인/취소</button>
										<input type="hidden" id="logintype" name="type" />
									</div>
									<hr style="border: 1px solid #e9e9e9;">
									<dl>
										<dt style="text-align: right; float: left;">
											비회원 로그인
											<br>
											이용안내
										</dt>
										<dd>
											<strong>비회원 예매 시 청소년 관람불가 영화는 예매가 제한됩니다.</strong>
										</dd>
										<dd>
											비회원 예매 결제수단은 신용카드만 가능하며 모든 제휴상품권, 쿠폰, 영화 예매권 등의 사용은 회원 예매 서비스 이용 시 가능합니다. 
										</dd>
										<dd>
											모바일과 ARS에서는 취소가 불가능 하며, 홈페이지를 이용하여 입력하신 로그인 정보로 취소 처리 하실 수 있습니다.
										</dd>
										<dd>
											비회원 예매 및 비회원 예매 확인 / 취소 메뉴만 이용 가능합니다.이 외에 평점, 댓글, 인정 등의 서비스는 회원 가입 후 이용 가능합니다.
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr style="margin-top: 2px;">
	<div style="margin-left: 25%;">
		<label style="color:white;">아직 Charlie's box의 회원이 아니신가요?</label> 
		<label style="font-size: 12px; color: gray;">회원가입하시고 다양한 혜택을 누리세요.</label> 
		<a href="join.do" style="padding-left: 20%;"> 
			<input type="button" name="btn-join" value="회원가입" style="border:1px solid #EAEAEA; background-color: white; color: black; border-width: medium;" />
		</a> 
		<br>

		<!-- 아이디찾기 -->
		<!-- Trigger the modal with a button -->
		<div style="padding-top: 10px;">
			<label style="color:white;">아이디를 잊으셨나요?</label> 
			<a style="padding-left: 44%;"> 
				<input type="button" data-toggle="modal" data-target="#myModal" value="아이디찾기" style="border:1px solid #EAEAEA; background-color: white; color: black; border-width: medium;" />
			</a>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">아이디찾기</h4>
						</div>
						<div class="modal-body">
							<form id="form" action="idFind.do" method="post">
								<p>
									<span>이름</span><br>
									<input type="text" name="name" id="name" placeholder="" />
								</p>
								<p>
									<span>핸드폰번호</span><br>
									<input type="text" name="front" id="front" value="" />-
									<input type="text" name="middle" id="middle" value="" />- 
									<input type="text" name="end" id="end" value="" /> 
									<input type="hidden" name="phone" id="phone" />
								</p>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" id="submitForm" class="btn btn-default">확인</button>
						</div>
					</div>

				</div>
			</div>

		</div>

		<!-- 비밀번호찾기 -->
		<!-- Trigger the modal with a button -->
		<div style="padding-top: 10px;">
			<label style="color:white;">비밀번호를 잊으셨나요?</label> <a style="padding-left: 43%;"> <input
				type="button" data-toggle="modal" data-target="#myModal2"
				value="비밀번호찾기"
				style="border:1px solid #EAEAEA; background-color: white; color: black; border-width: medium;" />
			</a>
			<!-- Modal -->
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">비밀번호 찾기</h4>
						</div>
						<div class="modal-body">
							<p>
								아이디 <input type="text" name="id" id="id" placeholder="" />
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" id="psubmitForm" class="btn btn-default">조회</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

	<hr>
</body>
</html>