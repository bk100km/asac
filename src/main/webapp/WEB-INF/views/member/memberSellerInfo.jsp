<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.co.asac.member.bean.SellerBean" %>

<%
	String sid = (String)session.getAttribute("sid");
	SellerBean seller =(SellerBean)session.getAttribute("seller");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>


<script>
function del() {
	pwd =prompt("비밀번호를 입력하세요");
	var sid = "<%=sid%>";
	var spwd = "<%=seller.getSpwd()%>";
	
	if (pwd != spwd ) {
		if(pwd !=null)
		alert("비밀번호가 틀렸습니다.");
		return
	} 
	else{
    $.ajax({
        type: 'POST',
        url: './de',
        data: {sid:sid, spwd:spwd},
        success: function() {
				alert("탈퇴 되었습니다");
				location.href="http://localhost:8080/asac/";
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    
    });
	}
}
</script>

<jsp:include page="../common/sellerHeader.jsp"></jsp:include>
<div align="center">
<h2>내 정보</h2>
<br><br>
	
	<div>
	<table>
		
		<tr><th>이름</th><td>${seller.sname}</td></tr>
		<tr><th>아이디</th><td>${seller.sid }</td></tr>
		<tr><th>생년월일</th><td>${seller.sbirth }</td></tr>
		<tr><th>전화번호</th><td>${seller.sphone }</td></tr>
		<tr><th>주소</th><td>${seller.saddr }</td></tr>
		<tr><th>이메일</th><td>${seller.smail }</td></tr>
		<tr><th>회사명</th><td>${seller.scompany}</td></tr>
		<tr><th>사업자번호 </th> <td> ${seller.snumber }</td></tr>
		<tr><th>증명서류</th><td>${seller.sfile }</td></tr>
		<tr><th>승인여부</th><td>${seller.sok }</td></tr>
		<tr><th>가입날짜</th><td>${seller.sregdate }</td></tr>
	</table>
	</div><br><br>
	<div><button type="button" onclick="location.href='http://localhost:8080/asac/me/se/up'" class="btn btn-default">수정하기</button> &nbsp;
	<button type="button" onclick="location.href='http://localhost:8080/asac/me/se/in'" class="btn btn-default"> 메인으로</button>
	<button type="button" onclick="javascript:del();" class="btn btn-default" >탈퇴하기</button>
	</div>
	
</div>
<br><br><br><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>