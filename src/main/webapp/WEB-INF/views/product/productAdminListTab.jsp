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
    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="../common/adminHeader.jsp"></jsp:include>
    	<!-- Content Wrapper -->
    	<div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
        		<jsp:include page="../common/toolbarHeader.jsp" />
	
	<div class="mypageDiv" id="mypageDiv">

		<% if (fromURI == null || 
			fromURI.substring(0, 9).equals("/pr/ad/se") || 
			fromURI.substring(0, 9).equals("/pr/ad/in") || 
			fromURI.substring(0, 9).equals("/pr/ad/up") || 
			fromURI.substring(0, 9).equals("/pr/ad/de")) { %>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">전체 상품 목록</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">내 상품 목록</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tabmenu_01">
				<jsp:include page="./productAdminList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="tabmenu_02">
				<jsp:include page="./productAdminMyList.jsp"></jsp:include>
			</div>
		</div>
		<% } else { %>
				<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">전체 상품 목록</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">내 상품 목록</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="./productAdminList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade in active" id="tabmenu_02">
				<jsp:include page="./productAdminMyList.jsp"></jsp:include>
			</div>
		</div>
		<% } %>
		
	</div>
	
	<br><br><br>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
	</footer>
	</div>
	</div>
</div>
</body>
</html>
