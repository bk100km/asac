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
	float: unset;
}	

.btn-default{
	width:190px;
	position: relative;
	
}


</style>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
    	<header>
		<jsp:include page="../common/sellerHeader.jsp" />
		</header>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <jsp:include page="../common/sellerToolbarHeader.jsp" />
	<h2 align ="center">내 정보</h2>
	<div class="container">
	<div class="input-form-background">
	<div class="input-form ">
			
			
			
					<div class="mb-2">
						<label for="sname">이름 </label>
						<input type="text" class="form-control"  value="${seller.sname}" readonly/>
					</div>
					
						<div class="mb-2">
						<label for="sid">아이디 </label>
						<input type="text" class="form-control"  value="${seller.sid}" readonly/>
					</div>
					<div class="mb-2">
						<label for="sbirth">생년월일 </label>
						<input type="text" class="form-control"  value="${seller.sbirth}" name="sbirth" id="sbirth" readonly />
					</div>
					<div class="mb-2">
						<label for="sbirth">전화번호 </label>
						<input type="text" class="form-control"  value="${seller.sphone}" name="sphone" id="sphone" readonly />
					</div>
					<div class="mb-2">
						<label for="smail">이메일</label>
						<input type="text" class="form-control"  value="${seller.smail}" readonly/>
					</div>		
					<div class="mb-2">
						<label for="scompany">회사명 </label>
						
		            		
							<input type="text" class="form-control"  name="scompany" id="scompany" value="${seller.scompany}"  readonly/>
		            	
					</div>
					<div class="mb-2">
						<label for="snumber">사업자번호 </label>
						
		            		
							<input type="text" class="form-control" maxlength="9" name="snumber" id="snumber" value=" ${seller.snumber }" readonly />
		            	
					</div>
					<div class="mb-2">
						<label for="sfile">증명서류</label>
						
		            		
							<input type="text" class="form-control" name="sfile" id="sfile" value="${seller.sfile }" readonly />
		            	
					</div>
					<div class="mb-2" >
						<label for="sok">승인여부 </label>
						
		            		
							<input type="text" class="form-control" name="sok" id="sok" value="${seller.sok}"  readonly />
		            	
					</div >
					<div class="mb-2">
						<label for="sregdate">가입날짜 </label>
					    		
							<input type="text" class="form-control" name="sregdate" id="sregdate" value="${seller.sregdate}"  readonly/>
					</div>
					<div class="mb-2">
						<label for="saddrz">우편번호 </label>
					    		
							<input type="text" class="form-control" name="saddrz" id="saddrz" value="${seller.saddrz}"  readonly/>
					</div>
					<div class="mb-2">
						<label for="saddr">도로명주소 </label>
					    		
							<input type="text" class="form-control" name="ssaddre" id="ssaddr" value="${seller.saddr}"  readonly/>
					</div >
					<div class="mb-2">
						<label for="saddrd">상세주소 </label>
					    		
							<input type="text" class="form-control" name="saddrd" id="saddrd" value="${seller.saddrd}"  readonly/><br>
					</div>
					<div align="center">
					<div><button type="button" onclick="location.href='<%= request.getContextPath() %>/me/se/up'" class="btn btn-default">수정하기</button> &nbsp;
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/me/se/in'" class="btn btn-default"> 메인으로</button>  &nbsp;
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/me/se/de'" class="btn btn-default" >탈퇴하기</button>
					</div>
		</div>
		</div>
		</div>

	</div>
	
<br><br><br><footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>
</div>
</div>

	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
</body>
</html>