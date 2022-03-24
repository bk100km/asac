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

<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var mid=$("#mid").val();
			var mpwd=$("#mpwd").val();
			if(mid == ""){
				alert("아이디를 입력하세요.");
				$("#mid").focus();
				return;
			}
			if(mpwd == ""){
				alert("비밀번호를 입력하세요.");
				$("#mpwd").focus();
				return;
			}
			if(mid == "admin"){
				alert("아이디와 비밀번호를 다시 입력하세요.");
				$("#mid").focus();
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

<jsp:include page="../common/clientHeader.jsp"></jsp:include>

<div><br><br><br></div>
<div class="container">
	<div id="login" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h2>ASAC 일반사용자 로그인</h2><hr>
				<form:form id="loginForm" class="loginForm" action="lA" method="post" modelAttribute="member">
					<label>아이디</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="mid" id="mid" type="text" class="form-control" name="mid" placeholder="아이디" data-toggle="tooltip" data-placement="top" title="아이디 입력란"  />
					</div>
					<label>비밀번호</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<form:input path="mpwd" id="mpwd" type="password" class="form-control" name="mpwd" placeholder="비밀번호" data-toggle="tooltip" data-placement="top" title="비밀번호 입력란"  />
					</div>
					<div align="center"><button id="btnLogin" type="button" class="btn btn-default"> &nbsp;로그인&nbsp; </button>&nbsp;&nbsp;&nbsp;
					<button onclick="history.back()" class="btn btn-default"> 뒤로가기</button>
					</div><hr>
					<div align="center">
						<a href="" class="btn btn-default" title="회원가입 링크로 이동">회원가입</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>   
<div><br><br><br></div>	 

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>