<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(function(){
		
		$('#btnSub').click(function(){
			if($('#title').val()==""){
				alert("제목을 입력해주세요.")
				$('#title').focus();
				return false;
			}else if($('#content').val()==""){
				alert("내용을 입력해주세요.")
				return false;
			}else{
				alert("리뷰가 등록되었습니다.")
			}
		});
		
		 $('#selectBox').selected(function(){
			  alert("뭐요이거");
			  var value=$(this).attr("value");
			  $('#star').attr("src","../image/star_score_"+value+'.png');
		 });			

// 		$('.s_gpa').click(function(){
			
			
			
// 			alert("뭐요이거");
// 			var value= $("#selectBox option:selected").val();
// 			$('#star').attr("src","../image/star_score_"+value+'.png');
			
// 		});
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
			
			<h3 style="float: left; padding-top: 30px;">Review<small style="margin-left: 10px;">register</small></h3>
			<br><br><br><br><br><br>
			<hr style="border-color: #FEFCF0;">
			<table class="table" style="background-color: #FEFCF0;">
			    <thead>
			    </thead>
			        <tbody>
		        <form action="reviewEdit.do" method="post">
		            <tr>
		                <th>제목: </th>
		                <td><input type="text" placeholder="제목을 입력하세요." value="${r.title }" id="title" name="title" class="form-control"/></td>
		                <input type="hidden" name="mcode" value="${r.mcode}"/>
		                <input type="hidden" name="rseq" value="${r.rseq}"/>
		                <input type="hidden" name="bGpa" value="${r.GPA }" />
		            </tr>
					<tr>
						<th>평점:</th>
		                <td>
		                <select name="GPA" class="form-control pull-left" style="width: 200px;"> 
			                <option class="gpa" value="1">1</option> 
			                <option class="gpa" value="2">2</option> 
			                <option class="gpa" value="3">3</option> 
			                <option class="gpa" value="4">4</option> 
			                <option class="gpa" value="5">5</option> 
			                <option class="gpa" value="6">6</option> 
			                <option class="gpa" value="7">7</option> 
			                <option class="gpa" value="8">8</option> 
			                <option class="gpa" value="9">9</option> 
			                <option class="gpa" value="10">10</option> 
		                </select>
				             &nbsp;&nbsp;&nbsp;&nbsp;<img id="star">
						</td>
		            </tr>
		            <tr>
		                <th>내용: </th>
		                <td><textarea cols="10" value="${r.content}" id="content" name="content" class="form-control" style="height:200px;"></textarea></td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <a class="btn btn-default pull-right"  href='movieDetail.do?mcode=${r.mcode}'>취소하기</a>                                            
		                    <input type="submit" value="등록" id="btnSub" class="btn btn-default pull-right"/>
		                </td>
		            </tr>
		        </form>
		 	   </tbody>
			</table>
			</div>
			</div>

	</div>
	
	
</body>
</html>