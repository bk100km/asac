<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function cancel(){
		if (confirm("수정을 취소합니까?")){
			location.href="./iF"
		}
	}
</script>
<jsp:include page="../common/sellerHeader.jsp"></jsp:include>
<div align="center">
<form action="./up" method="post">
	<h2>정보수정</h2>
	<br><br>	
	<div>
	
	<table>
		<tr><th>이름</th><td><input type="text" name=sname value="${seller.sname }" readonly> </td></tr>
		<tr><th>아이디</th><td><input type="text" name=sid value="${seller.sid }" readonly></td></tr>
		<tr><th>생년월일</th><td>${seller.sbirth }</td></tr>
		<tr><th>전화번호</th><td><input type="text" name=sphone value="${seller.sphone }"> </td></tr>
		<tr><th>주소</th><td><input type="text" name=saddr value="${seller.saddr }"></td></tr>
		<tr><th>이메일</th><td><input type="text" name=smail value="${seller.smail }"></td></tr>
		<tr><th>회사명</th><td>${seller.scompany}</td></tr>
		<tr><th>사업자번호 </th> <td> ${seller.snumber }</td></tr>
		<tr><th>증명서류</th><td>${seller.sfile }</td></tr>
		<tr><th>승인여부</th><td>${seller.sok }</td></tr>
		<tr><th>가입날짜</th><td>${seller.sregdate }</td></tr>
	</table>
	<br><br>
	</div>
	<input type="submit" class="btn btn-default" value="수정">
	<button type="button" class="btn btn-default" onclick="javascript:cancel();">취소</button>
</form>
<br><br><br>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>