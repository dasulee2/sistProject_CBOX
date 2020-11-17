<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: "나눔바른고딕";
}
.card{
	width:60px;
	height: 30px;
}
#submit{
	width:100px;
	float: right;
}
#pwd{
	width:200px;
	height: 30px;
}
#addCard{
	float:right;
	margin-bottom: 15px;
}
#mid{
	background-color:#EAEAEA;
	border-color:black;
	border-width:thin;
	text-align: left;
	padding-left: 3px;
	height: 30px;
	width:100px;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#submit").click(function(){
			
			var pwd = $("#pwd").val();
			var mid = $("#mid").val(); 
			
			if($("#cardNum1").val()==""||$("#cardNum2").val()==""||$("#cardNum3").val()==""||$("#cardNum4").val()==""){
				alert("카드번호를 입력해주세요");
			}else if(pwd==""){
				alert("비밀번호를 입력해주세요");
			}else{
				var cardNum = $("#cardNum1").val()+"-"+ $("#cardNum2").val()+"-"+ $("#cardNum3").val()+"-"+ $("#cardNum4").val();
				 $.ajax({
					url:"addCard.do",
					data:{"cardNum":cardNum,
						  "pwd":pwd,
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
						//alert(response);
						if(response=='cardCKX'){
							alert("이미 등록되어있는 카드번호 입니다.");
						}else if(response=='addSuccess'){
							alert("등록하였습니다.");
							window.self.close();
						}else{
							alert("등록에 실패하였습니다.");
						}
					}
				});	 
			}
		});
	});
	
</script>
</head>
<body>
		<!-- <p>보유 포인트 <input id="point" type="text" value="">&nbsp&nbsp&nbsp&nbsp 사용할 포인트<input id="usedPoint" name="usedPoint" type="text" value=""> </p> -->
		<p>카드등록하기</p>
		<hr>
		<p>카드 소유자 : <input  type="text" name="mid" id="mid" value="${mid }" readonly="readonly"></p>
		<p>신용카드 <input class="card" type="text" id="cardNum1">-<input class="card" type="text" id="cardNum2">-
		 <input class="card" type="text" id="cardNum3">-<input class="card" type="text" id="cardNum4">
		  <input type="hidden" name="cardNum" id="cardNum"></p>
		<p>결제 비밀번호 <input type="password" name="pwd" id="pwd" ></p>
		<hr>
		<button id="submit">등록하기</button>
</body>
</html>