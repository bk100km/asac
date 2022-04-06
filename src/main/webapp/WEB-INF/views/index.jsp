<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String mid = (String)session.getAttribute("mid");
	String sid = (String)session.getAttribute("sid");
	System.out.println("헤더에서 mid 값 = " + mid);
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>ASAC 비건마켓</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"	rel="stylesheet">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/animate.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/owl.carousel.min.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/magnific-popup.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/aos.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/ionicons.min.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/jquery.timepicker.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/flaticon.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/icomoon.css">
<link rel="stylesheet" href="/asac/resources/bootstrap/vegefoods-master/css/style.css">

<!-- Pretendard Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

<style>
h1 {
	font-family: "Amatic SC", Pretendard !important;
	font-size: 5vw !important;
	font-weight: 600 !important;
}

.owl-carousel.home-slider .slider-item .slider-text .subheading {
    font-size: 20px;
}    

.tagButton {
	background-color: #fff;
	border: 1px solid;
	border-radius: 2em;
	color: #aeaeaf;
	display: inline-block;
	font-size: 14px;
	font-weight: 800;
	letter-spacing: .05em;
	line-height: 1;
	margin-right: 20px;
	padding: 10px 26px;
	text-transform: capitalize;
	transition: background-color .15s;
	float: left;
}

.tagZone {
	margin: auto;
}

.owl-carousel.home-slider {
	height: 500px;
}

.owl-carousel .owl-stage-outer {
	height: 500px;
}

#quickOrderMenu {
	font-family: Pretendard;
	font-size: 2.9rem;
    font-weight: bold;
}

.mt-5 {
    margin-top: -1rem !important;
}

.billing-form label {
    font-size: 21px;
}

.cart-total h3 {
    font-size: 20px;
}

.topper .text {
    width: 100%;
}

.mx-1 {
    margin-left: 11.5rem !important;
}
</style>
</head>
<body class="goto-here">
<jsp:include page="common/clientHeader.jsp"></jsp:include>

	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url(/asac/resources/bootstrap/vegefoods-master/images/bg_1.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">지속 가능한 생활습관, Vegan Life</h1>
							<h2 class="subheading mb-4 navCarousel">식생활을 넘어 일상 속 흐름으로</h2>
						</div>

					</div>
				</div>
			</div>

			<div class="slider-item"
				style="background-image: url(/asac/resources/bootstrap/vegefoods-master/images/bg_2.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-sm-12 ftco-animate text-center">
							<h1 class="mb-2">자연과 상생을 추구하는 공간</h1>
							<h2 class="subheading mb-4 navCarousel">나 자신과 미래를 위한 안전한 선택</h2>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Featured Products</span>
					<h2 class="mb-4">베스트 상품</h2>

					<!-- TagZone -->
					<div class="col-md-12 tagZone">
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">콩</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">다이어트</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">비타민</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">채소</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">과일</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">과자</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">빵</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">드링크</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">파스타</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#">잼</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-1.jpg"
							alt="Colorlib Template"> <span class="status">50%</span>
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">아프리카 파프리카</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="mr-2 price-dc">50,000원</span><span
											class="price-sale">25,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-2.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">백두산 딸기</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>30,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-3.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">조선 완두콩</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>23,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-4.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">적적할 땐 적양배추</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>23,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-5.jpg"
							alt="Colorlib Template"> <span class="status">30%</span>
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">생글생글 토마토</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="mr-2 price-dc">13,000원</span><span
											class="price-sale">9,100원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-6.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">싱싱한 브로콜리</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>30,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-7.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">바니바니 당근</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>42,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/asac/resources/bootstrap/vegefoods-master/images/product-8.jpg"
							alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">명장의 과채주스</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>57,000원</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<hr>
	
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
						<form action="#" class="billing-form">
							<h3 class="mb-4 billing-heading" id="quickOrderMenu">빠른 주문</h3>
	          	<div class="row align-items-end">
                <div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
		            		<label for="country">카테고리</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="" id="" class="form-control">
		                  	<option value="">농산물</option>
		                    <option value="">간편식</option>
		                    <option value="">대체육ㆍ콩</option>
		                    <option value="">양념ㆍ소스</option>
		                    <option value="">음료</option>
		                    <option value="">생활ㆍ뷰티</option>
		                  </select>
		                </div>
		            	</div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
		            		<label for="country">상품명</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="" id="" class="form-control">
		                  	<option value="">상품1</option>
		                    <option value="">상품2</option>
		                    <option value="">상품3</option>
		                    <option value="">상품4</option>
		                    <option value="">상품5</option>
		                    <option value="">상품6</option>
		                  </select>
		                </div>
		            	</div>
		            </div>
	            </div>
	          </form><!-- END -->
					</div>
					<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">주문내용</h3>
	          			<p class="d-flex">
		    						<span>단가</span>
		    						<span>3,000원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>수량</span>
		    						<span>5개</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>합계 금액</span>
		    						<span>15,000원</span>
		    					</p>
		    					<p><a href="#"class="btn btn-primary py-3 px-4">주문하기</a></p>
								</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->	

	<section class="ftco-section">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">신속한 배송</h3>
							<span>빠르고 안전하게</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">정직한 상품</h3>
							<span>최적의 신선함을 그대로</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">우수한 품질</h3>
							<span>엄선된 상품만을 제공</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-customer-service"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">친절한 고객지원</h3>
							<span>최고의 상담과 서비스</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="common/footer.jsp"></jsp:include>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="/asac/resources/bootstrap/vegefoods-master/js/jquery.min.js"></script>
	<script src="/asac/resources/bootstrap/vegefoods-master/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/asac/resources/bootstrap/vegefoods-master/js/popper.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/bootstrap.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/jquery.easing.1.3.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/jquery.waypoints.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/jquery.stellar.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/owl.carousel.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/jquery.magnific-popup.min.js"></script>
	<script src="/asac/resources/bootstrap/vegefoods-master/js/aos.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/jquery.animateNumber.min.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/bootstrap-datepicker.js"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/scrollax.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script	src="/asac/resources/bootstrap/vegefoods-master/js/google-map.js"></script>
	<script src="/asac/resources/bootstrap/vegefoods-master/js/main.js"></script>
</body>
</html>
