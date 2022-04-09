<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 취소	
	$("#deletee").on("click", function(){
		if($("#mpwd").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#mpwd").focus();
			return false;
		}
		
		if($("#mpwd2").val()==""){
			alert("비밀번호 확인을 입력해주세요");
			$("#mpwd2").focus();
			return false;
		}
		
		if ($("#mpwd").val() != $("#mpwd2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#mpwd").focus();
			return false;
		}
		
		$.ajax({
			url : './dP',
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				} else{
					if(confirm("회원탈퇴하시겠습니까?")){
						$("#delForm").submit();
					}
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
});
})
</script>

<style>
.input-form {
	max-width: 500px;
	margin-top: 30px !important;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	margin: auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/clientHeader.jsp" />

<div class="container">
	<div class="input-form-background row">
		<div class="input-form mx-auto my-auto">
			<form action="http://localhost:8080/me/cl/dC" method="post" id="delForm">
				<h3 class="mb-3">회원탈퇴</h3>
				<hr class="mb-4">
				<input type="hidden" id="mid" name="mid" value="${member.mid}"/>
				<div class="mb-3">
					<label for="mpwd">비밀번호</label>
					<input type="password" class="form-control" name="mpwd" id="mpwd" required /><br>
				</div>
				<div class="mb-3">
					<label for="mpwd2">비밀번호 확인</label>
					<input type="password" class="form-control" id="mpwd2" required /><br>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="deletee">회원탈퇴</button>
					<button class="cancle btn btn-danger" type="button" onclick="history.go(-1)">취소</button>
				</div>
				<%-- <div>
					<c:if test="${msg == false}">
						비밀번호가 맞지 않습니다.
					</c:if>
				</div> --%>
			</form>
		</div>
	</div>
</div>
<br><br>

<jsp:include page="../common/footer.jsp" />



</body>
</html>