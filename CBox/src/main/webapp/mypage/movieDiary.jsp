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

</script>
<title>Insert title here</title>
<style type="text/css">
.container , .media, table, input, h1, h2, h3, h4, h5, h6, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
	      margin: 0;
	      padding: 0;
	      border: 0;
	      font-size: 100%;
	      font: inherit;
	      vertical-align: baseline;
	}

  .container{
  	font-family: "나눔바른고딕";
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
  

  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  .ttt tr{
  	text-align: left;
  }
  .ttt td{
  	padding:15px;
  	font-family: "나눔바른고딕";
  }
  .ttt th{
  	padding:15px;
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
						<p style="font-size:30px; float: left; font-weight: bold;"><b>Movie Diary</b><small style="color:silver; font-weight: lighter; font-size: 17px;"> cbox와 함께한 추억들</small></p>
					</div>
					<br><br><br>
					<hr style="width: 100%; border: 1px solid black;">
					<br>
				</div>
			
				<p style="font-size: 16px; text-align: left; margin:10px; font-weight: bold;" >지금 나만의 무비 다이어리를 작성해보세요!!</p>
			<div style="border:1px solid silver; width: 95%; margin:auto;">
				<p style="font-size: 15px; text-align: left; margin:10px;">어떤 영화를 보셨나요? &nbsp;&nbsp;<i style="cursor: pointer;" class="glyphicon glyphicon-search" data-target="#modal" data-toggle="modal"></i></p>
			</div>
			
			<br>
			 <div style="width: 95%; ">
				<div class="container pull-left">
					<c:forEach var="md" items="${mdList}">
						<div style=" margin:auto; width:80%; background: #FEFCF0; border-top: 1px solid black; border-bottom: 1px solid black;">
					<table style="width:100%;" class="ttt"  >
							<tr  style="border-bottom: 1px solid black; width:100%;"><th  style="vertical-align:middel; border-right: 1px solid silver; border-bottom: 1px solid black; width:10%;">관람일자</th><td style="border-bottom: 1px solid black; width:100%;"><span">${md.mdtime}</span><span class="btn btn-default" style="float:right;"><a href="DiaryDetail.do?mdseq=${md.mdseq}&mid=${mid}"><i class="glyphicon glyphicon-pencil"></i>상세보기</a></span></td></tr>
							<tr ><th rowspan="2" style="border-right: 1px solid silver; border-bottom: 1px solid black;" >영화</th><td> <img src="${md.image}" style="width:140px; height: 170px;"></td></tr>
							<tr><td style="border-bottom: 1px solid black;"><span style="font-weight: bold; font-size: 20px;">${md.movieNm }</span>&nbsp;<small style="color: silver; font-size: 15px; font-weight: lighter;">${md.movieNmEn}</small></td></tr>
							<tr style=" "><th  rowspan="2" style="border-bottom: 1px solid black; border-right: 1px solid silver;">내용</th><td><span><i class="glyphicon glyphicon-map-marker"> </i>&nbsp;&nbsp;${md.theater }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;${md.friend }</span></td></tr>
							
							<tr style=" "><td style="border-bottom: 1px solid black;"><span><i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;${md.content}</span></td></tr>
							
							<tr style=" "><th style="border-right: 1px solid silver;">작성일자</th><td>${md.regdate}&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
					</table>
						</div><br>
					</c:forEach>		
				</div>
			</div> 
	</div>
	</div>
	
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align:center;">
						<p>다이어리를 작성할 영화를 선택해주세요.</p>
						 <c:if test="${mList.size() != 0 }">
							  <c:forEach var="i" begin="0" end="${mList.size()-1}"> 
								<div class="media" style="background-color: #FEFCF0;">
									<div class="media-left" style="padding-top: 15px;">
										<center>
											<a href="#"><img class="media-object"
												src="${mList.get(i).getImage()}" alt=""
												style="width: 110px; height: 150px; border: 2px solid black;"></a>
										</center>
									</div>
									<div class="media-body">
										<br>
										<h3>&nbsp;&nbsp;&nbsp;&nbsp;${mList.get(i).getMovieNm()}&nbsp;&nbsp;&nbsp;<br>
										<small>&nbsp;&nbsp;${mList.get(i).getMovieNmEn()}</small></h3>
										<br>
										<p>&nbsp;&nbsp;&nbsp;<span class="movieTime${i}">${tList.get(i).getDay()}</span>&nbsp;&nbsp;<span class="sTime${i}">${tList.get(i).getTime()}</span>&nbsp;&nbsp;~&nbsp;&nbsp;<span class="sTime2${i}"></span><input class="showTime${i}" type="hidden" value="${mList.get(i).getShowTm()}"></p>
										<p>&nbsp;&nbsp;&nbsp;${taList.get(i).getTheatername()}&nbsp;&nbsp;${taList.get(i).getPlace()} 관&nbsp;&nbsp;${seatList.get(i)} <span class="movieDiary1${i}"></span> </p>
									
										
											<c:if test="${mdCheck.get(i) == 'NO'}">
				<!-- 							&mList=${mList}&taList=${taList}&tList=${tList} -->
												<a href="MovieDiaryReg.do?mcode=${mList.get(i).getMcode()}
																&day=${tList.get(i).getDay()}
																&time=${tList.get(i).getTime()}
																&theaterNo=${taList.get(i).getTheaterNo()}
																&mid=${mid}"
																
																class="btn btn-danger pull-right">&nbsp;선택</a>
											</c:if>
											<c:if test="${mdCheck.get(i) == 'YES'}">
												<a href="DiaryDetail.do?mcode=${mList.get(i).getMcode()}&mid=${mid}" class="btn btn-default pull-right active">&nbsp;보기 </a>
											</c:if>
											
									</div>
		
								</div>
							</c:forEach> 
						</c:if>
						
						<c:if test="${mList.size() == 0 }">
						 	
						   	다이어리를 작성한 영화가 없습니다. 
						   	<br><br>
							<a href="mypage.do" class="btn btn-default">돌아가기</a>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>