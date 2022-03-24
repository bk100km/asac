<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="kr.co.asac.orders.bean.OrderBean" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body { margin: 0;}

.mypageDiv {
	width: 90%; 
	max-width:1200px; 
	margin: 0 auto; 
	margin-top: 50px;
}
</style>
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

		<div class="mypageDiv" id="mypageDiv">

		<% if (request.getParameter("fromURI") == null) { %>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">전체 상품</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">본인 상품</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tabmenu_01">
				<jsp:include page="./orderAdminList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="tabmenu_02">
				<jsp:include page="./orderSellerAdminList.jsp"></jsp:include>
			</div>
		</div>
		<% } else { %>
				<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">전체 상품</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">본인 상품</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="./orderAdminList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade in active" id="tabmenu_02">
				<jsp:include page="./orderSellerAdminList.jsp"></jsp:include>
			</div>
		</div>
		<% } %>
		
	</div>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
	</footer>
</div></body>
</html>