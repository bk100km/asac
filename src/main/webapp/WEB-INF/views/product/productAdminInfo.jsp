<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 상세 - 최고 관리자</title>
<script type="text/javascript">
	
$(function() {

	var url = window.location.href;
	$('.page-item').find('a').each(function() {
		if (url == (this.href)) {
			$(this).toggleClass('active');
		}
	});
});

$(function() {
	$('#topBtn').hide();
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	$("#topBtn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 300);
		return false;
	});
});
</script>
</head>
<body>
<div class="wrap">
	<header>
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" flush="false"></jsp:include>
	</header>
	
	<section id="AdminInfoArea">
	<h1 class="title">상품 상세 정보</h1>
	<div id="container" class="table-responsive">
	<div id="content">
	<table class="table table-borderless tdiv table-sm">
	  <tr><td class="thde">상품 코드</td></tr>
      <tr><td class="tdde">${productAdminInfo.pcode}</td></tr>
      
      <tr><td class="thde">상품 명</td></tr>
      <tr><td class="tdde">${productAdminInfo.pname}</td></tr>
      
      <tr><td class="thde">상품 가격</td></tr>
      <tr><td class="tdde"><fmt:formatNumber value="${productAdminInfo.pprice}" pattern="#,###"/>원</td></tr>
      
      <tr><td class="thde">카테고리</td></tr>
      <tr><td class="tdde">${productAdminInfo.pcate}</td></tr>
      
      <tr><td class="thde">상품 태그</td></tr>
      <tr><td class="tdde">${productAdminInfo.ptag}</td></tr>
          
      <tr><td class="thde">상품 사진</td></tr>
      <tr><td class="tdde">${productAdminInfo.pfile}</td></tr>
      
      <tr><td class="thde">상품 설명</td></tr>
      <tr><td class="tdde">${productAdminInfo.pcontent}</td></tr>
      
      <tr><td class="thde">날짜</td></tr>
      <tr><td class="tdde">${productAdminInfo.pregdate}</td></tr>
      
      <tr><td class="thde">판매자 아이디</td></tr>
      <tr><td class="tdde">${productAdminInfo.sid}</td></tr>
    </table><br>
    
	<button type="button" id="btnCan" class="btn btn-lg" onclick="location.href = document.referrer;">
	<span class="btde">목 록</span></button>
	<button type="button" id="btnMod" class="btn btn-lg" onclick="location.href='up?pcode=${ProductAdminInfo.pcode}'">
	<span class="btde">수 정</span></button>
	<button type="button" id="btnCan" class="btn btn-lg" onclick="location.href='de?pcode=${ProductAdminInfo.pcode}'">
	<span class="btde">삭 제</span></button>	
	</div></div><br>
	
	<div>
		<a href="#" id="topBtn">맨 위로</a>
	</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
	</footer>

</div>
</body>
</html>