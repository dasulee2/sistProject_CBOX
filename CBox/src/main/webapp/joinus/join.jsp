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
	$(document).ready(function() {
		var count = 0;
		
		$("#check").click(function() {
			var mid = $("#mid").val();
			//alert("mid : "+mid);
			if(mid=="") {
				alert("아이디를 입력하세요.");
			}else {
				//alert("아이디");
				$.ajax({
					type:"POST",
					url:"idCheck.do",
					data:{"mid":$("#mid").val()},
					dataType:"text",
					error:function(jqXHR){
						alert(jqXHR.status);
						//alert(jqXHR.statuesText);
						//alert(jqXHR.responseText);
						//alert(jqXHR.readyState);
					},
					success:function(responseDate){
						if($.trim(responseDate)=="YES"){
							//alert("사용가능");
							count=1;
							$("#idcheck").css("color", "black");
							$("#idchk").html('<b>사용가능한 ID입니다.</b>');
						}else {
							//alert("사용불가");
							count=0;
							$("#idcheck").css("color", "red");
							$("#idchk").html('<b>이미 등록된 ID입니다.</b>');
						}
					}
				});
			}
		});
		
			//input태그에 key이벤트 연결
			$('#form #mid').keyup(function(){
				count = 0;
				$('#idchk').html('');
			});
			
			$('#form').submit(function(){
				var mid = $("#mid").val();
				if(mid=="") {
					alert("아이디를 입력하세요.");
					return false;
				}else if(mid.indexOf(" ")>=0) {
					alert("아이디에 공백을 사용할 수 없습니다.");
					return false;
				}else if(count == 0){
					alert('아이디 중복체크 필수');
					if($('#mid').val() == '') {
						$('#mid').focus();
					}else {
						$('#check').focus();
					}
					return false;
				}else if($("#pwd1").val()=="" || $("#pwd2").val()=="") {
					alert("비밀번호를 입력하세요.");
					return false;
				}else if($("#middle").val()=="" || $("end").val()=="") {
					alert("전화번호는 필수입력사항입니다.");
					return false;
				}else if($("#name").val()=="") {
					alert("이름은 필수입력사항입니다.");
					return false;
				}else {
					phone=$("#front").val()+"-"+$("#middle").val()+"-"+$("#end").val();
					$("#phone").val(phone);
					
					var birthday = $("#bfront").val()+"-"+$("#bmiddle").val()+"-"+$("#bend").val();
					//alert(birthday);
					$("#birthday").val(birthday);
					alert('환영합니다');
				}
				
			});
		});


	
	function pwdCheck() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if(pwd1!=pwd2) {
			$("#pwdchk").css("color","red");
			$("#pwdchk").text("동일한 암호를 입력하세요.");
		}else {
			$("#pwdchk").css("color","black");
			$("#pwdchk").text("암호가 일치합니다.");
		}
		if(pwd1.length<4 || pwd1.length>12) {
			alert("비밀번호 4~12자리로 입력해주세요.");
			return false;
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
/* 테이블ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ */
table {
	width:60%;
	height:500px;
	margin:0 auto;	
	border-top: 2px solid black;
	margin-top: 70px;
}
th, td{
	border-bottom:1px solid #ddd;
	padding:5px;
}
th {
	background-color: #F8F8F8;
	width: 23%;
	font-size: 15px;
}
td {
	padding:7px;
	text-align: left;
}
.span {
	padding-left:10px;
}
.glyphicon-ok {
	color: firebrick;
}
.check1 {
	border-color: #333;
	background-color: #333;
	color:white;
	border-radius:3px;
	padding: 3px;
}
caption {
	font-size: 22px;
	color:#222;
	font-weight: normal;
}
.joinbtn {
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
.cancelBtn {
	display:inline-block;
	border-radius:3px;
	border:1px solid #333;
	background-color: #fff;
	font-weight:bold;
	min-width: 160px;
	min-height: 40px;
	font-size: 17px;
	
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
	<div style="margin:auto; width:80%; height: 1000px; text-align: center; background:#EAEAEA; border-radius: 10px;">
		<!-- 회원가입 -->
	<form id="form" action="join.do" method="post">
		<div>
			<h1 style="padding-top: 50px; font-size: 50px;"><b>회원가입</b></h1>
			<span>Charlie's Box에 오신걸 환영합니다.</span>
		</div>
		<table>
			<caption>회원 정보 입력 </caption>
			<caption style="text-align: right; font-size: 13px;"><span class="glyphicon glyphicon-ok"></span>표시 항목은 필수입니다.</caption>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">아이디</span>
				</th>
				<td>
					<input type="text" name="mid" id="mid" placeholder="" maxlength="10" style="width:180px; height: 40px;"/>
					<input type="button" class="check1" name="check" id="check" value="중복확인" style="width:80px; height: 40px; font-size: 15px;"/>
					<span id="idchk"></span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">비밀번호</span>
				</th>
				<td>
					<input type="password" name="pwd" id="pwd1" placeholder="" style="width:180px; height: 40px;"/>
					<p style="font-size: 13px; color:gray; padding-top:10px;">4~12자리를 입력하세요.
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">비밀번호 확인</span>
				</th>
				<td>
					<input type="password" name="pwd2" id="pwd2" placeholder="" onkeyup="pwdCheck()" style="width:180px; height: 40px;"/>
					<span id="pwdchk"></span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">이름</span>
				</th>
				<td>
					<input type="text" name="name" id="name" placeholder="" style="width:180px; height: 40px;"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">전화번호</span>
				</th>
				<td>
					<select id="front" style="width:180px; height: 40px; text-align: center; font-size: 15px;">
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">017</option>
						<option value="010">018</option>
						<option value="010">019</option>
					</select>-
					<input type="text" name="middle" id="middle" placeholder="" maxlength="4" style="width:180px; height: 40px;"/>-
					<input type="text" name="end" id="end" placeholder="" maxlength="4" style="width:180px; height: 40px;"/>
					<input type="hidden" name="phone" id="phone"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">성별</span>
				</th>
				<td>
					<input type="radio" name="gender" id="gender" value="남성" style="width:18px; height:18px;"/><span style="font-size: 15px;">남성</span>
					<input type="radio" name="gender" id="gender" value="여성" style="width:18px; height:18px; margin-left:10px;"/><span style="font-size: 15px;">여성</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="span">생년월일</span>
				</th>
				<td>
					<select id="bfront" style="width:180px; height: 40px; text-align-last: center; font-size: 15px;">
						<c:forEach var="bfront" begin="1930" end="2017">
							<option>${bfront }</option>
						</c:forEach>
					</select>년
					<select id="bmiddle" style="width:180px; height: 40px; text-align-last: center; font-size: 15px;">
						<c:forEach var="bmiddle" begin="1" end="12">
							<option>${bmiddle }</option>
						</c:forEach>
					</select>월
					<select id="bend" style="width:180px; height: 40px; text-align-last: center; font-size: 15px;">
						<c:forEach var="bend" begin="1" end="31">
							<option>${bend }</option>
						</c:forEach>
					</select>일
					<input type="hidden" name="birthday" id="birthday"/>
				</td>
			</tr>
		</table>
		<div style="text-align: center; padding-top:15px;">
			<input type="hidden" id="idCheck" value=""/>
			<input type="submit" class="joinbtn" value="회원가입"/>
			<a href="login.do"><input type="button" class="cancelBtn" value="취소"/></a>
		</div>
	</form>
	
	</div>
	
</body>
</html>