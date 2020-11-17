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
		/* var phones= $("#phone").val().split("-");
		$("#phone1").val(phones[0]);
		$("#phone2").val(phones[1]);
		$("#phone3").val(phones[2]); */
		
		$(".reset").click(function(){
			var id = $(this).attr("id");
			if(id=='r1'){
				$(".rphone1").val("");
				$(".rphone1").prop('readonly',false);
				var amount = parseInt($("#amount1").text())-1;
				$("#amount1").text(amount);
				$("#amount").val(amount);
				var price = parseInt($("#price").text());
				var total = parseInt(amount*price);
				$("#total1").text(total);
				$("#total").val(total);
				$(".rphone1").css({
					'background-color':'white',
					'border-color':'black',
					'border-width':'thin'
				});
				$("#r1CK").val("nonCK");
			}else if(id=='r2'){
				$(".rphone2").val("");
				$(".rphone2").prop('readonly',false);
				var amount = parseInt($("#amount1").text())-1;
				$("#amount1").text(amount);
				$("#amount").val(amount);
				var price = parseInt($("#price").text());
				var total = parseInt(amount*price);
				$("#total1").text(total);
				$("#total").val(total);
				$(".rphone2").css({
					'background-color':'white',
					'border-color':'black',
					'border-width':'thin'
				});
				$("#r2CK").val("nonCK");
			}else if(id=='r3'){
				$(".rphone3").val("");
				$(".rphone3").prop('readonly',false);
				var amount = parseInt($("#amount1").text())-1;
				$("#amount1").text(amount);
				$("#amount").val(amount);
				var price = parseInt($("#price").text());
				var total = parseInt(amount*price);
				$("#total1").text(total);
				$("#total").val(total);
				$(".rphone3").css({
					'background-color':'white',
					'border-color':'black',
					'border-width':'thin'
				});
				$("#r3CK").val("nonCK");
			}else if(id=='r4'){
				$(".rphone4").val("");
				$(".rphone4").prop('readonly',false);
				var amount = parseInt($("#amount1").text())-1;
				$("#amount1").text(amount);
				$("#amount").val(amount);
				var price = parseInt($("#price").text());
				var total = parseInt(amount*price);
				$("#total1").text(total);
				$("#total").val(total);
				$(".rphone4").css({
					'background-color':'white',
					'border-color':'black',
					'border-width':'thin'
				});
				$("#r4CK").val("nonCK");
			}else if(id=='r5'){
				$(".rphone5").val("");
				$(".rphone5").prop('readonly',false);
				var amount = parseInt($("#amount1").text())-1;
				$("#amount1").text(amount);
				$("#amount").val(amount);
				var price = parseInt($("#price").text());
				var total = parseInt(amount*price);
				$("#total1").text(total);
				$("#total").val(total);
				$(".rphone5").css({
					'background-color':'white',
					'border-color':'black',
					'border-width':'thin'
				});
				$("#r5CK").val("nonCK");
			}
		});
		
		$(".search").click(function(){
			var id = $(this).attr("id");
			if(id=='r1'){
				if($("#rphone1-1").val()==""||$("#rphone1-2").val()==""||$("#rphone1-3").val()==""){
					alert("핸드폰 번호를 입력해주세요");
				}else{
					var rphone1 = $("#rphone1-1").val()+"-"+$("#rphone1-2").val()+"-"+$("#rphone1-3").val();
					 $.ajax({
						url:"../shop/phoneCheck.do",
						data:{"phone":rphone1},
						type:"POST",
						dataType:"text",
						error:function(jqXHR){
							alert(jqXHR.status);
						},
						success:function(responseData){	
							if($.trim(responseData)=="checkX"){
								$("#r1CK").val('X');
								alert("회원목록에 없는 번호입니다.");
							}else{
								
								$("#r1CK").val('O');
								$("#rphone1").val(rphone1);
								$(".rphone1").prop('readonly',true);
								var amount = Number($("#amount1").text())+1;
								$("#amount1").text(amount);
								$("#amount").val(amount);
								var price = Number($("#price").text());
								var total = Number((amount)*(price));
								$("#total1").text(total);
								$("#total").val(total);
								$(".rphone1").css({
									'background-color':'silver',
									'border-color':'black',
									'border-width':'thin'
								});
							}
						}
					});	 
				}
			}else if(id=='r2'){
				if($("#rphone2-1").val()==""||$("#rphone2-2").val()==""||$("#rphone2-3").val()==""){
					alert("핸드폰 번호를 입력해주세요");
				}else{
					var rphone1 = $("#rphone2-1").val()+"-"+$("#rphone2-2").val()+"-"+$("#rphone2-3").val();
					 $.ajax({
						url:"../shop/phoneCheck.do",
						data:{"phone":rphone1},
						type:"POST",
						dataType:"text",
						error:function(jqXHR){
							alert(jqXHR.status);
						},
						success:function(responseData){	
							if($.trim(responseData)=="checkX"){
								$("#r2CK").val('X');
								alert("회원목록에 없는 번호입니다.");
							}else{
								$("#r2CK").val('O');
								$("#rphone2").val(rphone1);
								$(".rphone2").prop('readonly',true);
								var amount = Number($("#amount1").text())+1;
								$("#amount1").text(amount);
								$("#amount").val(amount);
								var price = Number($("#price").text());
								var total = Number((amount)*(price));
								$("#total1").text(total);
								$("#total").val(total);
								$(".rphone2").css({
									'background-color':'silver',
									'border-color':'black',
									'border-width':'thin'
								});
							}
						}
					});	 
				}
			}else if(id=='r3'){
				if($("#rphone3-1").val()==""||$("#rphone3-2").val()==""||$("#rphone3-3").val()==""){
					alert("핸드폰 번호를 입력해주세요");
				}else{
					var rphone1 = $("#rphone3-1").val()+"-"+$("#rphone3-2").val()+"-"+$("#rphone3-3").val();
					 $.ajax({
						url:"../shop/phoneCheck.do",
						data:{"phone":rphone1},
						type:"POST",
						dataType:"text",
						error:function(jqXHR){
							alert(jqXHR.status);
						},
						success:function(responseData){	
							if($.trim(responseData)=="checkX"){
								$("#r3CK").val('X');
								alert("회원목록에 없는 번호입니다.");
							}else{
								$("#r3CK").val('O');
								$("#rphone3").val(rphone1);
								$(".rphone3").prop('readonly',true);
								var amount = Number($("#amount1").text())+1;
								$("#amount1").text(amount);
								$("#amount").val(amount);
								var price = Number($("#price").text());
								var total = Number((amount)*(price));
								$("#total1").text(total);
								$("#total").val(total);
								$(".rphone3").css({
									'background-color':'silver',
									'border-color':'black',
									'border-width':'thin'
								});
							}
						}
					});	 
				}
			}else if(id=='r4'){
				if($("#rphone4-1").val()==""||$("#rphone4-2").val()==""||$("#rphone4-3").val()==""){
					alert("핸드폰 번호를 입력해주세요");
				}else{
					var rphone1 = $("#rphone4-1").val()+"-"+$("#rphone4-2").val()+"-"+$("#rphone4-3").val();
					 $.ajax({
						url:"../shop/phoneCheck.do",
						data:{"phone":rphone1},
						type:"POST",
						dataType:"text",
						error:function(jqXHR){
							alert(jqXHR.status);
						},
						success:function(responseData){	
							if($.trim(responseData)=="checkX"){
								$("#r4CK").val('X');
								alert("회원목록에 없는 번호입니다.");
							}else{
								$("#r4CK").val('O');
								$("#rphone4").val(rphone1);
								$(".rphone4").prop('readonly',true);
								var amount = Number($("#amount1").text())+1;
								$("#amount1").text(amount);
								$("#amount").val(amount);
								var price = Number($("#price").text());
								var total = Number((amount)*(price));
								$("#total1").text(total);
								$("#total").val(total);
								$(".rphone4").css({
									'background-color':'silver',
									'border-color':'black',
									'border-width':'thin'
								});
							}
						}
					});	 
				}
			}else if(id=='r5'){
				if($("#rphone5-1").val()==""||$("#rphone5-2").val()==""||$("#rphone5-3").val()==""){
					alert("핸드폰 번호를 입력해주세요");
				}else{
					var rphone1 = $("#rphone5-1").val()+"-"+$("#rphone5-2").val()+"-"+$("#rphone5-3").val();
					 $.ajax({
						url:"../shop/phoneCheck.do",
						data:{"phone":rphone1},
						type:"POST",
						dataType:"text",
						error:function(jqXHR){
							alert(jqXHR.status);
						},
						success:function(responseData){	
							if($.trim(responseData)=="checkX"){
								$("#r5CK").val('X');
								alert("회원목록에 없는 번호입니다.");
							}else{
								$("#r5CK").val('O');
								$("#rphone5").val(rphone1);
								$(".rphone5").prop('readonly',true);
								var amount = Number($("#amount1").text())+1;
								$("#amount1").text(amount);
								$("#amount").val(amount);
								var price = Number($("#price").text());
								var total = Number((amount)*(price));
								$("#total1").text(total);
								$("#total").val(total);
								$(".rphone5").css({
									'background-color':'silver',
									'border-color':'black',
									'border-width':'thin'
								});
							}
						}
					});	 
				}
			}
		});
		
		$("#submit").click(function(){
			
			if($("#r1CK").val()=='nonCK'&&$("#r2CK").val()=='nonCK'&&$("#r3CK").val()=='nonCK'&&$("#r4CK").val()=='nonCK'&&$("#r5CK").val()=='nonCK'){
				alert("핸드폰번호를 입력해주세요");
				return false;
			} else if($("#r1CK").val()=='X'||$("#r2CK").val()=='X'||$("#r3CK").val()=='X'||$("#r4CK").val()=='X'||$("#r5CK").val()=='X'){
				alert("수신자의 핸드폰번호를 확인해주세요");
				return false;
				
			}else{
				if($("#cardNum").val()==""){
					var cw=screen.availWidth;    
					var ch=screen.availHeight;    
					var ml=(cw-550)/2;        
					var mt=(ch-700)/2;        
					var price = $("total1").text();
					window.open("../shop/payment.do?price="+price,"결제","width=550px, height=750px, top="+mt+",left="+ml+", menubar=no, location=no, toolbar=no , fullscreen=no, scrollbars=yes");
					return false;
				}
			}
		
		});
		
		/* $("#submit").click(function(){
	
			
			if($("#r1CK").val()=='nonCK'&&$("#r2CK").val()=='nonCK'&&$("#r3CK").val()=='nonCK'&&$("#r4CK").val()=='nonCK'&&$("#r5CK").val()=='nonCK'){
				alert("핸드폰번호를 입력해주세요");
				return false;
			} else if($("#r1CK").val()=='X'||$("#r2CK").val()=='X'||$("#r3CK").val()=='X'||$("#r4CK").val()=='X'||$("#r5CK").val()=='X'){
				alert("수신자의 핸드폰번호를 확인해주세요");
				return false;
				
			}else{
				if($("#cardNum").val()==""){
					var cw=screen.availWidth;     
					var ch=screen.availHeight;   
					var ml=(cw-550)/2; 
					var mt=(ch-700)/2;         
					
					window.open("../shop/payment.do","결제","width=550px, height=750px, top="+mt+",left="+ml+", menubar=no, location=no, toolbar=no , fullscreen=no, scrollbars=yes");
					return false;
				}
			}
		
		}); */
		
	});
	
	$(document).ready(function() {
		//포인트조회
		$("#check").click(function() {
			$.ajax({
				type:"POST",
				url:"pointDetail.do",
				data:{"mid":$("#mid").val()},
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				/* success:function(responseData){
					if($.trim(responseData)=='yes'){
						alert("포인트조회성공");
					}else {
						$("possesion").html(0);
					}
				} */
				success:function(response) {
					//alert('123');
					var result = response;
					//alert(result);
					//alert(typeof result);
					var str = "<span>"+result+"<span>점";
					alert(str);
					$("#pCheck").html(str); 
				}
			});
		});
		
		//포인트사용
	});
	
	
	//포인트 사용
	/* alert('123');
	var result = response;
	alert(result);
	//alert(typeof result);
	var str = "<span>"+result+"<span>점";
	alert(str);
	$("#pCheck").html(str); 
	alert("dho?"); */
	$(document).ready(function() {
		//alert('123');
		$("#ok").click(function() {
			//alert('클릭');
			var point = $("#point").val();
			//alert(point);
			$.ajax({
				type:"POST",
				url:"pointUse.do",
				data:{"point":point},
				dataType:"text",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response) {
					if($.trim(response)=='yes') {
						$("#ok").prop('disabled', true);
						var amount = Number($("#amount1").text());
						//alert(amount);
						var price = Number($("#price").text())-point;
						$("#price").text(price);
						$("#price").val(price);
						//alert(price);
						var total = Number((amount)*(price));
						///alert(total);
						$("#total1").text(total);
						$("#total").val(total);	
					}else {
						alert("포인트조회를 눌러주세요.");
					}
				}
			});
		});
		
		$("#re").click(function() {
			$("#ok").prop('disabled', false);
			//alert($("#point").val());
			var amount = Number($("#amount1").text());
			//alert("ramount : "+amount);
			var price = Number($("#price").text())+parseInt($("#point").val());
			$("#price").text(price);
			$("#price").val(price);
			//alert("rprice : "+price);
			var total = Number((amount)*(price));
			//alert("rtotal : "+total);
			$("#total1").text(total);
			$("#total").val(total);
			$("#point").val(0);
		});
		
	});
	
</script>
<title>Insert title here</title>
<style type="text/css">
.container span hr input h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
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
	margin:auto;
	width:90%;
	height: 450px;
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
#giftyconInfo{
	width:100%;
	height:300px;
	border: 1px solid black;
	border-radius: 10px;
	margin-bottom: 5px;
}
#giftyconInfo img{
	width: 300px;
	height: 295px;
	float:left;
	border-radius: 10px;
}
#giftyconInfo table{
	margin-top: 50px;
}
#th{
	width:400px;
	text-align:center;
	font-size: 17px;
	font-family: "나눔바른고딕";
	padding-top:10px;
}
#td{
	width:400px;
	text-align:center;
	font-family: "나눔바른고딕";
	font-size: 30px;
}
#num{
	margin-top:50px;
	margin-bottom:20px;
	width:100%;
	height: 50px;
	background-color: #1E486A;
	color: white;
	font-family: "나눔바른고딕";
	text-align: left;
	padding-left:15px;
	padding-top:8px;
	font-size:20px;
	font-weight: bold;
}
#phoneInfo{
	text-align: left;
	font-family: "나눔바른고딕";
	color:black;
}
.reset{
	float: right; 
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #4C4C4C;
	border-radius: 3px;
	font-size: 17px;
	width:60px;
	text-align: center;
}
.reset:HOVER {
	text-decoration: none;
	cursor: pointer;
}
.search{ 
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #CC3D3D;
	border-radius: 3px;
	font-size: 17px;
	padding-left:10px;
	padding-right:10px;
	padding-top:3px;
	padding-bottom:3px;
	text-align: center;
}
.search:HOVER {
	text-decoration: none;
	cursor: pointer;
}
#check {
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #CC3D3D;
	border-radius: 3px;
	font-size: 17px;
	padding-left:10px;
	padding-right:10px;
	padding-top:3px;
	padding-bottom:3px;
	text-align: center;
}

#ok {
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #CC3D3D;
	border-radius: 3px;
	font-size: 17px;
	padding-left:10px;
	padding-right:10px;
	padding-top:3px;
	padding-bottom:3px;
	text-align: center;
}
#ok:HOVER {
	text-decoration: none;
	cursor: pointer;
}
#re {
	float: right; 
	margin-right:10px; 
	background-color:white; 
	border: 2px solid #4C4C4C;
	border-radius: 3px;
	font-size: 17px;
	width:60px;
	text-align: center;
}
#re:HOVER {
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
	<br>
	<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px; padding-bottom: 50px;">
		<div class="container"style="width: 90%;">
			<br>
			<div >
				<h3  style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;">주문정보입력</h3>
			</div>
			<hr>
			<div class="agile_top_brands_grids" id="detaildiv">
			<form action="../shop/giftyconBuy.do" method="post">
			<div  id="num">
				<p>01 상품정보</p>
			</div>
			<c:forEach var="giftycon" items="${gList }">
				<div id="giftyconInfo" >
					<img src="${giftycon.image }">
					<input type="hidden" name="giftyconCode" value="${giftycon.giftyconCode }">
					<table>
						<tr><th id="th">상품</th><th id="th">판매가</th></tr>
					</table>
					<hr style="width: 60%; padding:0; margin-top:10px;; border-color:#BDBDBD;">
					<table>
						<tr><td id="td">${giftycon.giftyconName }<br><span style="font-size:14px">${content1 }</span></td><td id="td"><fmt:formatNumber value="${giftycon.price }"  groupingUsed="true"/>원</td></tr>
					</table>
				</div>
			</c:forEach>
			<div  id="num">
				<p>02 연락처를 입력해주세요</p>
			</div>
			<div id="phoneInfo">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">구매하는 분</p>
					<p style="font-size:16px; margin-left:10px;">이름 |&nbsp&nbsp&nbsp ${m.name }    &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp휴대폰 번호  |&nbsp &nbsp &nbsp${m.phone }
					</p>
					<hr style="border: 1px solid black;">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
					<p style="font-size:16px; margin-left:10px;">1 &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp
						<input type="text" class="rphone1" id="rphone1-1" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone1" id="rphone1-2" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone1" id="rphone1-3" style="width:100px; height: 30px;">
						<input type="hidden" class="rphone1"  id="rphone1" name="rphone">
						&nbsp&nbsp<a class="search" id="r1">조회</a>
						<input type="hidden" class="rphone" id="r1CK" value="nonCK">
						<a style="" class="reset" id="r1">초기화</a>
					</p>
					<hr style="border: 1px solid sliver;">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
					<p style="font-size:16px; margin-left:10px;">2 &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp
						<input type="text"  class="rphone2" id="rphone2-1" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone2"  id="rphone2-2" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone2"  id="rphone2-3" style="width:100px; height: 30px;">
						<input type="hidden" class="rphone2"  id="rphone2" name="rphone">
						&nbsp&nbsp<a class="search" id="r2">조회</a>
						<input type="hidden" class="rphone"  id="r2CK" value="nonCK">
						<a style="  "class="reset" id="r2">초기화</a>
					</p>
					<hr style="border: 1px solid sliver;">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
					<p style="font-size:16px; margin-left:10px;">3 &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp
						<input type="text" class="rphone3"  id="rphone3-1" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone3"  id="rphone3-2" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone3"  id="rphone3-3" style="width:100px; height: 30px;">
						<input type="hidden" class="rphone3"  id="rphone3" name="rphone">
						&nbsp&nbsp<a class="search" id="r3">조회</a>
						<input type="hidden" class="rphone" id="r3CK" value="nonCK">
						<a style="  "class="reset" id="r3">초기화</a>
					</p>
					<hr style="border: 1px solid sliver;">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
					<p style="font-size:16px; margin-left:10px;">4 &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp
						<input type="text" class="rphone4"  id="rphone4-1" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone4"  id="rphone4-2" style="width:100px; height: 30px;"> -
						<input type="text" class="rphone4"  id="rphone4-3" style="width:100px; height: 30px;">
						<input type="hidden" class="rphone4"  id="rphone4" name="rphone">
						&nbsp&nbsp<a class="search" id="r4">조회</a>
						<input type="hidden" class="rphone" id="r4CK" value="nonCK">
						<a style="  "class="reset" id="r4">초기화</a>
					</p>
					<hr style="border: 1px solid sliver;">
					<p style="font-size:18px; margin-left: 10px; font-weight: bold;">사용하는 분</p>
					<p style="font-size:16px; margin-left:10px;">5 &nbsp&nbsp&nbsp &nbsp휴대폰 번호  &nbsp
						<input type="text" class="rphone5"  id="rphone5-1" style="width:100px; height: 30px;"> -
						<input type="text"  class="rphone5" id="rphone5-2" style="width:100px; height: 30px;"> -
						<input type="text"  class="rphone5" id="rphone5-3" style="width:100px; height: 30px;">
						<input type="hidden" class="rphone5" id="rphone5" name="rphone">
						&nbsp&nbsp<a class="search"  class="rphone5" id="r5">조회</a>
						<input type="hidden" class="rphone" id="r5CK" value="nonCK">
						<a style=""class="reset" id="r5">초기화</a>
					</p>
					<hr style="border: 1px solid black;">
			</div>
			<!-- 포인트 사용 -->
			<div id="num">
				<p>03 사용할 포인트를 선택하세요.</p>
			</div>
			<p style="font-size: 18px; margin-left: 10px; font-weight: bold; text-align: left;">
				Charlie's box 포인트
				<a id="check">조회</a>
			</p>
			<br>
			<hr style="border: 1px solid black;">
			<div style="text-align: left;">
				<input type="hidden" id="mid" name="mid" value="${m.mid }"/>
				<p style="font-size: 16px; margin-left: 10px;">보유 포인트&nbsp;&nbsp;&nbsp;<span id="pCheck"></span></p>
				<br>
				<p style="font-size: 16px; margin-left: 10px;">
					사용할 포인트
					<input type="text" class="pointuse" id="point" name="point" value="0" style="width: 100px; height: 30px; text-align: left;"/>점
					<a id="ok">확인</a><a id="re">초기화</a><br>
					<span style="font-size: small; color:#A50000; margin-left: 10px;">※구매시 포인트를 사용하시면, 포인트 적립이 되지 않습니다.</span>
				</p>
				
			</div>
			<hr style="border: 1px solid black;">
			<br>
			<span style="float: right; font-size:20px;">최종 결제 금액&nbsp&nbsp<span style="font-weight: bold; color:#4C4C4C;"><span id="amount1">0</span> X <span id="price">${price }</span> = <span id="total1">0</span>원</span></span>
			<br>
			<br>
			<input type="hidden" name="cardNum" id="cardNum">
			<input type="hidden" name="total" id="total">
			<input type="hidden" name="amount" id="amount">
			<input id="submit" style="float: right; font-size:18px; margin-right: 10px; width:100px;" type="submit" class='btn btn-danger add-to-cart' value="결제하기">
			<br><br>
			</form>
			</div>
			<br><br>
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