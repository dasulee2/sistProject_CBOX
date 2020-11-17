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
			
			$('.deleteBtn').click(function(){
				
				alert('다이어리를 삭제했습니다.')
				
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
		font-family: "나눔바른고딕";
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
	         <p style="margin:0px; padding:0px; font-size:30px; text-align: center; margin-bottom: 10px; margin-top:5px;">${mSize}</p>
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
				
				
				
				<br>
				 <div style="width: 95%; ">
					<div class="container pull-left">
						<div style=" margin:auto; width:80%; background: #FEFCF0; border-top: 1px solid black; border-bottom: 1px solid black;">
						<table style="width:100%;" class="ttt"  >
								<tr  style="border-bottom: 1px solid black; width:100%;"><th  style="vertical-align:middel; border-right: 1px solid silver; border-bottom: 1px solid black; width:10%;">관람일자</th><td style="border-bottom: 1px solid black; width:100%;"><span>${md.getMdtime()}</span><span style="float: right;"><a href="MovieDiaryEdit.do?mdseq=${md.getMdseq()}&mid=${mid}" class="UpdateBtn"><i class="glyphicon glyphicon-pencil"></a></i>&nbsp;&nbsp;&nbsp;<a href="DiaryDelete.do?mdseq=${md.getMdseq()}&mid=${mid}" class="deleteBtn"><i class="glyphicon glyphicon-remove-sign"></a></i></span></td></tr>
								<tr ><th rowspan="2" style="border-right: 1px solid silver; border-bottom: 1px solid black;" >영화</th><td> <img src="${md.getImage()}" style="width:140px; height: 170px;"></td></tr>
								<tr><td style="border-bottom: 1px solid black;"><span style="font-weight: bold; font-size: 20px;">${md.getMovieNm()}</span>&nbsp;<small style="color: silver; font-size: 15px; font-weight: lighter;">${md.movieNmEn}</small></td></tr>
								<tr style=" "><th  rowspan="2" style="border-bottom: 1px solid black; border-right: 1px solid silver;">내용</th><td><span><i class="glyphicon glyphicon-map-marker"> </i>&nbsp;&nbsp;${md.getTheater()}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;${md.getFriend()}</span></td></tr>
								
								<tr style=" "><td style="border-bottom: 1px solid black;"><span><i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;${md.getContent()}</span></td></tr>
								
								<tr style=" "><th style="border-right: 1px solid silver;">작성일자</th><td>${md.regdate}&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
						</table>
						</div><br>
					</div>
				</div> 
		</div>
		</div>	
		<%-- <div class="container" style="margin:auto; width:80%; text-align: center; background:#FEFCF0; margin-bottom: 100px; border-radius: 10px;">
		  <div style="float:left">
	      <div class="profile" style="border:1px solid black; width:200px;  height:250px; border-radius: 10px; padding:10px; margin:10px;">
	         <img style="margin-top:15px;  margin-left:11px; border-radius:50%; width:150px; height: 150px;" src='./image/img_avatar1.png'>
	         <p style="margin-top:5px; font-size:16px; font-weight: bold; text-align: center;" >${mid} <span class='glyphicon glyphicon-pencil'></span></p>
	      </div>
	      <div class="myMovie" style="border:1px solid black; width:200px;  height:100px; border-radius: 10px; padding:10px; margin:10px;">
	         <p style="margin:0px; padding:0px; font-size:30px; text-align: center;">${mSize}</p>
       		 <a href="myMovie.do?mid=${mid}" style="margin:0px; padding:0px; text-align: center; font-size:15px;">내가 본 영화</a>
	      </div>
	      <div class="movieDialy" style="border:1px solid black; width:200px;  height:100px; border-radius: 10px; padding:10px; margin:10px;">
	         <p style="margin:0px; padding:0px; font-size:30px; text-align: center;">${mdList.size()}</p>
	         
	         <a href="MovieDiary.do?mid=${mid}" style="margin:0px; padding:0px; text-align: center; font-size:15px;">무비 다이어리</a>
	      </div>
	  	 </div>
	  	 
	  	 <div class="container" style="margin-left: 250px;">
	  	 <h4 class="pull-left" style="font-size: 20px; margin-top: 20px;" >Movie Diary Detail</h4>
	  	 <br><br>
	  	 <hr>
	  	 		<table style="float:left;">
					<tr style="float:left;"><h1 style="font-size: 20px;">${md.getMdtime()}</h1><span style="float: right;"><a href="MovieDiaryEdit.do?mdseq=${md.getMdseq()}&mid=${mid}" class="UpdateBtn"><i style="font-size: 30px;" class="glyphicon glyphicon-pencil"></a></i>&nbsp;&nbsp;&nbsp;<a href="DiaryDelete.do?mdseq=${md.getMdseq()}&mid=${mid}" class="deleteBtn"><i style="font-size: 30px;" class="glyphicon glyphicon-remove-sign"></a></i></span> </tr> <br><br>
					<tr style="float:left;"> <img src="${md.getImage()}" style="width:170px; height: 200px;"></tr><br><br>
					<tr style="float:left;"><h3 style="font-weight: bold; font-size: 30px;">${md.getMovieNm()}</h3></tr>
					<tr style="float:left;"><small style="color: silver; font-size: 25px; font-weight: lighter;">${md.getMovieNmEn()}</small></tr>	<br>
					<br><tr style="float:left; font-size: 30px;"><i class="glyphicon glyphicon-home">  ${md.getTheater()} &nbsp;&nbsp;</i> <i class="glyphicon glyphicon-user">  ${md.getFriend()}</i></tr><br>
							
					<br>
					&nbsp;&nbsp;<tr style="float:left; font-size: 30px;"><i class="glyphicon glyphicon-comment">  ${md.getContent()}</i></tr><br>
					<br>
					&nbsp;&nbsp;<tr style="float:left; font-size: 30px;">${md.getRegdate()}</tr><br>
					<hr>
				</table>
	
		</div>			
		<!-- /본문 -->
		</div> --%>
	</body>
	</html>