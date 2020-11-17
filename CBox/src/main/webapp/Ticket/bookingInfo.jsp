<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".movie").find("td").click(function(){
			var mcode = $(this).find(".mcode").val();
			//alert(mcode);
			
			$("#selectMcode").val(mcode);
			$.ajax({
				url:"movie_theaterList.do",
				data:{"mcode":mcode},
				type:"POST",
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statusText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response){	
					var str = "<table class='theaterT'><tr><th>극장</th></tr>";
					for(var i in response){
						str = str+"<tr><td  class='t'><span>"+response[i]+"</span><input class='selectTheater' type='hidden' value='"+response[i]+"'</td></tr>"
					} 
					str = str +"</table>"
					$("#theaterDiv").html(str);
					$(".timetable").html("");
					$("#dateDiv").html("<table class='dateT'><tr><th>날짜</th></tr></table>");
					$("#timeSeq").val("");
					$("#theaterInfo").html("");
				}
			});
			
			$.ajax({
				url:"getMovie.do",
				data:{"mcode":mcode},
				type:"POST",
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statusText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response){	
					var str = "<table class='resultT'><tr><td><img id='image' src='"+response.image+"'></td><td><p style='color:white; margin-left:10px;'>"+response.movieNm+"</p></td></tr></table>";
					$("#movieInfo").html(str);
				}
			});	
			
			
			$(".movie").find("td").css({
				"border":"none",
				"background-color":"#F2F0E6",
				"font-weight":"normal",
				"color":"black"
			})
			$(this).css({
				"border":"1px solid black",
				"background-color":"#A50000",
				"color":"white",
				"font-weight":"bold"
				})
			
				
				
			if($(this).find(".watchGrade").val()=="adult"){
				alert('19세 이상 관람등급 영화입니다. 방문시 신분증을 꼭 지참해주세요.');
			}	
		});
		
		 $(document).on('click','.t',function(e){
				var theaterName = $(this).find(".selectTheater").val();
				var mcode = $("#selectMcode").val();
				$("#selectTheater").val(theaterName);
				// alert("alert===="+theaterName+":"+mcode);
				 
				 $.ajax({
					url:"movie_timetableDay.do",
					data:{"theaterName":theaterName,
						"mcode":mcode
						},
					type:"POST",
					dataType:"json",
					error:function(jqXHR){
						alert(jqXHR.status);
						//alert(jqXHR.statusText);
						//alert(jqXHR.responseText);
						//alert(jqXHR.readyState);
					},
					
					
					success:function(response){	
						var str = "<table class='dateT'><tr><th>날짜</th></tr>";
						//alert(response);
						 for(var i in response){
							 var day = response[i].substring(0,10);
							 str = str+"<tr><td class='dayT'><span>"+day+"</span><input class='selectDay' type='hidden' value='"+day+"'></td></tr>"
						} 
						str = str +"</table>"
						$("#dateDiv").html(str); 
						var str2 = "<table><tr><th>극장</th><td style='padding-left:5px;'>"+$("#selectTheater").val()+"</td></tr><tr><th>일시</th><td></td></tr><tr><th>상영관</th><td></td></tr></table>"
						$("#theaterInfo").html(str2);
					}
				});  
				
			$(".theater").find("td").css({
				"border":"none",
				"background-color":"#F2F0E6",
				"font-weight":"normal",
				"color":"black"
			})
			$(this).css({
				"border":"1px solid black",
				"background-color":"#A50000",
				"color":"white",
				"font-weight":"bold"
			})
			
		 });
		 
		 
		 $(document).on('click','.dayT',function(e){
			var theaterName = $("#selectTheater").val();
			var mcode = $("#selectMcode").val();
			var day = $(this).find(".selectDay").val();
			$("#selectDay").val(day);
			
			//alert(theaterName+":"+mcode+":"+day);
			
			$.ajax({
					url:"movie_timeList.do",
					data:{"theaterName":theaterName,
						"mcode":mcode,
						"day":day
						},
					type:"POST",
					dataType:"json",
					error:function(jqXHR){
						alert(jqXHR.status);
						//alert(jqXHR.statusText);
						//alert(jqXHR.responseText);
						//alert(jqXHR.readyState);
					},
					success:function(response){	
						var str = "";
						 for(var i in response){
							 var time = response[i].time;
							 //alert(time);
							 str = str + "<div class='timeR'><p>"+time+"</p><input class='selectTime' type='hidden' value='"+response[i].timeSeq+"'></div>";
						} 
						$(".timetable").html(str);
						
					}
				});
			
			$(".dayT").css({
				"border":"none",
				"background-color":"#F2F0E6",
				"font-weight":"normal",
				"color":"black"
			})
			$(this).css({
				"border":"1px solid black",
				"background-color":"#A50000",
				"color":"white",
				"font-weight":"bold"
				})
			 
		 });
		 
		 $(document).on('click','.timeR',function(e){
			 
			var selectT = $(this).find(".selectTime").val();
			var day = $("#selectDay").val();
			$("#timeSeq").val(selectT);
			
			 $.ajax({
				url:"getTimetable.do",
				data:{"timeSeq":selectT},
				type:"POST",
				dataType:"json",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statusText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response){	
					var str2 = "<table><tr><th>극장</th><td style='padding-left:5px;'>"+$("#selectTheater").val()+"</td></tr><tr><th>일시</th><td>"+day+" "+response.time+"</td></tr><tr><th>상영관</th><td>"+response.theaterNo+"관</td></tr></table>";
					$("#theaterInfo").html(str2);
				}
			}); 
			 
			
			 $(".timeR").css({
					"border":"1px solid black",
					"background-color":"#F2F0E6",
					"font-weight":"normal",
					"color":"black"
				})
				$(this).css({
					"border":"1px solid black",
					"background-color":"#A50000",
					"color":"white",
					"font-weight":"bold"
				})
		 });
		 
		 $("#next-btn").click(function(){
			var timeSeq =  $("#timeSeq").val();
			var memberType =  $("#memberType").val();
			
			if(timeSeq==null||timeSeq==""){
				alert("상영하실 영화정보를 모두 선택해주세요");
			}else{
				location.href="../Ticket/bookingPage.do?timeSeq="+timeSeq+"&memberType="+memberType;		
				
			}
		 });
		
	});

</script>
<title>Insert title here</title>
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
.movieT{
	
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
		 <h1 style="text-align: center; padding-top: 60px; padding-bottom: 40px;"><a id="cbox" style="font-weight:bold; " href="Index.jsp">Charie's BOX</a></h1>
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
		<div>
		<p>&nbsp;</p>
		</div>
		<input type="hidden" id="selectM" value="${selectM }">
		
		<div class="bookingdiv" style="background:#F2F0E6; margin:auto; width: 90%; height: 800px; margin-top:70px; border:2px solid black;">
			<div class="movie" style="float: left; width:30%; height: 80%; border: 1px solid black; ">
				<table class="movieT">
					<tr><th>영화</th></tr>
				</table>
					<div style="overflow: auto;" > 
					<table class="movieT">
					<c:forEach var="movie" items="${movies }">
						<c:if test="${fn:substring(movie.watchGradeNm,0,2)=='15'}">
							<tr><td><span class="label label-warning"  >15</span><span style="vertical-align: middle;"> ${movie.movieNm }</span><input class="mcode" type="hidden" value="${movie.movieCd }"></td></tr>
						</c:if>
						<c:if test="${fn:substring(movie.watchGradeNm,0,2)=='청소'}">
							<tr><td><span class="label label-danger" >19</span><span style="vertical-align: middle;"> ${movie.movieNm }</span><input class="mcode" type="hidden" value="${movie.movieCd }"><input class="watchGrade" type="hidden" value="adult"></td></tr>
						</c:if>
						<c:if test="${movie.watchGradeNm==null}">
							<tr><td><span class="label label-primary" >전체</span><span style="vertical-align: middle;"> ${movie.movieNm }</span><input class="mcode" type="hidden" value="${movie.movieCd }"></td></tr>
						</c:if>
						<c:if test="${fn:substring(movie.watchGradeNm,0,2)=='12'}">
							<tr><td><span class="label label-success">12</span><span style="vertical-align: middle;"> ${movie.movieNm }</span><input class="mcode" type="hidden" value="${movie.movieCd }"></td></tr>
						</c:if>
					</c:forEach>
					</table>
					</div>
			<input type="hidden" id="selectMcode">
			</div>
			<div id="theaterDiv" class="theater" style="float:left; width:20%; height: 80%; border: 1px solid black;">
				<table class="theaterT">
					<tr><th>극장</th></tr>
						<c:forEach var="theater" items="${theaterNames }">
							<tr><td><span class="t" style="vertical-align: middle;"> ${theater }</span><input class="selectTheater" type="hidden" value="${theater }"></td></tr>
						</c:forEach>
				</table>
			</div>
			<input type="hidden" id="selectTheater">
			<div id="dateDiv" class="day" style="float:left; width:10%; height:80%; border: 1px solid black;">
				<table class="dateT">
					<tr><th>날짜</th></tr>
				</table>
			</div>
			<input type="hidden" id="selectDay">
			<div id="timeDiv" class="time" style="float:left; width:40%; height: 80%; border: 1px solid black;">
				<table class="timeT">
					<tr><th>시간</th></tr>
				</table>
				<div class="timetable">
					
				</div>
			</div>
			<input type="hidden" id="timeSeq"><input type="hidden" id="memberType" value="${memberType }">
			<br>
			<div style="float:left; width:100%; height: 20%; border: 1px solid black; background-color:#232323; " >
				<div id="result" style="width:100%; float:left;">
					<div id="movieInfo" style="width: 30%;">
						
					</div>
					<div id="theaterInfo"  style="width: 30%;">
						
					</div>
					<div id="next" style="width:30%; margin-right:70px; float:right; border:none;">
						<a id="next-btn" style="width:80px; height:80px; float: right;"><img src="../image/next1.png"></a>
					</div>
				</div>
			</div>
			
			</div>
		</div>
</body>
</html>