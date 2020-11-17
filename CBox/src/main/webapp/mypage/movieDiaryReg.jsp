<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	
	$('#btnSub').click(function(){
		if($('#content').val()==""){
			alert("내용을 입력해주세요.")
			return false;
		}else{
			alert("다이어리가 등록되었습니다.")
		}
	});


});

	

</script>
<title>Insert title here</title>
<style type="text/css">
.movielog-detail-wrap .diary-register-wrap{
	width: 718px;
	margin: 20px 0;
	padding: 0 1px;


}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td{
	font-size: 100%;
	border:  0;
	vertical-align:baseline;
	word-break:break-all;


}


.movielog-detail-wrap .sect-diary-register > .article-who-together, .movielog-detail-wrap .sect-diary-register > .article-how-see{
	overflow:hidden;
	border-bottom:1px solid #e0e0e0;


}



.movielog-detail-wrap .sect-diary-register > .article-how-see{

	padding-bottom:15px;

}

.movielog-detail-wrap .sect-diary-register > .article-any-movie{

	position:relative;

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
		 <div style="float:left" >
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
			<div style="float: right; background-color: #EAEAEA; width: 83%;">
				<div class="container" style="background-color: #EAEAEA;">

					<div class="panel-heading" style="padding-top: 20px;">
						<p style="font-size:30px; float: left; font-weight: bold;"><b>Movie Diary</b><small style="color:silver; font-weight: lighter; font-size: 17px;"> cbox와 함께한 추억들</small></p>
					</div>
					<br><br><br>
					<hr style="width: 100%; border: 1px solid black;">
					<br>
				</div>

  		 <br><br><br>
  		 <form action="MovieDiaryReg.do" method="post">
	  	 	<div class="media" style="background-color: #white; width:80%; margin:auto; border:1px solid silver; border-radius: 10px;">
				<div class="media-left" >
					<center>
						<a href="#"><img  class="media-object"
							src="${movie.getImage()}" alt=""
							style="width: 110px; height: 150px; border: 2px solid black; margin:10px;"></a>
					</center>
				</div>
				<div class="media-body" style="padding:30px;">
					<br>
					<h3 style="font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;${movie.getMovieNm()}&nbsp;&nbsp;&nbsp;<br>
					<small style="font-size: 15px;">&nbsp;&nbsp;${movie.getMovieNmEn()}</small></h3>
					<br>
					<p>&nbsp;&nbsp;&nbsp;${mdtime}</p>
					<p>&nbsp;&nbsp;&nbsp;${theater}</p>						

				</div>
			</div>			

		<br><br><br>
			
				<input type="hidden" name="mdtime" value="${mdtime}">
				<input type="hidden" name="mcode" value="${movie.getMcode()}">
				<input type="hidden" name="theater" value="${theater}" >
				<input type="hidden" name="movieNm" value="${movie.getMovieNm()}">
				<input type="hidden" name="movieNmEn" value="${movie.getMovieNmEn()}">
				<input type="hidden" name="image" value="${movie.getImage()}">
				<input type="hidden" name="mid" value="${mid}">

				<div class="diary-register-wrap" style="width: 80%; margin:auto;">
					<div class="sect-diary-register">
						<h4 class="hidden">무비 다이어리 작성</h4>

						<div class="article-any-movie" style="width: 100%;">
							<a title="영화리스트 열림" id="open_watched_movie_list" href="#"></a>
						</div>

						<div class="article-who-together" style="width: 100%;">
							<div style="float: left;">
								<label for="txtMovieWith"><span ><i class="glyphicon glyphicon-user"></i>&nbsp;누구와 함께 보셨나요?</span></label> 
							</div>
							<input style="width:100%;" name="friend"id="txtMovieWith" type="text" maxlength="60"placeholder=""/>

						</div>
						<br>
						<div class="article-how-see">
							<div style="float: left;">
								<label for="txtMovieWith"><span ><i class="glyphicon glyphicon-comment"></i>&nbsp;영화 어떻게 보셨나요?</span></label> 
							</div>

							<textarea  style="width:100%;" name="content" id="content" required="required" rows="5" cols="55" minlength="2" placeholder=""></textarea>
						</div>
					</div>
				</div>
			<br><br>
			<span style="margin-right: 130px;" class=" pull-right"><input id="btnSub" type="submit" value="등록" class="btn btn-danger"></input><span><a href="MovieDiary.do?mid=${mid}" class="btn btn-info">취소</a></span></span>
			</form>
		</div>	
	<!-- /본문 -->
	</div>
</body>
</html>