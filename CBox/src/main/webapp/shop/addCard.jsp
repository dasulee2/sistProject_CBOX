<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: "�����ٸ����";
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
				alert("ī���ȣ�� �Է����ּ���");
			}else if(pwd==""){
				alert("��й�ȣ�� �Է����ּ���");
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
							alert("�̹� ��ϵǾ��ִ� ī���ȣ �Դϴ�.");
						}else if(response=='addSuccess'){
							alert("����Ͽ����ϴ�.");
							window.self.close();
						}else{
							alert("��Ͽ� �����Ͽ����ϴ�.");
						}
					}
				});	 
			}
		});
	});
	
</script>
</head>
<body>
		<!-- <p>���� ����Ʈ <input id="point" type="text" value="">&nbsp&nbsp&nbsp&nbsp ����� ����Ʈ<input id="usedPoint" name="usedPoint" type="text" value=""> </p> -->
		<p>ī�����ϱ�</p>
		<hr>
		<p>ī�� ������ : <input  type="text" name="mid" id="mid" value="${mid }" readonly="readonly"></p>
		<p>�ſ�ī�� <input class="card" type="text" id="cardNum1">-<input class="card" type="text" id="cardNum2">-
		 <input class="card" type="text" id="cardNum3">-<input class="card" type="text" id="cardNum4">
		  <input type="hidden" name="cardNum" id="cardNum"></p>
		<p>���� ��й�ȣ <input type="password" name="pwd" id="pwd" ></p>
		<hr>
		<button id="submit">����ϱ�</button>
</body>
</html>