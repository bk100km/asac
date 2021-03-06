<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ASAC 비건마켓</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- modal bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var sid=$("#sid").val();
			var spwd=$("#spwd").val();
				
			if(sid == ""){
				alert("아이디를 입력하세요.");
				$("#sid").focus();
				return;
			}
			if(spwd == ""){
				alert("비밀번호를 입력하세요.");
				$("#spwd").focus();
				return;
			}
			if(sid == "admin"){
				alert("아이디와 비밀번호를 다시 입력하세요.");
				$("#sid").focus();
				return;
			}
			
			
			checkSok();
			
			
			//	document.getElementById("loginForm").action;
			//	document.getElementById("loginForm").submit();
			
		});
			
	
	});
	
	function checkSok() {
		var sid = $('#sid').val(); //id값이 "id"인 입력란의 값을 저장
		var spwd=$("#spwd").val();
		$.ajax({
			url : './so', //Controller에서 인식할 주소
			type : 'post', //POST 방식으로 전달
			data : {
				sid : sid
			},
			success : function(seller) {
			//	alert(seller.sok);
				if (seller.sok == 'N') {
					
					alert("승인되지 않은 아이디 입니다. \n관리자 승인 후 이용하세요");
					
					
				} else if(seller.sok=='Y') { 
					document.getElementById("loginForm").action="lA"
					document.getElementById("loginForm").submit();
					
				} else {
					alert("존재하지 않는 아이디입니다.");
				}
 			},
 			error : function() {
 				alert("에러입니다");
			}
		});
	};
</script>

<style>
body {
	font-family: Pretendard !important;
}
.alert-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.btn-default {
    background-color:#74bf0f;
	border-color:#74bf0f;
	color:#fff;
}
.btn-default:hover {
    background-color:#fff;
	border-color:black;
	color:black;
}

.modal-body {
    font-family: 'Pretendard';
    font-size: 1.3em;
}

.modalButton {
	display: none;
}
.title{
	text-align : center;
}
.logo{
	font-size: 80px;
	font-weight: 600;
	font-family: tahoma;
	color: #74bf0f;
	
}
.logo:hover{
	text-decoration:none !important;
	color: #74bf0f;
}
</style>

</head>
<body>

<div><br><br><br><br><br><br><br><br><br><br><br></div>
<div class=title>
<a class="logo" href="<%= request.getContextPath() %>/">ASAC</a>
</div>
<h2 align="center">판매자 로그인</h2>
<div class="container">
	<div id="login" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form:form id="loginForm" class="loginForm" action="lA" method="post" modelAttribute="seller">
					<label>아이디</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="sid" id="sid" type="text" class="form-control" name="sid" placeholder="아이디" data-toggle="tooltip" data-placement="top" title="아이디 입력란"  />
				
					</div>
					<label>비밀번호</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<form:input path="spwd" id="spwd" type="password" class="form-control" name="spwd" placeholder="비밀번호" data-toggle="tooltip" data-placement="top" title="비밀번호 입력란"  />
					</div>
					<div align="center"><button id="btnLogin" type="button" class="btn btn-default"> &nbsp;로그인&nbsp; </button>&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/me/se/jo'" class="btn btn-default" >회원가입</button>
					</div><hr>
				</form:form>
			</div>
		</div>
	</div>
</div>   
<div><br><br><br><br><br><br><br><br><br><br><br><br></div>	 

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>