<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var total = $(opener.document).find("#total1").text();
		$("#paytotal").html(total+"<i>��</i>");
		
		$("#addCard").click(function(){
			window.open("addCard.do","ī����","width=420px, height=250px, menubar=no, location=no, toolbar=no , fullscreen=no, scrollbars=yes")
		});
		
		$("#submit").click(function(){
			if($("#cardNum1").val()==""||$("#cardNum2").val()==""||$("#cardNum3").val()==""||$("#cardNum4").val()==""){
				alert("ī���ȣ�� �Է����ּ���");
			}else if($("#pwd").val()==""){
				alert("��й�ȣ�� �Է����ּ���");
			}else{
				var cardNum = $("#cardNum1").val()+"-"+ $("#cardNum2").val()+"-"+ $("#cardNum3").val()+"-"+ $("#cardNum4").val();
				var pwd = $("#pwd").val();
				var mid = $("#mid").val();
				$.ajax({
					url:"payment.do",
					data:{"cardNum":cardNum,
						  "pwd":pwd	,
						  "mid":mid
					     },
					type:"POST",
					dataType:"text",
					error:function(jqXHR){
						alert(jqXHR.status);
						//alert(jqXHR.statusText);
						//alert(jqXHR.responseText);
						//alert(jqXHR.readyState);
					},
					success:function(response){	
						alert(response);
						if(response=='cardX'){
							alert("ī���ȣ�� ��й�ȣ�� Ȯ�����ּ���.")
						}else if(response=='midX'){
							alert("ī������ڰ� ��ġ���� �ʽ��ϴ�.")
						}else if(response=='success'){
							$(opener.document).find("#cardNum").val(cardNum);
							window.self.close();
						}
					}
				});	
			}
		});
	});
	
</script>
<style type="text/css">
.main{
	margin-left:20px;
	width:500px;
	font-family: 'Overpass', sans-serif;
	font-size:100%;
}
.main_top{
	background:#efd53b;
	height:250px;
}
.wthree_total h2{
	text-align: center;
    font-size: 1.8em;
    color: #212121;
    text-transform: capitalize;
	letter-spacing: 5px;
	float:left;
	margin-left:15px;
	font-weight: normal;
	vertical-align: 3px;
	padding-bottom: 5px;
	
}
.wthree_total span{
	font-size: 1.8em;
    padding-left: 0.5em;
}
.wthree_total h2 span i{
	font-size:.3em;
	font-style: normal;
	vertical-align: middle;
}
.name{
	width:95%;
	height: 30px;
	background-color:#e7e7e7;
	border-color:black;
	border-width:thin;
	padding:15px 10px;
}
.name:focus {
	height: 30px;
	outline: 0;
}
.control-label{
	display: block;
	font-size:1.2em;
	margin: 5px 5px;
}
.card-number{
	width:18%;
	height: 30px;
	border:1px solid #e7e7e7;
	padding:15px 10px;
	margin:4px;
}
.card-number:focus {
	height: 30px;
	border:1px solid #66afe9;
	outline: 0;
}
.pwd{
	width:95%;
	height: 30px;
	border:1px solid #e7e7e7;
	padding:15px 10px;
}
.pwd:focus {
	height: 30px;
	border:1px solid #66afe9;
	outline: 0;
}
</style>
</head>
<body>

		<!-- <p>���� ����Ʈ <input id="point" type="text" value="">&nbsp&nbsp&nbsp&nbsp ����� ����Ʈ<input id="usedPoint" name="usedPoint" type="text" value=""> </p> -->
		<div class="main">
		<div class="main_top">
				<div style=" float:left; color:#917F15;">
					<h3 style="text-align: left; margin-right:100px; padding-left:10px; padding-top: 20px;">Checkout Form</h3>
				</div>
				<div class="clear"> 
				
				</div>
				<div class="wthree_total" style="padding-right:10px; padding-top: 10px;">
					<h2>total to pay <span id="paytotal"><i>��</i></span></h2>
				</div>
		</div>
		
		<p>���������Է�</p>
		<hr>
		<div class="controls" style="width:100%; margin-top: 10px;">
			<label class="control-label">Name on Card </label>
			<input class="name" id="mid" type="text" id="mid" name="mid" value="${mid }" readonly="readonly" >
		</div>
		<br>
		<div class="controls">
			<label class="control-label">Card Number</label>
			<div style="width:100%;">
			 <input class="card-number" type="text" id="cardNum1"   placeholder="&#149;&#149;&#149;&#149;">
			 <input class="card-number" type="text" id="cardNum2"  placeholder="&#149;&#149;&#149;&#149;">
			 <input class="card-number" type="text" id="cardNum3"  placeholder="&#149;&#149;&#149;&#149;">
			 <input class="card-number" type="text" id="cardNum4"  placeholder="&#149;&#149;&#149;&#149;">
			 <input  type="hidden" id="cardNum">
			</div>
		</div>
		<br>
		<div class="controls">
			<label class="control-label">Password</label>
			<input class="pwd" id="pwd" name="pwd" type="password" name="expiration-month-and-year" placeholder="&#149;&#149;&#149;&#149;&#149;&#149;&#149;&#149;">
		</div>
		<hr>
		<button class="btn btn-danger" id="submit">�����ϱ�</button>
		<button id="addCard" style="float: right;">ī�� ����ϱ�</button>
		<!-- <input id="submit"type="submit" value="�����ϱ�"> -->
		</div>

</body>
</html>