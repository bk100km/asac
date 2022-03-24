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
			document.getElementById("loginForm").action="lA"
			document.getElementById("loginForm").submit();
		});
	});
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
    color: #fff !important;
    background-color: #1e1a1b!important;
    border-color: #1e1a1b!important;
}
.btn-default:hover {
    color: #1e1a1b !important;
    background-color: white !important;
    border-color: #1e1a1b !important;
}

.modal-body {
    font-family: 'Pretendard';
    font-size: 1.3em;
}

.modalButton {
	display: none;
}

</style>

</head>
<body>

<jsp:include page="../common/sellerHeader.jsp"></jsp:include>

<div><br><br><br></div>
<div class="container">
	<div id="login" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h2>ASAC 중간관리자 로그인</h2><hr>
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
					<button onclick="history.back()" class="btn btn-default"> 뒤로가기</button>
					</div><hr>
				</form:form>
			</div>
		</div>
	</div>
</div>   
<div><br><br><br></div>	 

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>