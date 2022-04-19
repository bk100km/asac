<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String mid = (String) session.getAttribute("mid");
	System.out.println("헤더에서 mid 값 = " + mid);
	String referer = request.getHeader("Referer");
	System.out.println("헤더에서 Referer 값 = " + referer);
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/animate.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/aos.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/jquery.timepicker.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/flaticon.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/icomoon.css">
<link rel="stylesheet" href="/resources/bootstrap/vegefoods-master/css/style.css">

<!-- Pretendard Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">


<style>



@media ( min-width : 1800px) {
.navbar-brand {
	font-size: 80px;
	margin-left: 4rem;
}
}

@media ( max-width : 1799px) {
.navbar-brand {
	font-size: 50px;
	margin-left: 3rem;
}
}

@media ( max-width : 1399px) {
.navbar-brand {
	font-size: 40px;
	margin-left: 2rem;
}
}

#headerContainer {
	margin: 0;
}

#headerContainer {
		max-width: 2000px;
}

.navbar-expand-lg .navbar-nav {
	margin: auto;
}

@media ( min-width : 1800px) {
.ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
	font-size: 190%;
	font-family: Pretendard;
	padding-left: 1em;
	padding-right: 2em;
	margin: auto;
	color: #82ae46;
}
}

@media ( max-width : 1799px) {
.ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
	font-size: 150%;
	font-family: Pretendard;
	padding-left: 1em;
	padding-right: 2em;
	color: #82ae46;
}
}

@media ( max-width : 1399px ) {
.ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
	font-size: 110%;
	font-family: Pretendard;
	padding-left: 1em;
	padding-right: 2em;
	color: #82ae46;
}
}

@media ( max-width : 1199px ) {
.ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
	font-size: 100%;
	font-family: Pretendard;
	padding-left: 1em;
	padding-right: 1em;
	color: #82ae46;
}
}

@media ( min-width : 1800px) {
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	font-size: 15px;
	font-family: Pretendard;
	padding-left: 0.5em;
	padding-right: 1em;
	padding-top: 0;
	background: white;
	color: #82ae46 !important;
}
}

@media ( max-width : 1799px) {
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	font-size: 12px;
	font-family: Pretendard;
	padding-left: 0.5em;
	padding-right: 1em;
	padding-top: 0;
	background: white;
	color: #82ae46 !important;
}
}

@media ( max-width : 1399px) {
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	font-size: 12px;
	font-family: Pretendard;
	padding-left: 1em;
	padding-right: 2em;
	padding-top: 0;
	background: white;
	color: #82ae46 !important;
}
}

@media ( max-width : 1199px) {
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	font-size: 10px;
	font-family: Pretendard;
	padding-left: 0.5em;
	padding-right: 0.8em;
	padding-top: 0;
	background: white;
	color: #82ae46 !important;
}
}

@media ( max-width : 992px) {
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	padding-left: 2em;
	margin-top: 1em;
	margin-bottom: -1em;
	background: black;
}
}

@media ( max-width : 992px) {
.ftco-navbar-light.scrolled .navbar-nav>.nav-item.cta>a {
	background: white;
}
}

@media ( min-width : 992px) {
#borderNavCart {
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
	margin-left: 3em;
}
}

.ftco-navbar-light .navbar-brand:hover {
	color: #15240e !important;
}

.ftco-navbar-light .navbar-nav>.nav-item.cta>a:hover {
	color: #15240e !important;
}

.navCarousel {
	margin-bottom: 9rem !important;
}

@media ( min-width : 1400px) {
.ftco-navbar-light .navbar-nav>.nav-item .dropdown-menu {
	margin: -4rem 0 0;
	background: #82ae46;
	border-radius: 5px;
	left: -60px;
	padding: 0;
}
}

@media ( max-width : 1399px) {
.ftco-navbar-light .navbar-nav>.nav-item .dropdown-menu {
	margin: -3rem 0 0;
	background: #82ae46;
	border-radius: 5px;
	left: -70px;
	padding: 0;
	width: 60px;
}
}

.ftco-navbar-light .navbar-nav>.nav-item .dropdown-menu .dropdown-item {
	color: white;
}

.ftco-navbar-light .navbar-nav>.nav-item .dropdown-menu .dropdown-item:hover {
	color: #bcd797;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item .dropdown-menu {
	margin: 0rem 0 0;
	background: #82ae46;
	border-radius: 5px;
	left: -60px;
	padding: 0;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item .dropdown-menu .dropdown-item {
	color: white;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item .dropdown-menu .dropdown-item:hover {
	color: #bcd797;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item.cta>a {
	color: #15240e !important;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item.cta>a:hover {
	color: #82ae46 !important;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item>.nav-link {
	color: #15240e !important;
}

.ftco-navbar-light.scrolled .navbar-nav>.nav-item>.nav-link:hover {
	color: #82ae46 !important;
}

.ftco-navbar-light.scrolled .navbar-brand {
	color: #15240e !important;
}

.ftco-navbar-light.scrolled .navbar-brand:hover {
	color: #82ae46 !important;
}

.topper .text {
	width: 100%;
}

</style>

</head>
<body>
	<header>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container" id="headerContainer">
				<a class="navbar-brand" href="<%= request.getContextPath() %>/">ASAC</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/농산물류/1"
							class="nav-link">농산물</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/간편식류/1"
							class="nav-link">간편식</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/콩고기류/1"
							class="nav-link">대체육ㆍ콩</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/양념소스류/1"
							class="nav-link">양념ㆍ소스</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/음료류/1"
							class="nav-link">음료</a></li>
						<li class="nav-item"><a
							href="<%= request.getContextPath() %>/pr/cl/li/생활용품류/1"
							class="nav-link">생활ㆍ뷰티</a></li>

						<%
							if (mid == null) {
						%>
						<li class="nav-item cta cta-colored"><a
							href="<%= request.getContextPath() %>/ca/cl/li" class="nav-link"
							id="borderNavCart"><span class="icon-shopping_cart"></span></a></li>
						<li class="nav-item dropdown cta cta-colored"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;로그인</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="<%= request.getContextPath() %>/me/cl/lo">일반 로그인</a> <a
									class="dropdown-item"
									href="<%= request.getContextPath() %>/me/se/lo">판매자 로그인</a>
							</div></li>
						<li class="nav-item dropdown cta cta-colored"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown05"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;회원가입</a>
							<div class="dropdown-menu" aria-labelledby="dropdown05">
								<a class="dropdown-item"
									href="<%= request.getContextPath() %>/me/cl/jo">일반 가입</a> <a
									class="dropdown-item"
									href="<%= request.getContextPath() %>/me/se/jo">판매자 가입</a>
							</div></li>
						<%
							} else {
						%>
						<li class="nav-item cta cta-colored"><a
							href="<%= request.getContextPath() %>/ca/cl/li" class="nav-link"
							id="borderNavCart"><span class="icon-shopping_cart"></span></a></li>
						<li class="nav-item cta cta-colored"><a
							href="<%= request.getContextPath() %>/me/cl/lO" class="nav-link"
							id="borderNavLogin"><span class="icon-sign-out"></span>&nbsp;로그아웃</a></li>
						<li class="nav-item cta cta-colored"><a
							href="<%= request.getContextPath() %>/me/cl/my" class="nav-link"
							id="borderNavJoin"><span class="icon-info"></span>&nbsp;마이페이지</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	
	<script src="/resources/bootstrap/vegefoods-master/js/jquery.min.js"></script>
	<!-- <script src="/resources/bootstrap/vegefoods-master/js/jquery-migrate-3.0.1.min.js"></script> 얘 때문에 스크롤 안됨-->
	<script src="/resources/bootstrap/vegefoods-master/js/popper.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/bootstrap.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/jquery.easing.1.3.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/jquery.waypoints.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/jquery.stellar.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/owl.carousel.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/bootstrap/vegefoods-master/js/aos.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/jquery.animateNumber.min.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/bootstrap-datepicker.js"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/scrollax.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script	src="/resources/bootstrap/vegefoods-master/js/google-map.js"></script>
	<script src="/resources/bootstrap/vegefoods-master/js/main.js"></script>
</body>