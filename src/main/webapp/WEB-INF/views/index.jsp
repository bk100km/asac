<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String mid = (String)session.getAttribute("mid");
	String sid = (String)session.getAttribute("sid");
	request.setAttribute("mid", mid);
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
h1 {
	font-family: "Amatic SC", Pretendard !important;
	font-size: 4.8vw !important;
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
	margin-top: 10px;
	margin-right: 20px;
	padding: 10px 35px;
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

@media ( max-width : 991px) {
.owl-carousel.home-slider {
	height: 400px !important;
}
}

.owl-carousel .owl-stage-outer {
	height: 500px;
}

@media ( max-width : 991px) {
.owl-carousel .owl-stage-outer {
	height: 400px;
}
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
    font-size: 21px !important;
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

#rcountbox {
	display: inline;	
}

.pbutton {
	font-size: 10px;
	color: #FFFFFF;
	display: inline-block;
}

#result {
	font-size: 20px;
	color: #2B2B2B;
	display: inline;
	margin: 0 10px;
	vertical-align: baseline;
}

.mbutton {
	font-size: 10px;
	color: #FFFFFF;
	display: inline-block;
}

.ftco-animate {
    opacity: 1;
    visibility: unset;
}

#productCount{
	text-align: center;
}

.billing-form .form-control {
    font-size: 18px !important;
    height: 71px !important;
}

.cart-detail.cart-total {
    font-size: 18px;
}

.product:hover .pricing {
    opacity: 1 !important; 
}

</style>

<script type="text/javascript">
function pcateChange(value) {
	var pcate = value;
	
	$('#selectPnameInfo option').each(function() {
		var pname = $(this).attr('class');
		if (pcate == pname) {
			$(this).removeAttr('hidden');
			$('#selectPnameInfo option.gibon').prop("selected", true);
			$('#selectPnameInfo').val("");
			$('#selectPnameInfo option.gibon').attr('hidden', 'hidden');
			pageInit();
		}
		if (pcate != pname) {
			$(this).attr('hidden', 'hidden');
			$('#selectPnameInfo option.gibon').attr('hidden', 'hidden');
		}
		if (pcate == "") {
			$('#selectPnameInfo option.gibon').prop("selected", true);
			$('#selectPnameInfo option.gibon').removeAttr('hidden');
			$('#selectPnameInfo').val("");
			pageInit();
		}
	});
}

function pnameChange(value) {
	var pname = value;
	var pcode = $('#selectPnameInfo option:selected').attr('value1');
	var pcate = $('#selectPnameInfo option:selected').attr('value2');
	var pprice = $('#selectPnameInfo option:selected').attr('value3');
	
	if (pname != "") {
		document.getElementById("productPrice").innerHTML = pprice + "&nbsp;원";
		document.getElementById("productCount").innerHTML = "1";
		document.getElementById("productTotal").innerHTML = pprice + "&nbsp;원";
		$('#proPrice').val(pprice);
		$('#proCount').val("1");
		$('#proTotal').val(pprice);
		$('#pcode').val(pcode);
	} else {
	}
}

function pageInit() {
	document.getElementById("productPrice").innerHTML = "상품을 선택하세요.";
	document.getElementById("productCount").innerHTML = "1";
	document.getElementById("productTotal").innerHTML = "상품을 선택하세요.";
	$('#proPrice').val("");
	$('#proCount').val("1");
	$('#proTotal').val("");
	$('#pcode').val("");
}

function count(type) {

	const countElement = document.getElementById('productCount');
	const priceElement = document.getElementById('productPrice');
	const totalPriceElement = document.getElementById('productTotal');

	let count = countElement.innerText.replace(/,/g, '');
	let price = priceElement.innerText.replace(/,/g, '');
	let totalPrice = totalPriceElement.innerText.replace(/,/g, '');

	if (type === 'plus') {
		if (count < 5){
			count = parseInt(count) + 1;
			
			if (parseInt(totalPrice) < (parseInt(price) * 5)){
			totalPrice = parseInt(totalPrice) + parseInt(price);
			
			document.getElementById("productCount").innerHTML = count;
			document.getElementById("productTotal").innerHTML = totalPrice + "&nbsp;원";

			$('#proCount').val(count);
			$('#proTotal').val(totalPrice);
			}
		}
	}
	if (type === 'minus') {
		if (count > 1){
			count = parseInt(count) - 1;
			
			if (parseInt(totalPrice) > parseInt(price)){
			totalPrice = parseInt(totalPrice) - parseInt(price);
			
			document.getElementById("productCount").innerHTML = count;
			document.getElementById("productTotal").innerHTML = totalPrice + "&nbsp;원";

			$('#proCount').val(count);
			$('#proTotal').val(totalPrice);
			}
		}
	}
}

//TagList
function productIndexTag(clickedPtag) {	
	var ptag = clickedPtag.getAttribute("data-ptag");
	var productIndexTagText = "";
    
    $.ajax({
        type: 'POST',
        url: '/pr/cl/in',
   		data: {ptag:ptag},
        success: function(map) {
        	$.each(map.productList , function(i){
                productIndexTagText += 
				'<div class="col-md-6 col-lg-3 ftco">' + 
					'<div class="product">' + 
						'<a href="#" class="img-prod"><img class="img-fluid"' + 
							'src="/resources/productUpload/' + map.productList[i].pfile + '"' + 
							'alt="Colorlib Template"> </a>' + 
						'<div class="text py-3 pb-4 px-3 text-center">' + 
							'<h3>' + 
								'<a href="#">' + map.productList[i].pname + '</a>' + 
							'</h3>' + 
							'<div class="d-flex">' + 
								'<div class="pricing">' + 
									'<p class="price">' + 
										'<span class="price-sale">' + map.productList[i].pprice + '원</span>' +  
									'</p>' + 
								'</div>' + 
							'</div>' + 
						'</div>' + 
					'</div>' + 
				'</div>';
           });
        	document.getElementById("indexPtagListZone").innerHTML = productIndexTagText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}
</script>

</head>
<body class="goto-here" id="page-top">
<jsp:include page="common/clientHeader.jsp"></jsp:include>

	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url(/resources/bootstrap/vegefoods-master/images/bg_1.jpg);">
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
				style="background-image: url(/resources/bootstrap/vegefoods-master/images/bg_2.jpg);">
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

	<section class="ftco-section" name="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Featured Products</span>
					<h2 class="mb-4">베스트 상품</h2>

					<!-- TagZone -->
					<div class="col-md-12 tagZone" id="tagZone" name="tagZone">
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="콩">콩</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="다이어트">다이어트</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="채소">채소</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="과일">과일</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="과자">과자</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="빵">빵</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="드링크">드링크</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="파스타">파스타</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="잼">잼</a>
							</div>
						</div>
						<div class="tagButtonDivDiv">
							<div class="tagButtonDiv">
								<a class="tagButton" href="#ftco-section" onclick="productIndexTag(this)" data-ptag="일상">일상</a>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" id="indexPtagListZone">
				<c:forEach var="product" items="${productList}">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="/pr/cl/dt/${product.pcode}" class="img-prod"><img class="img-fluid"
							src="/resources/productUpload/${product.pfile}"
							alt="Colorlib Template"> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">${product.pname}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale">${product.pprice}원</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate billing-form">
				<h3 class="mb-4 billing-heading" id="quickOrderMenu">빠른 주문</h3>
	          	<div class="row align-items-end">
                <div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
		            		<label for="country">카테고리</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="pcate" id="selectCateInfo" class="form-control custom-select" required="required" onchange="pcateChange(this.value);">
		                  	<option value="" selected>상품 카테고리 선택</option>
		                  	<option value="농산물류">농산물</option>
		                    <option value="간편식류">간편식</option>
		                    <option value="콩고기류">대체육ㆍ콩</option>
		                    <option value="양념소스류">양념ㆍ소스</option>
		                    <option value="음료류">음료</option>
		                    <option value="생활용품류">생활ㆍ뷰티</option>
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
		                  <select name="pname" id="selectPnameInfo" class="form-control custom-select" required="required" onchange="pnameChange(this.value);">
		                  	<option value="" class="gibon" selected>상품 선택</option>
		                  	<c:forEach var="product" items="${orderProductList}">
								<option value="${product.pname}" value1="${product.pcode}" value2="${product.pcate}" value3="${product.pprice}" class="${product.pcate}" hidden>${product.pname}</option>
		                    </c:forEach>
		                  </select>
		                </div>
		            	</div>
		            </div>
	            </div>
			</div>
			<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<form name="orderFast" method="post" class="billing-form">
	          			<div id="rcountbox">
	          				<p class="d-flex">
		    						<span><strong>단가</strong></span>
		    						<span id="productPrice">상품을 선택하세요.</span>
		    						<input type="hidden" name="proPrice" id="proPrice">
		    					</p>
		    					<p class="d-flex">
		    						<span><strong>수량</strong></span>
		    						<span style="display:flex; width:inherit;">
		    							<button id="omb" class="btn mbutton" type="button" onclick='count("minus")'>-</button>
											<span id="productCount"></span>
										<button id="opb" class="btn pbutton" type="button" onclick='count("plus")'>+</button>
										<input type="hidden" name="pcount" id="proCount">
									</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span><strong>합계 금액</strong></span>
		    						<span id="productTotal">상품을 선택하세요.</span>
									<input type="hidden" name="proTotal" id="proTotal">
									<input type="hidden" name="pcode" id="pcode">
									<input type="hidden" name="mid" id="mid" value="${mid}">
		    					</p>
		    					<p><button type="submit" class="btn btn-primary py-3 px-4" onclick="javascript: orderFast.action='/ca/cl/fl'">주문하기</button></p>
							</div>
						</form>
					</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div><!-- END -->
    </section> <!-- .section -->	

	<section class="ftco-section">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-6 col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
					class="col-6 col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
					class="col-6 col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
					class="col-6 col-md-3 text-center d-flex align-self-stretch ftco-animate">
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
	
	
	<br><br><br>
	<jsp:include page="common/footer.jsp"></jsp:include>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<!-- Scroll to Top Button-->
    <a class="mouse-icon" href="#page-top">
    <div class="mouse-wheel">
        <span class="ion-ios-arrow-up"></span>
    </div>
    </a>

	<script src="/resources/bootstrap/vegefoods-master/js/jquery.min.js"></script>
	<script src="/resources/bootstrap/vegefoods-master/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/bootstrap/vegefoods-master/js/popper.min.js"></script>
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
</html>
