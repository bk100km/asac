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

</style>

</head>
<body>

	<jsp:include page="../common/adminHeader.jsp"></jsp:include>
	
	<div class="mypageDiv" id="mypageDiv">

		<% if (request.getParameter("fromURI") == null) { %>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">일반회원</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">판매자회원</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tabmenu_01">
				<jsp:include page="./memberAdminClientListInsert.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="tabmenu_02">
				<jsp:include page="./memberAdminSellerListInsert.jsp"></jsp:include>
			</div>
		</div>
		<% } else { %>
				<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">일반회원</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">판매자회원</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="./memberAdminClientListInsert.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade in active" id="tabmenu_02">
				<jsp:include page="./memberAdminSellerListInsert.jsp"></jsp:include>
			</div>
		</div>
		<% } %>
		
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
