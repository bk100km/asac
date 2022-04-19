<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ASAC 관리자</title>

<style>
@media ( min-width : 993px) {
#ftco-navbar {
	display: none;
}
}

@media ( max-width : 993px) {
#topbar {
	display: none;
}
}
</style>
</head>
<body>
		<!-- new nav -->
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container" id="headerContainer">
				<a class="navbar-brand" href="<%= request.getContextPath() %>/me/ad/in">ASAC</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
									

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/or/ad/li"
							class="nav-link">주문관리</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/ad/al"
							class="nav-link">상품관리</a></li>
						<li class="nav-item dropdown cta cta-colored"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">매출관리</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="<%= request.getContextPath() %>/sa/ad/dy">날짜별 매출</a> <a
									class="dropdown-item"
									href="<%= request.getContextPath() %>/sa/ad/ct">상품별 매출</a> <a
									class="dropdown-item"
									href="<%= request.getContextPath() %>/sa/ad/sl">판매자별 매출</a>
							</div>
						</li>	
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/me/ad/lC"
							class="nav-link">일반회원 관리</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/me/ad/lS"
							class="nav-link">판매자 관리</a></li>
						<li class="nav-item cta cta-colored"><a
							href="<%= request.getContextPath() %>/ca/cl/li" class="nav-link"
							id="borderNavCart"><span class="icon-shopping_cart"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- new nav -->
		
	<!-- Topbar -->
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" id="topbar">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
			<div class="topbar-divider d-none d-sm-block"></div>
			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> 
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">${sid}</span> 
				<img class="img-profile rounded-circle" src="<c:url value="/resources/bootstrap/adminIndex/img/undraw_profile.svg"/>">
			</a> <!-- Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="<%= request.getContextPath() %>/me/se/lO">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">
						</i>로그아웃
					</a>
				</div>
			</li>

		</ul>

	</nav>
	<br>
	
</body>
</html>