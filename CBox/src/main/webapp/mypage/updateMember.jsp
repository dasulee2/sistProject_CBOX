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
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: powderblue;
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
/* 테이블ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ */
table {
	width:80%;
	height:500px;
	margin:0 auto;	
	border-top: 2px solid black;
	margin-top: 50px;
}
th, td{
	border-bottom:1px solid #ddd;
	padding:5px;
}
th {
	background-color: #F8F8F8;
	width: 23%;
	font-size: 17px;
}
td {
	padding-left: 15px;
	text-align: left;
	font-size: 17px;
}
.span {
	padding-left:10px;
	font-size: 17px;
}
.glyphicon-ok {
	color: orange;
}
.check {
	border-color: black;
	background-color: black;
	color:white;
	border-radius:3px;
	padding: 3px;
}
caption {
	font-size: 22px;
	color:#222;
	font-weight: normal;
}
.okBtn {
	display:inline-block;
	border-radius:3px;
	border:1px solid #333;
	background-color: #333;
	font-weight:bold;
	color: white;
	min-width: 160px;
	min-height: 40px;
}
.cancelBtn {
	display:inline-block;
	border-radius:3px;
	border:1px solid #333;
	background-color: #fff;
	font-weight:bold;
	min-width: 160px;
	min-height: 40px;
}
#cbox:hover{
	text-decoration: none;
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
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My Movie</a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WishList</a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movie Diary</a></li>
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
	
	<div class="container" style="border:1px thin silver;  margin-left:296px; width: 78%; border-radius:6px; border:1px solid #EEEEEE; background:#EEEEEE; padding:10px;">	
			<br>	
			
		<div>
			<h1 style="margin-left:30px; padding-top: 50px; font-size: 50px;"><b>회원정보 수정</b></h1>
			<span style="margin-left:30px;"> 회원님의 정보를 소중하게 관리하세요.</span>
		</div>
		<!-- 회원 정보 수정 -->
		<form action="updateMember.do" method="post" onsubmit="return validate()">
			<table>
				<caption>회원정보 수정</caption>
				<tr>
					<th>
						<span class="span">아이디</span>
					</th>
					<td>
						<span name="mid" id="mid">${m.mid }</span>
						<%-- <input type="text" name="mid" id="mid" placeholder="${m.mid }" readonly="readonly"/> --%>
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">비밀번호</span>
					</th>
					<td>
						<input type="password" name="pwd" id="pwd1" placeholder="${m.pwd }" style="width:180px; height: 40px;"/>
						<p style="font-size: 13px; color:gray; padding-top:10px;">4~12자리를 입력하세요.
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">비밀번호 확인</span>
					</th>
					<td>
						<input type="password" name="pwd2" id="pwd2" placeholder="${m.pwd }" onkeyup="pwdCheck()" style="width:180px; height: 40px;"/>
						<span id="pwdchk"></span>
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">이름</span>
					</th>
					<td>
						<span name="name" id="name">${m.name }</span>
						<%-- <input type="text" name="name" id="name" placeholder="${m.name }" readonly="readonly"/> --%>
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">전화번호</span>
					</th>
					<td>
						<select id="front" style="width:180px; height: 40px; text-align-last: center; font-size: 17px;">
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">017</option>
							<option value="010">018</option>
							<option value="010">019</option>
						</select>-
						<input type="text" name="middle" id="middle" placeholder="" style="width:180px; height: 40px;"/>-
						<input type="text" name="end" id="end" placeholder="" style="width:180px; height: 40px;"/>
						<input type="hidden" name="phone" id="phone" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">성별</span>
					</th>
					<td>
						<span name="gender" id="gender">${m.gender}</span>
						<%-- <input type="text" name="gender" id="gender" value="${m.gender}" readonly="readonly"/> --%>
					</td>
				</tr>
				<tr>
					<th>
						<span class="span">생년월일</span>
					</th>
					<td>
						<span name="birthday" id="birthday">${m.birthday }</span>
						<%-- <input type="text" name="birthday" id="birthday" value="${m.birthday }" readonly="readonly"/> --%>
					</td>
				</tr>
			</table>
			<div style="text-align: center; padding-top:15px;">
				<input type="submit" class="okBtn" value="확인"/>
				<a href="memberInfo.do"><input type="button" class="cancelBtn" value="취소"/></a>
			</div>
			<br><br>
		</form>
	</div>
		<br><br>
	</div>
</body>
</html>