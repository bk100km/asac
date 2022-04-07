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

<style>
	body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top);
	background: -webkit-linear-gradient(bottom left);
	background: -moz-linear-gradient(bottom left);
	background: -o-linear-gradient(bottom left);
	background: linear-gradient(to top right);
}

.input-form {
	max-width: 680px;
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

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="../common/sellerHeader.jsp" />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <jsp:include page="../common/toolbarHeader.jsp" />
	
	<div class="container">
	<div class="input-form-background row">
			<div class="input-form mx-auto my-auto">
			<h2>내 정보</h2>
			
					<div class="mb-3">
						<label for="sname">이름 </label>
						<input type="text" class="form-control"  value="${seller.sname}" readonly/><br>
					</div>
					
						<div class="mb-3">
						<label for="sid">아이디 </label>
						<input type="text" class="form-control"  value="${seller.sid}" readonly/><br>
					</div>
					<div class="mb-3">
						<label for="sbirth">생년월일 </label>
						<input type="text" class="form-control"  value="${seller.sbirth}" name="sbirth" id="sbirth" readonly /><br>
					</div>
					<div class="mb-3">
						<label for="sbirth">전화번호 </label>
						<input type="text" class="form-control"  value="${seller.sphone}" name="sphone" id="sphone" readonly /><br>
					</div>
					<div class="mb-3">
						<label for="smail">이메일</label>
						<input type="text" class="form-control"  value="${seller.smail}" readonly/><br>
					</div>		
					<div class="mb-3">
						<label for="scompany">회사명 </label>
						
		            		
							<input type="text" class="form-control"  name="scompany" id="scompany" value="${seller.scompany}"  readonly/><br>
		            	
					</div>
					<div class="mb-3">
						<label for="snumber">사업자번호 </label>
						
		            		
							<input type="text" class="form-control" maxlength="9" name="snumber" id="snumber" value=" ${seller.snumber }" readonly /><br>
		            	
					</div>
					<div >
						<label for="sfile">증명서류</label>
						
		            		
							<input type="text" class="form-control" name="sfile" id="sfile" value="${seller.sfile }" readonly /><br>
		            	
					</div>
					<div >
						<label for="sok">승인여부 </label>
						
		            		
							<input type="text" class="form-control" name="sok" id="sok" value="${seller.sok}"  readonly /><br>
		            	
					</div>
					<div>
						<label for="sregdate">가입날짜 </label>
					    		
							<input type="text" class="form-control" name="sregdate" id="sregdate" value="${seller.sregdate}"  readonly/><br>
					</div>
					<div>
						<label for="saddrz">우편번호 </label>
					    		
							<input type="text" class="form-control" name="saddrz" id="saddrz" value="${seller.saddrz}"  readonly/><br>
					</div>
					<div>
						<label for="saddr">도로명주소 </label>
					    		
							<input type="text" class="form-control" name="ssaddre" id="ssaddr" value="${seller.saddr}"  readonly/><br>
					</div>
					<div>
						<label for="saddrd">상세주소 </label>
					    		
							<input type="text" class="form-control" name="saddrd" id="saddrd" value="${seller.saddrd}"  readonly/><br>
					</div>
					
					<div><button type="button" onclick="location.href='http://localhost:8080/asac/me/se/up'" class="btn btn-default">수정하기</button> &nbsp;
					<button type="button" onclick="location.href='http://localhost:8080/asac/me/se/in'" class="btn btn-default"> 메인으로</button>
					<button type="button" onclick="del()" class="btn btn-default" >탈퇴하기</button>
					
		</div>
		</div>
		</div>
	</div>
	<br><br>
	

<br><br><br><br><br><footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>
</div>
</div>
</body>
</html>