<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String sid = (String) session.getAttribute("sid");

	if(sid == null){
		session.invalidate();
		out.println("<script>");
		out.println("alert('접근 권한이 없습니다.');");
		out.println("location.href='/';");
		out.println("</script>");	
	}
%>
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

<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/bootstrap/adminIndex/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/bootstrap/adminIndex/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Pretendard Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

<style>
.bg-gradient-success {
	background-color: #74bf0f;
	background-image: none;
}

.nav-link {
	font-family: 'Pretendard';
}

.sidebar .sidebar-heading {
    color: #436414 !important;
}
@media ( max-width : 991px) {
.sidebar {
	display: none;
}
}
</style>
</head>
<body>
	
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion "
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="<%= request.getContextPath() %>/me/se/in">
				<div class="sidebar-brand-icon">
					<i class="fas fa-regular fa-seedling"></i>
				</div>
				<div class="sidebar-brand-text mx-3">ASAC</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Store ManageMent</div>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link"
				href="<%= request.getContextPath() %>/or/se/li"> <i
					class="fas fa-solid fa-truck"></i> <span>주문관리</span></a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link"
				href="<%= request.getContextPath() %>/pr/se/li"> <i
					class="fas fa-regular fa-box"></i> <span>상품관리</span></a></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-regular fa-calculator"></i> <span>매출관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">매출 통계</h6> 
						<a class="collapse-item" href="<%= request.getContextPath() %>/sa/se/dy">요일별 매출</a>
						<a class="collapse-item" href="<%= request.getContextPath() %>/sa/se/po">상품별 매출</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Membership</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="<%= request.getContextPath() %>/me/se/iF"> <i
					class="fas fa-solid fa-users"></i> <span>판매자 정보</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->
	

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/bootstrap/adminIndex/vendor/jquery/jquery.min.js"></script>
	<script	src="/resources/bootstrap/adminIndex/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script	src="/resources/bootstrap/adminIndex/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/bootstrap/adminIndex/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script	src="/resources/bootstrap/adminIndex/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script	src="/resources/bootstrap/adminIndex/js/demo/chart-area-demo.js"></script>
	<script	src="/resources/bootstrap/adminIndex/js/demo/chart-pie-demo.js"></script>
</body>
</html>