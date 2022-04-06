<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String fromURI = (String)request.getAttribute("fromURI"); %>
<% System.out.println("탭에서 fromURI값은 = " + fromURI); %>
<!DOCTYPE html>
<html>
<head>
<title>ASAC 비건마켓</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Pretendard Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

<style>
body { margin: 0;}

.mypageDiv {
	width: 85%; 
	max-width:1500px; 
	margin: 0 auto; 
	margin-top: 50px;
}

#page-wrapper {
	width: 90%;
	margin: auto;
	margin-top: 30px;
	height: 1000px;
}

.nav-tabs {
	font-size: 20px;
}

.nav-tabs > li {
	margin-left: 10px;
	padding-left: 15px;
	padding-right: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	background: #d8e3c9;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.nav-tabs > li > a{
	color: #85976d;
	font-family: Pretendard;
	text-decoration: none;
}

.nav-tabs > .active {
	background: #b8d590;
}
</style>

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="../common/adminHeader.jsp"></jsp:include>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
	
	<div class="mypageDiv" id="mypageDiv">

		<% if (fromURI == null || 
			fromURI.substring(0, 9).equals("/me/ad/cS") || 
			fromURI.substring(0, 9).equals("/me/ad/ci") || 
			fromURI.substring(0, 9).equals("/me/ad/cU") || 
			fromURI.substring(0, 9).equals("/me/ad/cD")) { %>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">일반회원</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">판매자회원</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tabmenu_01">
				<jsp:include page="./memberAdminClientList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="tabmenu_02">
				<jsp:include page="./memberAdminSellerList.jsp"></jsp:include>
			</div>
		</div>
		<% } else { %>
				<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">일반회원</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">판매자회원</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="./memberAdminClientList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade in active" id="tabmenu_02">
				<jsp:include page="./memberAdminSellerList.jsp"></jsp:include>
			</div>
		</div>
		<% } %>
		
	</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	</div>

</body>
</html>
