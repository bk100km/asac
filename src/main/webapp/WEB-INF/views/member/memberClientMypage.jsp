<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ASAC 비건마켓</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body { margin: 0;}
 
.mypageDiv {
	width: 90%; 
	max-width:1200px; 
	margin: 0 auto; 
	margin-top: 50px;
}

.mypageDiv li {
	width: 100px;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	padding-right: 10px;
	background-color: #74bf0f;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	margin-left: 10px;
	text-align: center;
}
.mypageDiv li a {
	color: white;
	font-size: 16px;
}
.mypageDiv ul .active {
	background-color: #558d0b;
}

</style>

</head>
<body>
	<jsp:include page="../common/clientHeader.jsp"></jsp:include>
	<div class="mypageDiv" id="mypageDiv">

		<% if (request.getParameter("fromURI") == null) { %>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">주문내역</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">내 정보</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane in active" id="tabmenu_01">
				<jsp:include page="../orders/orderClientList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="tabmenu_02">
				<jsp:include page="./memberClientInfo.jsp"></jsp:include>
			</div>
		</div>
		<% } else { %>
				<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">주문내역</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">내 정보</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="../orders/orderClientList.jsp"></jsp:include>
			</div>
			<div class="tab-pane in active" id="tabmenu_02">
				<jsp:include page="./memberClientInfo.jsp"></jsp:include>
			</div>
		</div>
		<% } %>
		
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
