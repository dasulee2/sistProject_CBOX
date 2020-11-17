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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#comboList").click(function(){		
			$.ajax({
				url:"giftyconList.do",
				data:{"type":"C"},
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

						str += "<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px;'><div class='snipcart-thumb' style='margin-bottom:5px;'>"
							 +"<h4 style='font-size: 24px; color:black; text-align: left; padding-left:25px;'>"+response[i].giftyconName+"</h4>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"'><img style='width:380px; height: 380px; border:1px solid black;' src='"+response[i].image+"'/></a>"
							 +"</div>"
							 +"<a href='../cart/addCart.do?giftyconCode="+response[i].giftyconCode+"' class='cart btn btn-primary add-to-cart' style='margin-left:10px; '> <i class='glyphicon glyphicon-shopping-cart'></i>Add to Cart</a>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"' class='btn btn-danger add-to-cart'data-target='#mcart' data-toggle='' style='margin-left:10px;'>"
							 +"<i class='glyphicon glyphicon-shopping-cart'></i>Now Buy</a>"
							 +"</div>";
					}
				
					$("#giftycon").html(str); 
				}
			});	
		});	
		$("#popcornList").click(function(){		
			$.ajax({
				url:"giftyconList.do",
				data:{"type":"P"},
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

						str += "<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px;'><div class='snipcart-thumb' style='margin-bottom:5px;'>"
							 +"<h4 style='font-size: 24px; color:black; text-align: left; padding-left:25px;'>"+response[i].giftyconName+"</h4>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"'><img style='width:380px; height: 380px; border:1px solid black;' src='"+response[i].image+"'/></a>"
							 +"</div>"
							 +"<a href='../cart/addCart.do?giftyconCode="+response[i].giftyconCode+"' class='cart btn btn-primary add-to-cart' style='margin-left:10px; '> <i class='glyphicon glyphicon-shopping-cart'></i>Add to Cart</a>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"' class='btn btn-danger add-to-cart'data-target='#mcart' data-toggle='' style='margin-left:10px;'>"
							 +"<i class='glyphicon glyphicon-shopping-cart'></i>Now Buy</a>"
							 +"</div>";
					}
				
					$("#giftycon").html(str); 
				}
			});	
		});	
		$("#beverageList").click(function(){		
			$.ajax({
				url:"giftyconList.do",
				data:{"type":"B"},
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

						str += "<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px;'><div class='snipcart-thumb' style='margin-bottom:5px;'>"
							 +"<h4 style=' font-size: 24px; color:black; text-align: left; padding-left:25px;'>"+response[i].giftyconName+"</h4>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"'><img style='width:380px; height: 380px; border:1px solid black;' src='"+response[i].image+"'/></a>"
							 +"</div>"
							 +"<a href='../cart/addCart.do?giftyconCode="+response[i].giftyconCode+"' class='cart btn btn-primary add-to-cart' style='margin-left:10px; '> <i class='glyphicon glyphicon-shopping-cart'></i>Add to Cart</a>"
							 +"<a  href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"' class='btn btn-danger add-to-cart'data-target='#mcart' data-toggle='' style='margin-left:10px;'>"
							 +"<i class='glyphicon glyphicon-shopping-cart'></i>Now Buy</a>"
							 +"</div>";
					}
				
					$("#giftycon").html(str);
				}
			});	
		});
		$("#snackList").click(function(){		
			$.ajax({
				url:"giftyconList.do",
				data:{"type":"S"},
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

						str += "<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px;'><div class='snipcart-thumb' style='margin-bottom:5px;'>"
							 +"<h4 style='font-size: 24px; color:black; text-align: left; padding-left:25px;'>"+response[i].giftyconName+"</h4>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"'><img style='width:380px; height: 380px; border:1px solid black;' src='"+response[i].image+"'/></a>"
							 +"</div>"
							 +"<a href='../cart/addCart.do?giftyconCode="+response[i].giftyconCode+"' class='cart btn btn-primary add-to-cart' style='margin-left:10px; '> <i class='glyphicon glyphicon-shopping-cart'></i>Add to Cart</a>"
							 +"<a href='../shop/giftyconDetail.do?giftyconCode="+response[i].giftyconCode+"' class='btn btn-danger add-to-cart'data-target='#mcart' data-toggle='' style='margin-left:10px;'>"
							 +"<i class='glyphicon glyphicon-shopping-cart'></i>Now Buy</a>"
							 +"</div>";
					}
				
					$("#giftycon").html(str);
				}
			});	
		});

		
		 $(document).on('click','.cart',function(e){		
			e.preventDefault();
			
			
			
			var cartURL =  $(this).attr("href");
			
			alert(cartURL);
			
			//alert(url);
			$.ajax({
				url:cartURL,
				//url: "addCart.do?giftyconCode=C2",
				type:"GET",
				dataType:"text",
				error:function(jqXHR){
					alert(jqXHR.status);
					//alert(jqXHR.statusText);
					//alert(jqXHR.responseText);
					//alert(jqXHR.readyState);
				},
				success:function(response){	
					var gocart = confirm("장바구니에 담았습니다.\n장바구니로 이동하시겠습니까?");
					if(gocart){
						window.location.href="../cart/cartList.do";
					}
				}
					
				
			}); 
		});
	});
</script>
<title>Insert title here</title>
<style type="text/css">
.container h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
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
	font-family: '다음';
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
.snackmenu:hover {
	color: #286090;
	cursor: pointer;
}
#snackbar:hover{
	cursor: pointer;
	text-decoration: none;
}
</style>
</head>
<body>
	<header>
		 <h1 style="text-align: center; padding-top: 60px; padding-bottom: 40px;"><a id="cbox" style="font-weight:bold; " href="../main.do"><span style="color:">Charie's</span> <span style="color:">BOX</span></a></h1>
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
				<h3  style="text-align: left; padding-left: 10px; color:black; font-size: 30px; font-weight: bold;"><a href="../shop/shopMain.do" id="snackbar">스낵바</a> | <a id="movieticket">영화관람권</a></h3>
			</div>
			<hr>
			<div style="background: #FEFCF0;">
			<div  class="agile_top_brands_grids" id="giftycon">
			
			
				<c:forEach var="g" items="${giftyconList}">
				<div class='col-md-4 top_brand_left' style='float: left; margin-bottom:30px;'>
					<div class='snipcart-thumb' style='margin-bottom:5px;'>
						<h4 style="color:black; font-size: 24px; text-align: left; padding-left:25px;">${g.giftyconName }</h4>
						<a href='../shop/giftyconDetail.do?giftyconCode=${g.giftyconCode }'><img style='width:380px; height: 380px; border:1px solid black;' src='${g.image }'/></a>
					</div>
					<a href='../cart/addCart.do?giftyconCode=${g.giftyconCode }' class='cart btn btn-primary add-to-cart' style='margin-left:8px; '> <i class='glyphicon glyphicon-shopping-cart'></i>&nbsp&nbspAdd to Cart</a>
					<a href='../shop/giftyconDetail.do?giftyconCode=${g.giftyconCode }' class='btn btn-danger add-to-cart' style='margin-left:10px; '> <i class='glyphicon glyphicon-shopping-cart'></i>&nbsp&nbspNow Buy</a>
				</div>
				</c:forEach>
				
				
			</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
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