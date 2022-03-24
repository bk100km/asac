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
	<h1 class="title">주문 상세 정보</h1>
	<div id="container" class="table-responsive">
	<div id="content">
	<table class="table table-borderless tdiv table-sm">
	  <tr><td class="thde">주문번호</td></tr>
      <tr><td class="tdde">${orderAdminInfo.ocode}</td></tr>
      
      <tr><td class="thde">판매자아이디</td></tr>
      <tr><td class="tdde">${orderAdminInfo.sid}</td></tr>
      
      <tr><td class="thde">주문자아이디</td></tr>
      <tr><td class="tdde">${orderAdminInfo.mid}</td></tr>
      
      <tr><td class="thde">주문자 명</td></tr>
      <tr><td class="tdde">${orderAdminInfo.mname}</td></tr>
      
      <tr><td class="thde">상품코드</td></tr>
      <tr><td class="tdde">${orderAdminInfo.pcode}</td></tr>
      
      <tr><td class="thde">상품명</td></tr>
      <tr><td class="tdde">${orderAdminInfo.pname}</td></tr>
      
      <tr><td class="thde">상품가격</td></tr>
      <tr><td class="tdde"><fmt:formatNumber value="${orderAdminInfo.pprice}" pattern="#,###"/>원</td></tr>
      
      <tr><td class="thde">수량</td></tr>
      <tr><td class="tdde">${orderAdminInfo.ocount}</td></tr>
      
      <tr><td class="thde">주문자이름</td></tr>
      <tr><td class="tdde">${orderAdminInfo.oname}</td></tr>
      
      <tr><td class="thde">주문자우편번호</td></tr>
      <tr><td class="tdde">${orderAdminInfo.oaddrz}</td></tr>
      
      <tr><td class="thde">주문자주소</td></tr>
      <tr><td class="tdde">${orderAdminInfo.oaddr}</td></tr>
      
      <tr><td class="thde">주문자상세주소</td></tr>
      <tr><td class="tdde">${orderAdminInfo.oaddrd}</td></tr>
      
    </table><br>
	
	<button type="button" id="btnMod" class="btn btn-lg" onclick="location.href='up?ocode=${orderAdminInfo.ocode}'">
	<span class="btde">수 정</span></button>
	<button type="button" id="btnCan" class="btn btn-lg" onclick="location.href = document.referrer;">
	<span class="btde">목 록</span></button>
	<button type="button" id="btnCan" class="btn btn-lg" onclick="location.href ='de?ocode=${orderAdminInfo.ocode}'">
	<span class="btde">주문 취소</span></button>	
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