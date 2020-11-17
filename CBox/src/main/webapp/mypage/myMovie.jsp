<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Spectral+SC" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/main2.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		var i=0;
		
		$('.media').each(function(){
	
		var movieTime = $('.movieTime'+i).text();
					
		var movieTime2 = movieTime.split('/');
		
		var movieTime3 = '20'+movieTime2[0]+"년"+movieTime2[1]+"월"+movieTime2[2];
		
		var movieTime4 = movieTime3.substring(0,10)+"일";	
		$('.movieTime'+i).text(movieTime4);  		
		
		var showTime = $('.showTime'+i).attr('value');
		showTime = showTime.split('분');
		showTime = showTime[0];
		
		var mok = parseInt(showTime / 60); 
		var namugi = showTime - mok*60;
		
		var sTime = $('.sTime'+i).text();
		
		sTime = sTime.split(':');
		var hour = sTime[0]; //시간
		var minute = sTime[1]; //분 
/* 		var firstTime = hour.substring(0 , 1);
 */		
		minute = minute.substring(0 , 2);
		
		hour = Number(hour) + Number(mok);
		minute = Number(minute) + Number(namugi);
		
		if(hour < 10){
			hour = '0'+ hour;
			sTime = hour+':'+minute;
			$('.sTime2'+i).text(sTime);
		}else{
			sTime = hour+':'+minute;
			$('.sTime2'+i).text(sTime);
		}
		
		i=i+1;
		
		});
		
		
		
/* 		var mListJ = '${mList}';
		var mdListJ = '${mdList}';
		
		var mdOK = 0;
		if(mdList.size() != 0){
			
		for(var i=0; i<mList.size(); i++){
			
			
			for(var j=0; j<mdList.size(); j++){						
				
				if(mList.mcode==mList.mcode){
						mdOK= mdOk+1;
						return false;
				}
				
			}
		}
		}else{
			mdOK= mdOK+1;
		}
	
		if(mdOK > 1){
			//HTML CODE INPUT 
			$('.movieDiary1').text(mdTag);

			
		}else{
			// ACTIVE MDDIARY BTN 
			$('.movieDiary1').text(mdTag2);
		
		} */

	});




</script>
<title>Insert title here</title>
<style type="text/css">

  hr {
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

/* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
  	position:absolute;
    width: 250px;
    height: auto;
    margin-left: -250px;
    background: #FEFCF0;
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
  

  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  .container{
  	font-family: "나눔바른고딕";
  }
</style>
</head>
<body>
	<header>
		 <h1 style="text-align: center; padding-top: 60px; padding-bottom: 40px;"><a id="cbox" style="font-weight:bold; " href="./main.do">Charie's BOX</a></h1>
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
	
	<div class="container" style="margin:auto; width:80%; text-align: center; background:#EAEAEA; margin-bottom: 100px; border-radius: 10px; padding:50px;">
		   <div style="float:left">
      <div class="profile" style="border:1px solid black; width:200px;  height:250px; border-radius: 10px; padding:10px; margin:10px;">
         <img style="margin-top:15px;  margin-left:11px; border-radius:50%; width:150px; height: 150px;" src='./image/img_avatar1.png'>
         <p style="margin-top:5px; font-size:16px; font-weight: bold; text-align: center;" >${mid}<span class='glyphicon glyphicon-pencil'></span></p>
      </div>
      <div class="myMovie" style="border:1px solid black; width:200px;  height:100px; border-radius: 10px; padding:10px; margin:10px;">
         <p style="margin:0px; padding:0px; font-size:30px; text-align: center; margin-bottom: 10px; margin-top:5px;">${mList.size()}</p>
         <a href="myMovie.do?mid=${mid}" style="margin:0px; padding:0px; text-align: center; font-size:15px; ">내가 본 영화</a>
      </div>
      <div class="movieDialy" style="border:1px solid black; width:200px;  height:100px; border-radius: 10px; padding:10px; margin:10px;">
         <c:if test='${mdList != null}'>
         <p style="margin:0px; padding:0px; font-size:30px; text-align: center; margin-bottom: 10px; margin-top:5px;">${mdList.size()}</p>
         </c:if>
         <c:if test='${mdList == null}'>
         <p style="margin:0px; padding:0px; font-size:30px; text-align: center; margin-bottom: 10px; margin-top:5px;">0</p>     
         </c:if>
         
         <a href="MovieDiary.do?mid=${mid}" style="margin:0px; padding:0px; text-align: center; font-size:15px;">무비 다이어리</a>
      </div>
  	 </div>
			<!-- /사이드바 -->
			<!-- 본문 -->
			<div style="float: right; background-color: #EAEAEA;">
				<div class="container" style="background-color: #EAEAEA;">

					<div class="panel-heading" style="padding-top: 20px;">
						<p style="font-size:30px; float: left; font-weight: bold;"><b>My Movie</b></p>
					</div>
					<br><br><br>
					<hr style="width: 100%; border: 1px solid black;">
					<br>
					<div class="panel-body">
						<c:if test="${mList.size() != 0 }">
							 <c:forEach var="i" begin="0" end="${mList.size()-1}"> 
								<div class="media" style="background-color: #FEFCF0; border:1px solid silver; border-radius: 10px; ">
									<div class="media-left" style="">
										<center style="margin: 10px; margin-left:50px;">
											<a href="#"><img class="media-object"
												src="${mList.get(i).getImage()}" alt=""
												style="width: 110px; height: 150px; border: 2px solid black;"></a>
										</center>
									</div>
									<div class="media-body" style="padding-top: 45px;" >
										
										<h3 style="margin-right:150px; font-weight: bold;" >&nbsp;&nbsp;&nbsp;&nbsp;${mList.get(i).getMovieNm()}&nbsp;&nbsp;&nbsp;<br>
										<small style="font-family:다음;">&nbsp;&nbsp;${mList.get(i).getMovieNmEn()}</small></h3>
										<br>
										<p style="margin-right:150px; padding-bottom: 3px;">&nbsp;&nbsp;&nbsp;<span class="movieTime${i}">${tList.get(i).getDay()}</span>&nbsp;&nbsp;<span class="sTime${i}">${tList.get(i).getTime()}</span>&nbsp;&nbsp;~&nbsp;&nbsp;<span class="sTime2${i}"></span><input class="showTime${i}" type="hidden" value="${mList.get(i).getShowTm()}"></p>
										<p style="margin-right:150px;">&nbsp;&nbsp;&nbsp;${taList.get(i).getTheatername()}&nbsp;&nbsp;${taList.get(i).getPlace()} 관&nbsp;&nbsp;${seatList.get(i)} <span class="movieDiary1${i}"></span> </p>
									
										
											<c:if test="${mdCheck.get(i) == 'NO'}">
				<!-- 							&mList=${mList}&taList=${taList}&tList=${tList} -->
												<%-- MovieDiaryReg.do?mcode=${mList.get(i).getMcode()}
																&day=${tList.get(i).getDay()}
																&time=${tList.get(i).getTime()}
																&theaterNo=${taList.get(i).getTheaterNo()}
																&mid=${mid} --%>
												<a href="MovieDiaryReg.do?mcode=${mList.get(i).getMcode()}
																&day=${tList.get(i).getDay()}
																&time=${tList.get(i).getTime()}
																&theaterNo=${taList.get(i).getTheaterNo()}
																&mid=${mid}" class="btn btn-default pull-right" style="background-color: black; color:white; margin-right:50px;">&nbsp;무비 다이어리 쓰기</a>
											</c:if>
											<c:if test="${mdCheck.get(i) == 'YES'}">
												<a href="DiaryDetail.do?mcode=${mList.get(i).getMcode()}&mid=AMANDA33" class="btn btn-default pull-right active" style=" margin-right:50px;">&nbsp;무비 다이어리 보기 </a>
											</c:if>
									
									
									</div>
		
								</div>
							</c:forEach>
						</c:if> 
						<c:if test="${mList.size() == 0}">
							관람하신 영화가 없습니다. 
													
						   	<br><br>
							<a href="mypage.do" class="btn btn-default">돌아가기</a>
						</c:if>
					 </div>
					 <hr style="border-color: silver;">
				</div>
			</div>
			<!-- /본문 -->
		</div>
</body>
</html>