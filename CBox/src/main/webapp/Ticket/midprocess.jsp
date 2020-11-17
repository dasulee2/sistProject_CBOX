<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//alert('123');
	$("#ok").click(function() {
		//alert('클릭');
		var point =	Number($("#remain").text());
		//alert(point);
		//alert(typeof point);
		$.ajax({
			type:"POST",
			url:"pointUse.do",
			data:{"point":$("#point").val()},
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
					var dpoint = $("#point").val();
					//alert(dtotal);
					$("#dpoint").text(dpoint);
					$("#dpoint").val(dpoint);
					var total = Number($("#total").text())-$("#point").val();
					$("#total").text(total);
					$("#total").val(total);
				}else {
					alert("포인트조회를 눌러주세요.");
				}
			}
		});
	});
	
	$("#re").click(function() {
		//var point =	Number($("#remain").text());
		$(".code").prop('disabled', false);
		$(".gcode").prop('disabled', false);
		$("#ok").prop('disabled', false);
		var dpoint = Number($("#dpoint").text())-$("#point").val();
		//alert("dtotal : "+dtotal);
		$("#dpoint").text(dpoint);
		$("#dpoint").val(dpoint);
		var total = Number($("#total").text())+parseInt($("#point").val());
		//alert(total);
		$("#total").text(total);
		$("#total").val(total);
		$("#point").val(0);
	});
	
	$(".code").on("click", function() {
		var code = $(this).attr('value');
		var total=Number($("#total").text());
		var dealnum = $(this).find("#gdealNum").val();
		$("#dealnum").val(dealnum);
		$("#code").val(code);
		//alert("dealnum :"+dealnum);
		//alert(total);
		//alert(code);
			$.ajax({
				type:"POST",
				url:"usecoupon.do",
				data:{"couponCode":code, "total":total},
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response) {
					//alert('123');
					$(".code").prop('disabled', true);
					$(".gcode").prop('disabled', true);
					$("#ok").prop('disabled', true);
					$("#re").prop('disabled', true);
					$("#reset2").prop('disabled', true);
					var result = response;
					//alert(result);
					//alert(typeof result);
					var str = "<span>"+result+"<span>";
				//	alert(str);
					$("#pCheck").html(str);
					if(result!=0) {
						//var dpoint = $("#dpoint").val(result);
						//alert(dtotal);
						$("#dpoint").text(result);
						$("#dpoint").val(result);
						var total = Number($("#total").text())-result;
						$("#total").text(total);
						$("#total").val(total);
					}
				}
			});
	});
	
	$(".gcode").on("click", function() {
		var gcode = $(this).find("a").attr('value');
		//alert("gcode : "+gcode);
		$("#code").val(gcode);
		var total=Number($("#total").text());
		//alert("total :"+total);
		var dealnum = $(this).find("#cdealNum").val();
		//alert("dealnum :"+dealnum);
		$("#dealnum").val(dealnum);
			$.ajax({
				type:"POST",
				url:"usemovie.do",
				data:{"giftyconCode":gcode, "total":total},
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statuesText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response) {
					//alert('123');
					$(".code").prop('disabled', true);
					$(".gcode").prop('disabled', true);
					$("#ok").prop('disabled', true);
					$("#re").prop('disabled', true);
					$("#reset1").prop('disabled', true);
					
					var result = response;
					//alert(result);
					//alert(typeof result);
					var str = "<span>"+result+"<span>";
					//alert(str);
					$("#free").html(str);
					if(result!=0) {
						//var dpoint = $("#dpoint").val(result);
						//alert(dtotal);
						$("#dpoint").text(result);
						$("#dpoint").val(result);
						var total = Number($("#total").text())-result;
						$("#total").text(total);
						$("#total").val(total);
					}
				}
			});
	});
	
	$("#reset").click(function() {
		$(".code").prop('disabled', false);
		$(".gcode").prop('disabled', false);
		$("#ok").prop('disabled', false);
		$("#re").prop('disabled', false);
		$("#reset2").prop('disabled', false);
		
		var pCheck = $("#pCheck").text();
		//alert(pCheck);
		var dpoint = Number($("#dpoint").text())-pCheck;
		//alert("dpoint : "+dpoint);
		$("#dpoint").text(dpoint);
		$("#dpoint").val(dpoint);
		var total = Number($("#total").text())+parseInt(pCheck);
		//alert(total);
		$("#total").text(total);
		$("#total").val(total);
		$("#pCheck").text(0);
		var dealNum = $("#dealnum").val("");
		$("#dealNum").val(dealNum);
		//var code = $("#code").val();
		$("#code").val("");
	});
	
	$("#reset2").click(function() {
		$(".code").prop('disabled', false);
		$(".gcode").prop('disabled', false);
		$("#ok").prop('disabled', false);
		$("#re").prop('disabled', false);
		$("#reset1").prop('disabled', false);
		
		var free = $("#free").text();
		//alert(free);
		var dpoint = Number($("#dpoint").text())-free;
		alert("dpoint : "+dpoint);
		$("#dpoint").text(dpoint);
		$("#dpoint").val(dpoint);
		var total = Number($("#total").text())+parseInt(free);
		//alert(total);
		$("#total").text(total);
		$("#total").val(total);
		$("#free").text(0);
		var dealNum = $("#dealnum").val("");
		$("#dealNum").val(dealNum);
		//var code = $("#code").val();
		$("#code").val("");
	});
	
	//구매
	$("#btn_book").click(function(){
		var total=Number($("#total").text());
		//alert(total);
		var seat = $("#seat").text();
		var timeSeq = $("#timeSeq").val();
		var memberType = $("#memberType").val();
		//alert("비회원 "+memberType);
		var point = Number($("#point").val());
		var dpoint = Number($("#dpoint").text());
		var dealNum = Number($("#dealnum").val());
		var code = $("#code").val();
		
		/* alert("d 타입 : "+typeof dealNum);
		alert("code : "+code);
		alert("dealNum : "+dealNum);
		alert("타입 : "+typeof point);
		alert(point);
		alert(dpoint);
		alert(timeSeq);
		alert(seat); */
		if(total!='0'){
			var cw=screen.availWidth;    
			var ch=screen.availHeight;    
			var ml=(cw-550)/2;        
			var mt=(ch-700)/2;
			window.open("payPage.do?total="+total+"&code="+code+"&dealNum="+dealNum+"&dpoint="+dpoint+"&point="+point+"&timeSeq="+timeSeq+"&seat="+seat+"&memberType="+memberType,"결제","width=550px, height=750px, top="+mt+",left="+ml+", menubar=no, location=no, toolbar=no , fullscreen=no, scrollbars=yes");
			return false;
		}else {
			alert("예매가 완료되었습니다.");
			var url = "../mypage/myMovie.do?code="+code+"&dealNum="+dealNum+"&dpoint="+dpoint+"&point="+point+"&mid=${mid}";
			$(location).attr('href',url);
			//alert("결과창으로");
		}		
	});
});


</script>
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
.titlebar {
	width: 744px;
	display: block;
	position: relative;
	height: 33px;
	line-height: 33px;
	background-color: #333;
	color: #e0e0e0;
	clear:both;
	margin-left: 0;
}
.menu1 {
position:relative;
height:43px;
line-height: 43px; 
color:#333; 
font-weight: bold; 
font-size: 15px;
letter-spacing: -1px; 
text-indent: 14px; 
cursor: pointer; 
box-shadow: inset 0px 0px 4px rgba(161, 160, 153, 0.1); 
background-color: #dfded6;
}
.menu2 {
position:relative;
height:43px;
line-height: 43px; 
color:#333; 
font-weight: bold; 
font-size: 15px;
letter-spacing: -1px; 
text-indent: 14px; 
cursor: pointer; 
box-shadow: inset 0px 0px 4px rgba(161, 160, 153, 0.1); 
background-color: #dfded6;

}
.menu3 {
position:relative;
height:43px;
line-height: 43px; 
color:#333; 
font-weight: bold; 
font-size: 15px;
letter-spacing: -1px; 
text-indent: 14px; 
cursor: pointer; 
box-shadow: inset 0px 0px 4px rgba(161, 160, 153, 0.1); 
background-color: #dfded6;
}
.panel-title {
	display: block;
	width: 43px;
	height: 43px;
	position: absolute;
	top: 0px;
	right: 4px;
	overflow: hidden;
	/* background: url(../image/chevron-arrow-down.png) no-repeat 0 0; */
	-o-text-overflow:ellpsis;
	color:#333;
	padding-top:10px; 
}
.reset {
	display: block;
	position: absolute;
	top: 0;
	right: 16px;
	padding-right: 20px;
	background: url();
	color:#e6e6e6;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: -1px;
}
.total_header {
	height: 43px;
	line-height: 43px;
	background-color: #fff;
	font-size: 14px;
	border-radius:3px 3px 0 0;
	color:#333;
	font-weight: bold;
	letter-spacing: -1px;
	text-align: center;
}
.result {
	background-color: #474747;
	color:#fff;
	box-shadow: inset 0px 0px 10px #202020;
	height: 40px;
	line-height: 40px;
	border-radius:0 0 3px 3px;
	padding:0 7px;
	text-align: right;
	position: relative;
}
.payCheck {
	margin-top: 0px;
	width: 280px;
	margin:0 auto;
	border-radius:4px;
	background-color: #202020;
	padding:2px;
	font-size:12px;
	float:left;
	margin-left: 10px;
}
.discount {
	float:left;
	margin-top: 0px;
	width: 280px;
	margin:0 auto;
	border-radius:4px;
	background-color: #202020;
	padding:2px;
	font-size:12px;
	margin-left: 10px;
}
.discount_header {
	height: 43px;
	line-height: 43px;
	background-color: #fff;
	font-size: 14px;
	border-radius:3px 3px 0 0;
	color:#333;
	font-weight: bold;
	letter-spacing: -1px;
	text-align: center;
}
.result2 {
	background-color: #474747;
	color:#fff;
	box-shadow: inset 0px 0px 10px #202020;
	height: 40px;
	line-height: 40px;
	border-radius:0 0 3px 3px;
	padding:0 7px;
	text-align: right;
	position: relative;
}
#result{
	margin-top:1px;
	padding-bottom:10px;
	
}
#result div{
	border-right: 1px solid white;
	height: 116px;
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
#btn_book {
	width:100px; 
	height:80px; float: right; 
	padding-top:26px; font-weight:bold; 
	font-size:20px; 
	border:1px solid firebrick; 
	background-color: firebrick; 
	vertical-align: middle; 
	border-radius:4px; 
	color:white;
}
#btn_book2 {
	width:100px; 
	height:80px; float: right; 
	padding-top:26px; font-weight:bold; 
	font-size:20px; 
	border:1px solid #FEFCF0; 
	background-color: #FEFCF0; 
	vertical-align: middle; 
	border-radius:4px; 
	color:black;
	margin-right: 10px;
}
#btn_book:hover, #btn_book2:hover{
	cursor: pointer;
}
#ok, #check1, #check2 {
	padding: 5px 6px;
	border-radius: 4px;
	height: 21px;
	line-height: 23px;
	color:#5d676f;
	font-size: 12px;
	border:1px solid #5d676f;
	margin-right: 5px;
}
#re {
	padding: 5px 6px;
	border-radius: 4px;
	height: 21px;
	line-height: 23px;
	color:#5d676f;
	font-size: 12px;
	border:1px solid #5d676f;
}
#reset {
	padding: 5px 6px;
	border-radius: 4px;
	height: 21px;
	line-height: 23px;
	color:#5d676f;
	font-size: 12px;
	border:1px solid #5d676f;
}
#reset2 {
	padding: 5px 6px;
	border-radius: 4px;
	height: 21px;
	line-height: 23px;
	color:#5d676f;
	font-size: 12px;
	border:1px solid #5d676f;
}
table {
	background-color: transparent;
	/* border-collapse: collapse; */
}
#theaterInfo{
	color:white;
	font-size: 14px;
	padding-top: 15px;
	padding-left: 33px;
	padding-right: 10px;
}
tr {
	margin-right: 10px;
}
#info {
	padding-right:10px;
	padding: 0;
}
h5 {
	text-align: left; font-size: 16px; font-weight: bold;
}
#con {
	
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
	<div class="luncher" style="padding-right: 15px;">
		<ul>
			<li></li>
			<li>
				<a class="basket" href="#" style="color:white;"><span class="glyphicon glyphicon-shopping-cart"></span>장바구니</a>
			</li>
			<c:if test="${sessionScope.mid==null }">
			<li style="padding-right:10px;">
				<a class="login" href="../joinus/login.jsp" style="color:white;"><span class="glyphicon glyphicon-log-in"></span>로그인</a>
			</li>
			</c:if>
			<c:if test="${sessionScope.mid!=null }">
			<li style="padding-right:10px;">
				<a class="logout" href="../joinus/logout.do" style="color:white;"><span class="glyphicon glyphicon-off"></span>로그아웃</a>
			</li>
			<li>
				<a class="mypage" href="../mypage/mypage.do" style="color:white;"><span class="glyphicon glyphicon-user"></span>마이페이지</a>
			</li>
			</c:if>
		</ul>
	</div>
	<br>
	<div class="container" style="padding:0; margin:auto; width:744px; min-height:650px; text-align: center; background:#FEFCF0;">
		<input type="hidden" name="timeSeq" id="timeSeq" value="${timeSeq }"/>
		<div class="panel-group" id="accordion">
			
			<div class="step1" style="padding-top: 40px;">
				<h4 class="titlebar">STEP 1. 할인수단</h4>
			</div>
			<div class="selectmenu" style="margin-top:30px;">
				<div class="panel panel-default">
				<div class="panel-heading" style="padding:0;">
				<div class="menu1">
					<h4 class="title" style="font-weight: bold; font-size: 15px; text-align: left; padding-top:10px;">Charlie's Box 영화관람권</h4>
					<a class="panel-title" href="#collapse1" data-toggle="collapse" data-parent="#accordion"><img src="../image/chevron-arrow-down.png"></a>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<h5>CBOX 영화관람권</h5>
					</div>
					<div class="panel-footer">				
						<table name="con" id="con" class="table table-hover">
							<thead>
							<tr>
								<th style="text-align: center;">상품코드</th>
								<th style="text-align: center;">발급일자</th>
								<th style="text-align: center;">기한</th>
							</tr>
							</thead>
							<c:forEach var="g" items="${gList }">
							<tbody>
							<tr  style="text-align: center;">
								<td class="gcode">
									<a name="couponCode" value="${g.giftyconCode }">${g.giftyconCode }
										<input type="hidden" id="cdealNum" value="${g.dealNum }"/>
									</a>
								</td>
								<td>${g.regdate }</td>
								<td>${g.expireDate }</td>
							</tr>
							</tbody>
							</c:forEach>
						</table>
						<p style="text-align: right; padding-right: 20px;">할인금액:&nbsp;&nbsp;<span id="free">0</span>원</p>
						<a id="reset2">초기화</a>
					</div>
				</div>
				</div>
				</div>
				
				<div class="menu2">
					<h4 class="title" style="font-weight: bold; font-size: 15px; text-align: left; padding-top:10px;">Charlie's Box 기프트콘</h4>
					<a class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#collapse2"><img src="../image/chevron-arrow-down.png"></a>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel panel-default">
					<div class="panel-heading" style="padding:0;">
					<div class="panel-body">
						<h5 style="">CBOX 기프트콘</h5>
					</div>
					<div class="panel-footer">				
						<table name="table" id="con" class="table table-hover">
							<thead>
							<tr>
								<th style="padding-left: 40px;">쿠폰코드</th>
								<th style="padding-left: 40px;">발급일자</th>
								<th style="padding-left:70px;">쿠폰내용</th>
								<th style="padding-left: 40px;">기한</th>
								<th style="padding-left: 40px;">사용가능</th>
							</tr>
							</thead>
							<c:forEach var="c" items="${cList }">
							<tbody>
							<tr>
								<td>
									<a class="code" name="couponCode" value="${c.couponCode }">
										${c.couponCode }
										<input type="hidden" id="gdealNum" value="${c.dealNum }"/>
									</a>
								</td>
								<td>${c.regdate }</td>
								<td>${c.content }</td>
								<td>${c.expireDate }</td>
								<td>${c.state }</td>
							</tr>
							</tbody>
							</c:forEach>
						</table>
						<p style="text-align: right; padding-right: 20px;">할인금액:&nbsp;&nbsp;<span id="pCheck">0</span>원</p>
						<a id="reset" style="text-align: right;">초기화</a>
					</div>
					</div>
					</div>
				</div>
				<div class="menu3">
					<h4 class="title" style="font-weight: bold; font-size: 15px; text-align: left; padding-top:10px;">Charlie's Box 포인트</h4>
					<a class="panel-title"  data-toggle="collapse" data-parent="#accordion" href="#collapse3"><img src="../image/chevron-arrow-down.png"></a>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel panel-default">
					<div class="panel-heading" style="padding:0;">
					<div class="panel-body">
						<h5>CBOX 포인트</h5>
					</div>
					<div class="panel-footer">
						<span>현재 보유 포인트: </span><span id="remain">${point }</span>P&nbsp;&nbsp;&nbsp;&nbsp;<span>사용할 포인트 : </span><input type="text" id="point" name="point" value="0" style="text-align: right;"/>P
						<a id="ok">확인</a><a id="re">초기화</a><br>
					</div>
					</div>
					</div>
				</div>
				</div>
		</div>
		<br>
		<div class="step1" style="padding-top: 40px;">
			<h4 class="titlebar">STEP 2. 결제확인</h4>
		</div>
		<div style="padding-left:11%; text-align: center; margin-top:30px;">
		<div class="payCheck">
			<div class="total_header">결제하실 금액</div>
			<div class="result">
				<span class="total_amount" id="total">${total }</span>
				<span class="won">원</span>
			</div>
		</div>
		<div class="discount">
			<div class="discount_header">총 할인금액</div>
			<div class="result2">
				<span class="discount_total" id="dpoint" name="dpoint">0</span>
				<span class="won">원</span>
			</div>
		</div>
		</div>
		<div style="float:left; width:744px; height: 120px; border: 1px solid black; background-color:#232323; margin-top:13%;" >
			<div id="result" style="width:744px; float:left;">
				<div id="movieInfo" style="width: 30%;">
					<table>
						<tbody>
							<tr>
								<td><img src="${image }" style="width: 75px; margin:5px;"></td>
								<td>
									<p style="color:white; font-size: 14px; padding-top:50px; padding-left: 30px;">${title }</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="theaterInfo"  style="width: 30%; text-align: center;">
					<table>
						<tbody>
							<tr>
								<th id="info">극장</th>
								<td>${theater.location }<span>${theater.place }관</span></td>
							</tr>
							<tr>
								<th id="info">좌석</th>
								<td id="seat">${seat }</td>
							</tr>
							<tr>
								<th id="info">일시</th>
								<td>${day }&nbsp;&nbsp;<span>${time }</span></td>
							</tr>
							<tr>
								<th id="info">인원</th>
								<td>${ticket }명</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="next" style="width:30%; margin-right:10px; float:right; border:none; margin-top:20px;">
					<input type="hidden" id="dealnum"/>
					<input type="hidden" id="code"/>
					<input type="hidden" id="memberType" value="${memberType }">
					<button id="btn_book" class="checkout-button" style="padding-bottom: 22px; height: 70%;"><span style="">예매하기</span></button>
					<a href="bookingPage.do?timeSeq=${timeSeq }" id="btn_book2" class="cancel-button" style="padding-bottom: 22px; height: 70%;"><span style="">뒤로가기</span></a>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>