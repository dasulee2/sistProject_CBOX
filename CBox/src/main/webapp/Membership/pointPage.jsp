<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="./assets/css/main2.css" />
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<style type="text/css">
td{
	padding-left: 15px;
	padding-right: 15px;
	margin-bottom: 15px;
/* 	border: 2px solid #2E9AFE; */
	border-collapse: collapse;
	height:25px;
}
#calendar{
	width: 300px;
}

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
				height: 80px;
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
    text-decoration: none;
    color: #999;
  }
  
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
#cbox:hover{
	text-decoration: none;
}  
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#giftycon").click(function(){
			glist();
		});
		$("#coupon").click(function(){
			clist();
		});
		$("#btn").click(function(){
			$.ajax({
				url:"date.do",
				data:{"fromDate":$("#fromDate").val(),"toDate":$("#toDate").val(),"listType":$("#listType").val()},	//보내는 parameter
				type:"GET",	//보낼때
				dataType:"json", //받을 타입
				error:function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				success:function(responseData){
					if($("#listType").val()=="calist"){
						$("#c1").remove("table");
						var s1="<table class='table'><tr class='active'><th>쿠폰이름&nbsp;&nbsp;&nbsp;&nbsp;</th><th>쿠폰발행번호&nbsp;&nbsp;&nbsp;&nbsp;</th><th>사용일&nbsp;&nbsp;&nbsp;&nbsp;</th><th>쿠폰정보</th></tr>";
						for(var i=0;i<responseData.length;i++){
							s1+="<tr><td>"+responseData[i].couponName+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].dealNum+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].usedDate+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].content+"</td></tr>";
						}
						s1+="</table>";
						$("#c1").html(s1);
						
					}else if($("#listType").val()=="galist"){
						$("#g1").remove("table");
						var s1="<table class='table'><tr class='active'><th>깊콘이름&nbsp;&nbsp;&nbsp;&nbsp;</th><th>깊콘번호&nbsp;&nbsp;&nbsp;&nbsp;</th><th>사용일&nbsp;&nbsp;&nbsp;&nbsp;</th><th>정보</th>";
						for(var i=0;i<responseData.length;i++){
							s1+="<tr><td>"+responseData[i].giftyconName+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].giftyconCode+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].usedDate+"&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+responseData[i].content+"</td></tr>";
						}
						s1+="</table>";
						$("#g1").html(s1);
					}
				}
			});//ajax끝
			
		});//click이벤트 끝
	});

	
	
	function glist(){
		$("#listType").val("galist");
		$("#couponList").attr("style","display:none;");
		$("#giftyconList").attr("style","display:block;");
	};
	function clist(){
		$("#listType").val("calist");
		$("#couponList").attr("style","display:block;");
		$("#giftyconList").attr("style","display:none;");
	};
	 $(function() { 
		  $("#fromDate").datepicker({
			dateFormat: 'yymmdd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
			 showMonthAfterYear: true, //년 뒤에 월 표시
		  });
		 });
	 $(function() { 
		  $("#toDate").datepicker({
			dateFormat: 'yymmdd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
			 showMonthAfterYear: true, //년 뒤에 월 표시
		  });
		 });
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
	<div class="luncher" style="padding-right: 20px;">
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
	
	
	<div style="width:80%; margin:auto;  font-family: '나눔바른고딕'; margin-bottom: 50px;" >
	<div class="sidebar" style="float:left; border-radius: 10px; ">
		<div class="col-sm-6">
	<div id="page-wrapper">
	  <!-- 사이드바 -->
	  <div id="sidebar-wrapper">
	    <ul class="sidebar-nav">
	      <li class="sidebar-brand">
	        <a href="#" style="color:black"><b>My CGV Home</b></a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My Movie</a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WishList</a></li>
	      <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movie Diary</a></li>
	       <hr>
	        <li class="sidebar-brand"><a href="#" style="color:black"><b>CBox 멤버십</b></a></li>
	      <li><a href="../Membership/pointPage.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 적립/사용내역</a></li>
	      <li><a href="../Membership/membership.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쿠폰/기프티콘 내역</a></li>
	      <hr>

	        <li class="sidebar-brand"><a href="#" style="color:black"><b>회원정보</b></a></li>
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
	
	<div class="container" style="margin-left:296px; width: 78%; border-radius:6px; border:1px solid #EEEEEE; background:#EEEEEE; padding:10px;">	
			<br><br><br>		
			<h1 style="font-size: 24px; font-weight: bold; margin-left:30px;" >Charie's BOX 포인트</h1>			
		<br><br>
			<table style="width:90%; margin:auto;" class="table">
				<tr><th style="text-align: center; font-weight: bold;">사용가능 포인트</th><th style="text-align: center;  font-weight: bold;">VIP선정 포인트</th></tr>
				<tr><th style="text-align: center;">${myPoint }P</th><td style="text-align: center;">${membership.accPoint }P</td></tr>
			</table>
			<br>
			<div id="search" style="width: 90%; margin:auto;">
			<h4><b style="font-weight: bold; margin-bottom: 30px;">포인트 사용 내역</b></h4>
					<table class="table" >
						<tr class="active">
							<th>구매구분&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>적립일&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>적립포인트&nbsp;&nbsp;&nbsp;&nbsp;</th>
						</tr>
				<c:forEach var="pa" items="${palist}">
						<tr>
							<td>${pa.sort}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>${pa.regdate}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>${pa.point}P&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
				</c:forEach>
					</table>
			</div>
	</div>
	</div>	
	
	

</body>
</html>