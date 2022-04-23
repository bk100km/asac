<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/animate.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/aos.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/jquery.timepicker.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/flaticon.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/icomoon.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(function(){
		$("#findBtn").click(function(){
			if($("#mname").val()==''){
	        	alert("이름을 입력해주세요.");
	        	$("#mname").focus();
	        }else if($("#mphone").val()==''){
	        	alert("핸드폰을 입력해주세요.");
	        	$("#mname").focus();
	        }else if($("#mmail").val()==''){
	        	alert("이메일을 입력해주세요.");
	        	$("#mname").focus();
	        }
			$.ajax({
				url : "<%= request.getContextPath() %>/me/cl/fI",
				type : "POST",
				data : {
					name : $("#mname").val(),
					phone : $("#mphone").val(),
					email : $("#mmail").val(),
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
	
	$(document).on("keyup", ".phoneNumber", function() { 
  		$(this).val( 
  			$(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") 
  		); 
  	});
</script>

<style type="text/css">
body {
	font-family: Pretendard !important;
	margin:0 auto; 
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top);
	background: -webkit-linear-gradient(bottom left);
	background: -moz-linear-gradient(bottom left);
	background: -o-linear-gradient(bottom left);
	background: linear-gradient(to top right);
}

h1 {
	font-size: 80px;
	font-weight: 600;
	font-family: tahoma;
	text-align: center;
	color: #74bf0f;
}

a {
	color: #74bf0f;
	text-decoration: none !important;
}

h1 a:hover {
	color: black;
}

h2 {
	font-family: tahoma;
    text-align: center;
    color: #74bf0f;
}

.input-form {
	font-family: tahoma;
	width: 430px;
	margin-top: 30px !important;
	padding: 28px 28px 10px 28px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	margin: auto;
}

.center{
	text-align:center;
}
.btn{
	background-color:#74bf0f !important;
}
.btn:hover {
    color: #1e1a1b !important;
    background-color: white !important;
    border-color: #1e1a1b !important;
}
.margin{
	padding-bottom:70px;
}
footer{
	 color: #74bf0f !important;
}
.container{
	margin:0 auto; 
}
.wrap { display: flex; min-height: 60vh; flex-direction: column; }
</style>
<title>아이디 찾기</title>
</head>
<body>
<div><br><br><br><br></div>
<div class="container" id="headerContainer">
		<h1><a href="<%= request.getContextPath() %>/">ASAC</a></h1>
</div>
<div>
	<h2>아이디 찾기</h2>
</div>
<div class="wrap">
<div class="container">
	<div class="input-form-background row">
		<div class="input-form mx-auto my-auto">
			<div class="mb-3">
				<label>이름</label>
				<input class="form-control" type="text" id="mname" name="mname" placeholder="홍길동" pattern="^[가-힣]+$" maxlength="4" required>
			</div>
			<div class="mb-3">
				<label>핸드폰 번호</label>
				<input class="form-control phoneNumber" type="tel" id="mphone" name="mphone" placeholder="010-1234-1234" maxlength="13" required>
			</div>
			<div class="mb-3">
				<label>이메일</label>
				<input class="form-control" type="text" id="mmail" name="mmail" placeholder="you@example.com" pattern="^[a-zA-Z0-9._%+-]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required>
			</div>
			<div class="mb-3 center">
				<button type="submit" id="findBtn" class="btn btn-primary">찾기</button> &nbsp;&nbsp;&nbsp;
				<button type="submit" onclick="history.go(-1);" class="btn btn-primary">로그인으로</button>
			</div>
		</div>
	</div>
</div>
</div>
<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>