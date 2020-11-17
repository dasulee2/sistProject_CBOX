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
	<link rel="stylesheet" href="../assets/css/main3.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
 
		var i=0;
		$(function(){
			 $('.title').click(function(){
			var value=$(this).attr("value");
			   if(i==0){
			    $('#m'+value).show();
			    i=1;
			   }else{
			    $('#m'+value).hide();
			    i=0;
			   }
			 });			 
			 
			 $('.del').click(function(){
			
				 var value=$(this).attr("value");
				 var mValue=$("#mcode").val();
				 alert(value);
				 alert(mValue);
				 
				 $('#rdel').attr("href","reviewDel.do?rseq="+value+"&mcode="+mValue);
				 
				 
			 });			 
			 
		 });
	</script>
	<title>Insert title here</title>
	<style type="text/css">
	 .container b hr input h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
	      margin: 0;
	      padding: 0;
	      border: 0;
	      font-size: 100%;
	      font: inherit;
	      vertical-align: baseline;
	}
	
	.media b hr input h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video{
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
			height: 70px;
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
	</style>
	</head>
	<body>
		<input type="hidden" value="${mcode}" id="mcode">
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
		<div style="margin:auto; width:80%; text-align: center; background:#EAEAEA; border-radius:10px; margin-bottom: 100px; padding-bottom: 50px;">
			<div class="container">
			<div class="">
			<h1 style="float: left; padding-top: 20px;">영화상세<small>&nbsp;&nbsp;&nbsp;movie detail</small></h1>
			</div>	
			<br><br><br><br><br><br>
			<hr style="border-color: #FEFCF0;">
			<br><br>
			<div class="panel panel-primary" style="background-color: #FEFCF0; border-color: silver;">
	<!-- 			<div class="panel-heading"> -->
	<!-- 				<h3 class="panel-title"> -->
	<!-- 				&nbsp;&nbsp;Review</h3> -->
	<!-- 			</div> -->
				<div class="panel-body">
				
					<div class="media" style="background-color: #FEFCF0;">				
						<div class="media-left pull-left">
							<img class="media-object" src="${m.image }" style="width: 250px; height: 300px">
						</div>
						<div class="media-body">
							<div style="margin-left: 50px; margin-top: 20px;">
							<h2><span class="pull-left" style="font-size:25px; font-weight: bold;">${m.movieNm }</span><br></h2>
							<br>
	<!-- 								<p>예매율 : ㅁㄴㅇ 실관람객 : ㅁㅇㄴㅇ</p> -->
							<hr style="border-color:silver;">
							<p class="pull-left" id="director"><span style="font-weight: bold;">감독</span> : 
							<c:forEach var="i" begin="0" end="${fn:length(director)-1}">
							<c:if test="${fn:length(director)-1 != i}">${director[i]},</c:if>
							<c:if test="${fn:length(director)-1 == i}">${director[i]}</c:if>
							</c:forEach></p>
							<br><br><br>
							<p class="pull-left"><span style="font-weight: bold;">배우</span> :					
							<c:forEach var="i" begin="0" end="${fn:length(actors)-1}">
							<c:if test="${fn:length(actors)-1 != i}">${actors[i]},</c:if>
							<c:if test="${fn:length(actors)-1 == i}">${actors[i]}</c:if>					
							</c:forEach></p>
							<br><br><br>						
							<p class="pull-left"><span style="font-weight: bold;">장르</span> :<c:forEach var="g" items="${genre}">${g}</c:forEach> /&nbsp;&nbsp; <span style="font-weight: bold;">등급</span> : ${m.watchGradeNm} / &nbsp;&nbsp;<span style="font-weight: bold;">상영시간</span> : ${m.showTm}분</p>
	
						 	<br><br><br>
						 	<p class="pull-left"><span style="font-weight: bold;">개봉</span> :${year}년&nbsp;${month}월&nbsp;${day}일</p>
						 	<br><br><br><br>							 	
						 	<div class="media-right pull-right">
						 	<a href="#" data-target="#modal" data-toggle="modal" class="btn btn-danger">예매하기</a>
							</div>		
							</div>
						</div>
					</div>
				</div>
				<br>
			</div>
			<br><br><br>	
			${m.summary}
		</div>
			<br><br><br>	
			<div class="container" >		
											<!-- 로그인, 비로그인 구분해서 제어한다. -->
				<div class="" style="margin-left: 0px; height: 50px;">
					 <h3 style="float: left; font-size: 30px;">회원리뷰<small>&nbsp;&nbsp;&nbsp;review</small></h3>
				
				<div class="">				 
				<c:if test='${mid==null}'>
					<a href="#" data-target="#modal" data-toggle="modal" class="btn btn-default pull-right">리뷰쓰기</a>
				</c:if>
				<c:if test='${mid!=null}'>
					<a href="reviewReg.do?mcode=${mcode}" class="btn btn-default pull-right">리뷰쓰기</a>
				</c:if>
				</div>
				</div>
				
				<hr style="border-color: #FEFCF0;">
				
			<hr>
			<br>
			<div class="container" style="">	
				<c:if test="${rList.size() == 0}">
				해당 영화의 등록된 리뷰가 없습니다. 첫번째 리뷰를 작성해주세요.
				</c:if>

				<c:if test="${rList.size() > 0}">
				<c:forEach var="i" begin="0" end="${rList.size()-1}">
					<div class="" style="width: 35%;">
							<h4 class="title" value="${i}" style="margin-top:10px; cursor:pointer;">${rList.get(i).getTitle()}</h4>
							<div class="" id="m${i}" style="display:none" type="">						
							<p>${rList.get(i).getContent()}</p>						
							</div>											
							<c:if test="${rList.get(i).getGPA() <= 1.0}">																																															
																																																																		
							<p>평점 : <img src="../image/star_score_1.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp; </p>
							</c:if>
							<c:if test="${1.0 < rList.get(i).getGPA() && rList.get(i).getGPA() <= 2.0}">
							<p>평점 : <img src="../image/star_score_2.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${2.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 3.0}">
							<p>평점 : <img src="../image/star_score_3.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${3.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 4.0}">
							<p>평점 : <img src="../image/star_score_4.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${4.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 5.0}">
							<p>평점 : <img src="../image/star_score_5.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${5.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 6.0}">
							<p>평점 : <img src="../image/star_score_6.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${6.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 7.0}">
							<p>평점 : <img src="../image/star_score_7.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${7.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 8.0}">
							<p>평점 : <img src="../image/star_score_8.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${8.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 9.0}">
							<p>평점 : <img src="../image/star_score_9.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>
							<c:if test="${9.0< rList.get(i).getGPA() && rList.get(i).getGPA() <= 10.0}">
							<p>평점 : <img src="../image/star_score_10.png">&nbsp; | &nbsp;${rList.get(i).getMid()}&nbsp; | &nbsp;${rList.get(i).getRegdate() }&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"><a href="reviewEdit.do?rseq=${rList.get(i).rseq}&mcode=${mcode}"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>수정</a>&nbsp; | &nbsp;<c:if test="${mid ==rList.get(i).mid}"> <a href="#" class="del" value="${rList.get(i).rseq}" data-target="#modal2" data-toggle="modal"></c:if> <c:if test="${mid !=rList.get(i).mid}"><a href="#" data-target="#modal3" data-toggle="modal"></c:if>삭제</a>&nbsp;</p>
							</c:if>												

				</div>
				<br><br>
				</c:forEach>				
				</c:if>
					
				<p id="cur-page" class="margin-small">
					</p>
					<div id="pager-wrapper" class="margin-small" style="margin-top: 50px;">
						<div class="text-center">
							<c:if test="${sPage!=1}">
								<p id="btnPrev">
									<a class="button btn-prev"
									href="movieDetail.do?pg=${sPage-1}&mcode=${m.movieCd}">이전</a>
								</p>
							</c:if>
	
							<ul class="pagination">
								<c:forEach var="i" begin="0" end="4">
									<li>
									    <c:if test="${i+sPage <= finalPage}">								
												<a href="movieDetail.do?pg=${sPage+i}&mcode=${m.movieCd}">${sPage+i}</a>
										</c:if>
									</li>
								</c:forEach>
							</ul>
							<c:if test="${sPage+4 < finalPage}">
								<p id="btnNext">
									<a class="button btn-next" href="movieDetail.do?pg=${sPage+5}&mcode=${m.movieCd}">다음</a>
								</p>
							</c:if>
						</div>
					</div>
			</div>
		</div>
				<jsp:include page="m_loginRequest.jsp"></jsp:include>
				<jsp:include page="m_reviewDel.jsp"></jsp:include>
				<jsp:include page="m_idError.jsp"></jsp:include>
		</div>
		
		

	</body>
	</html>