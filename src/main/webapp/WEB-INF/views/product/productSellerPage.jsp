<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASAC 비건마켓</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Pretend Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

<style>

<style>
.table-responsive {
    overflow-x: hidden;
}

#productUpdateButtonHidden {
	display: none;
}

#productSearchButtonHidden {
	display: none;
}

#productInsertButtonHidden {
	display: none;
}

#productSearchText {
    float: right;
}

#pfileUploadButtonLabel {
	margin-top:14px;
}

#pfileUpload {
	display: none;
}

#leftPanel {
	text-align: center;
	height: 700px;
	margin-top: 20px;
}
	
#leftPanel .table-responsive {
	height: 620px;
}

@media (max-width: 800px) {
#leftPanel .table-responsive {
	height: 765px;
	}
}

#productInfoBtn td {
	line-height: 28px;
}

@media (max-width: 800px) {
#productInfoBtn td {
	line-height: 18px;
	}
}

th {
    text-align: center;
}

/* Overlay */
.image {
	display: block;
	width: 100%;
	height:75%;
}
.overlay {
	position: absolute;
	transition: all .3s ease;
	opacity: 0;
}
.overlayFade {
	height: 100%;
	width:100%;
	top: 0;
	left: 0;
	opacity: 0;
}

.product-panel-default {
	height: 807px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
}

@media (max-width: 800px) {
.product-panel-default {
	height: 980px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
	}
}

.left-product-panel-default {
	height: 760px;
}

@media (max-width: 800px) {
.left-product-panel-default {
	height: 900px;
	}
}

.panel-heading {
	background: #d8e3c9;
	color: #85976d;
    border-top-right-radius: 5px;
    border-top-left-radius: 5px;
    height: 38px;
    font-weight: 600;
    font-size: 1.2rem;
    font-family: Pretendard;
}

#productSearchCategory {
	border: none;
	color: #72815d;
    font-weight: 700;
}

option {
	color: black;
}

.panel-body {
	padding: 15px;
}

#productSearchButton {
	border: none;
	color: #72815d;	
    font-size: 1.1rem;
    font-weight: 600;
}

#panel-heading-right {
	padding: 4px;
}

#pfileUploadButton {
	height: 34px;
}

#pfilePreview {
	font-size: 15px;
	float: right;
	color: #85976d;
    font-weight: 600;
    font-family: 'Pretendard';
}

@media (min-width: 800px) {
 #page-wrapper { 
 	padding-top: 20px; 
 	padding-bottom: 20px; 
 	padding-left: 100px; 
 	padding-right: 100px; 
 	}
 	
}

@media (max-width: 800px) {
.nosee {display: none;}
}

	
</style>
</head>

<body>
<script>

//pfilePreview
$('body').on('click', function() {
	$('#overlayFade').css("opacity", "0");
    $('#productFormTable').css("opacity", "1");
    $('#productFormTable').css("transition", "all .5s ease");
});

function pfilePreview() {
	$('#overlayFade').css("opacity", "0.95");
    $('#productFormTable').css("opacity", "0.05");
    $('#productFormTable').css("transition", "all .5s ease");
}

<!-- 상세정보 조회 AJAX -->
function productInfoAction(clickedproduct) {
	var pcode = clickedproduct.getAttribute("data-pcode");
	var pfileZoneText = "";
	
    $.ajax({
        type: 'POST',
        url: './if',
        data: {pcode:pcode},
        success: function(product) {
        	
        	 pfileZoneText +=  
 				'<div class="row">' +
 				'<div class="col-md-9 mb-1 input-group-sm">' +
 					'<label for="pfile">상품사진 <span class="text-danger">*</span></label> <input type="text"' +
 						'class="form-control" name="pfile" id="pfile" placeholder="상품사진" value="' + pfile + '"' +
 						'maxlength="10" required readonly>' +
 				'</div>' +
 				'<div class="col-md-3 mb-1">' +
 					'<input type="file" accept="image/jpeg"' +
 						'class="form-control" name="pfileUpload" id="pfileUpload" value="사진등록" onchange="pfileUploadAction()">' +
 					'<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>' +
 					'<input type="button" class="form-control" name="pfileUploadButton" id="pfileUploadButton" value="사진등록" onclick="document.getElementById(`pfileUpload`).click()">' +							
 				'</div>' +
 				'</div>' + 
 				'<a href="javascript:pfilePreview()" id="pfilePreview"> 미리보기&nbsp; </a>';
             document.getElementById("pfileZone").innerHTML = pfileZoneText;     
        	
             $(product).each(function(index, item) {
                 $('#pcode').prop('value',product.pcode);
                 $('#pcode').prop('readonly',true);
                 $('#pname').prop('value',product.pname);
                 $('#pname').prop('readonly',false);
                 $('#pprice').prop('value',product.pprice);
                 $('#pprice').prop('readonly',false);
                 $('#pcate').prop('value', product.pcate);
                 $('#pcate').prop('disabled',true);
                 $('#ptag').prop('value',product.ptag);
                 $('#ptag').prop('readonly',false);
                 $('#pfile').prop('value',product.pfile);
                 $('#pfileUploadButton').prop('disabled',false);
                 $('#pcontent').prop('value',product.pcontent);
                 $('#pcontent').prop('readonly',false);
                 $('#pregdate').prop('value',product.pregdate);
                 $('#sid').prop('value',product.sid);
                 $('#sid').prop('readonly',true);
                 $('#productUpdateButton').attr('onclick',"productUpdateOk()");
                 $('#productDeleteButton').attr('onclick',"productDeleteOk()");
                 $('#productRActionButton').attr('onclick',"productRActionOk()");
             });
            	 
         },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}


function productSearchAction(clickedPage) {	
	var productSearchCategory = $('#productSearchCategory option:selected').val();
    var productSearchText = document.getElementById('productSearchText').value;
	var productListText = "";
	var productPagingText ="";
	var page = clickedPage;
	var step = 0;
    
    $.ajax({
        type: 'POST',
        url: './sl',
   		data: {productSearchCategory:productSearchCategory,
   			productSearchText:productSearchText,
    		page:page},
        success: function(map) {
        	 $.each(map.productList , function(i){
        		 productListText += '<tr id="productInfoBtn" onclick="productInfoAction(this)" data-pcode="' + map.productList[i].pcode + 
					'"><td>' + map.productList[i].pname + 
					'</td><td>' + map.productList[i].pcate + 
					'</td><td>' + map.productList[i].ptag +
					'</td><td>' + map.productList[i].sid +
					'</td></tr>';
			});

			if (map.paging.prev) {
				productPagingText +=
				'<li class="page-item"><a class="page-link" href="#" onclick="productSearchAction(1)">이전</a></li>'; 
			}
			for (step = map.paging.startPage; step < map.paging.endPage + 1; step++) {
				productPagingText +=
				'<li class="page-item" id="page' + step + '" value="' + step + '"><a class="page-link" href="#" onclick="productSearchAction(' + step + ')">' + step + '</a></li>';
			}
			if (map.paging.next) {
				productPagingText +=
				'<li class="page-item"><a class="page-link" href="#" onclick="productSearchAction(' + map.paging.endPage + ')">다음</a></li>';
			}
			document.getElementById("productListBody").innerHTML = productListText;
			document.getElementById("productPagingZone").innerHTML = productPagingText;
			[].forEach.call(document.getElementById("page" + page), function(element) {
			element.classList.remove("active");
			element.classList.remove("productActivePage");
			});
			document.getElementById("page" + page).classList.add("active");
			document.getElementById("page" + page).classList.add("productActivePage");
		},
		error: function(request, status, error) {
		console.log("code:" + request.status + 
				"\n"+"message:" + request.responseText + 
				"\n"+"error:"+error);
		}
	});    
}


function productInsertForm() {
	var productInsertFormText = '';
	var productInsertFormIdZoneText = '';
	var today = new Date();
	var sid = '<%=(String)session.getAttribute("sid")%>';
	var pcate = $('#pcate option:selected').val();
		
    $.ajax({
        success: function() {
        	$('#productInfoDetail').prop('action',"productInsertAction()");
        	$('#pcode').prop('readonly',false);
            $('#pname').prop('value',"");
            $('#pname').prop('readonly',false);
            $('#pprice').prop('value',"");
            $('#pprice').prop('readonly',false);
            $('#pcate').prop('value',pcate);
            $('#pcate').prop('disabled',false);
            $("#pcate").change(function() {
            $("#pcate option:selected").each(function() {
            $("#pcate").val($(this).val());

            if ($(this).val() == "농산물류") {
                $('#pcode').prop('value', 'N');
            } else if ($(this).val() == "간편식류") {
            	$('#pcode').prop('value', 'G');
            } else if ($(this).val() == "콩고기류") {
        		$('#pcode').prop('value', 'K');
            } else if ($(this).val() == "양념소스류") {
            	$('#pcode').prop('value', 'Y');
            } else if ($(this).val() == "음료류") {
            	$('#pcode').prop('value', 'U');
            } else if ($(this).val() == "생활용품류") {
            	$('#pcode').prop('value', 'S');
            }
            });
            }); 
            
            $('#ptag').prop('value',"");
            $('#ptag').prop('readonly',false);
            $('#pfile').prop('value',"");
            $('#pfile').prop('readonly',true);
            $('#pfileUploadButton').prop('disabled',false);
            $('#pcontent').prop('value',"");
            $('#pcontent').prop('readonly',false);
            $('#pregdate').prop('value', today.toLocaleDateString());
            $('#sid').prop('value',sid);
            $('#sid').prop('readonly',true);
        	 
        	productInsertFormText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productInsertButton" value="추가하기" onclick="productInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productInsertBackButton" value="뒤로가기" onclick="productInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br><br><br><br><br>';
			document.getElementById("productButtonZone").innerHTML = productInsertFormText;
			
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function productInsertCancel() {
	var productInsertCancelText = '';
	var productInsertFormIdZoneText = '';
    $.ajax({
        success: function() {
        	
        	$('#productInfoDetail').prop('action',"./up");
        	$('#pcode').prop('value',"");
            $('#pcode').prop('readonly',true);
            $('#pname').prop('value',"");
            $('#pname').prop('readonly',true);
            $('#pprice').prop('value',"");
            $('#pprice').prop('readonly',true);
            $('#pcate').prop('value',"");
            $('#pcate').prop('disabled',true);
            $('#ptag').prop('value',"");
            $('#ptag').prop('readonly',true);
            $('#pfile').prop('value',"");
            $('#pfile').prop('readonly',true);
            $('#pfileUploadButton').prop('disabled',true);
            $('#pcontent').prop('value',"");
            $('#pcontent').prop('readonly',true);
            $('#pregdate').prop('value', "");
            $('#pregdate').prop('readonly',true);
            $('#sid').prop('value',"");
            $('#sid').prop('readonly',true);
        	 
        	productInsertCancelText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productInsertButton" value="상품추가"' + 
			'onclick="productInsertForm()" title="상품추가 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productRActionButton" value="리뷰보기"' + 
			'title="리뷰보기 버튼">' +
			'</div>';

			 document.getElementById("productButtonZone").innerHTML = productInsertCancelText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}


function productInsertAction() {	
	var pname = document.getElementById('pname').value;
	var product = $("form[name=productInfoDetail]").serialize();
	
    $.ajax({
        type: 'POST',
        url: './in',
   		data: product,
        success: function() {
          	productSearchAction(document.getElementsByClassName("productActivePage")[0].value);
        	alert("추가한 상품 = " + pname + "\n추가가 완료되었습니다.");
        	productInsertCancel();
        },
        error: function(request, status, error) {
        	alert("상품 추가 실패.\n다시 시도해주세요.")
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}


function productUpdateAction() {	
	var pcode = document.getElementById('pcode').value;
	var product = $("form[name=productInfoDetail]").serialize();
	
    $.ajax({
        type: 'POST',
        url: './up',
   		data: product,
        success: function() {
        	
        	productSearchAction(document.getElementsByClassName("productActivePage")[0].value);
        	alert("수정이 완료되었습니다.");
        	$('#pcate').prop('disabled',true);			
        },
        error: function(request, status, error) {
        	alert("상품 수정 실패.\n다시 시도해주세요.")
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
    
}

function productDeleteAction() {	
	var pcode = document.getElementById('pcode').value;
    
    $.ajax({
        type: 'POST',
        url: './de/pcode/' + pcode,
   		data: {pcode:pcode},
        success: function() {
        	productSearchAction(document.getElementsByClassName("productActivePage")[0].value);
        	alert("삭제가 완료되었습니다.");
				
        },
        error: function(request, status, error) {
        	alert("상품 삭제 실패.\n다시 시도해주세요.")
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function pfileUploadAction() {
	var pfileUpload = new FormData($("#productInfoDetail")[0]);
    var pfileZoneText = "";
	
    $.ajax({
        url: "./fu",
        type: "POST",
        data: pfileUpload,
        async: false, 
        cache: false, 
        processData: false,
        contentType: false,
        success: function(pfile){
            pfileZoneText +=  
			'<div class="row">' +
			'<div class="col-md-9 input-group-sm">' +
				'<label for="pfile">상품사진 <span class="text-danger">*</span></label> <input type="text"' +
					'class="form-control" name="pfile" id="pfile" placeholder=".png, .jpg" value="' + pfile + '"' +
					'maxlength="11" required readonly>' +
			'</div>' +
			'<div class="col-md-3">' +
				'<input type="file" accept="image/*"' +
					'class="form-control" name="pfileUpload" id="pfileUpload" value="사진등록" onchange="pfileUploadAction()">' +
				'<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>' +
				'<input type="button" class="form-control" name="pfileUploadButton" id="pfileUploadButton" value="사진등록" onclick="document.getElementById(`pfileUpload`).click()">' +							
			'</div>' +
			'</div>' + 
			'<a href="javascript:pfilePreview()" id="pfilePreview"> 미리보기</a>';
            document.getElementById("pfileZone").innerHTML = pfileZoneText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function productRAction() {	
	var pcode = document.getElementById('pcode').value;
	
	location.href="/pr/cl/dt/" + pcode;
    
}

</script>
<!-- Page Wrapper -->
<div id="wrapper">
<header>
<jsp:include page="/WEB-INF/views/common/sellerHeader.jsp"></jsp:include>
</header>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
<!-- Main Content -->
<div id="content">
<!-- Topbar -->
<jsp:include page="/WEB-INF/views/common/toolbarHeader.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-6">
					<!--좌우분할 6:6-->
					<!--상품 관리//-->
					<div class="panel product-panel-default left-product-panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<select id="productSearchCategory" name="productSearchCategory" class="btn btn-default btn-md">
											<option value="pname">상품명</option>
											<option value="pcate">카테고리</option>
											<option value="ptag">태그명</option>											
											<option value="sid">판매자아이디</option>
										</select>
										<input class="form-control input-sm" id="productSearchText" type="text"
											placeholder="검색어 입력"> <span class="input-group-btn">
											<input type="button" class="btn btn-default btn-md" id="productSearchButton" value="검색" onclick="productSearchAction(1)">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body" id="leftPanel">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>상품명</th>								
											<th class="nosee">카테고리</th>
											<th class="nosee">태그명</th>								
											<th>판매자아이디</th>
										</tr>
									</thead>
									<tbody id="productListBody">
									<c:forEach var="product" items="${productSellerList}">
										<tr id="productInfoBtn" data-pcode="${product.pcode}" onclick="productInfoAction(this)">
											<td>${product.pname}</td>
											<td class="nosee">${product.pcate}</td>
											<td class="nosee">${product.ptag}</td>											
											<td>${product.sid}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<ul class="pagination justify-content-center" id="productPagingZone">
								<c:if test= "${productPaging.prev}">
									<li class="page-item"><a class="page-link" href="#" onclick="productSearchAction(1)">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${productPaging.startPage}" end="${productPaging.endPage}">
									<c:if test="${productPaging.page eq page}">
									<li class="page-item active productActivePage" id="productPage${page}" value="${page}"><a class="page-link" href="#" onclick="productSearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${productPaging.page ne page}">
									<li class="page-item" id="productPage${page}" value="${page}"><a class="page-link" href="#" onclick="productSearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${productPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="productSearchAction(${productPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//일반상품관리 -->
				</div>
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel product-panel-default">
						<div class="panel-heading" id="panel-heading-right">상품 상세 정보</div>
						<div class="panel-body">
						<c:forEach var="product" items="${productSellerList}">
						<div class="overlay overlayFade" id="overlayFade">
							<img src="/resources/productUpload/${product.pfile}" alt="img" class="image">
						</div>
						</c:forEach>
							<div class="table-responsive" id="productFormTable">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="productInfoDetail" id= "productInfoDetail" name="productInfoDetail" method="post">
				
					<div class="mb-1 input-group-sm">
						<label for="pcate">카테고리 <span class="text-danger">*</span></label>
						<select	class="form-control" name="pcate" id="pcate" disabled>
							<option value="" selected>카테고리 선택</option>
							<option value="농산물류">농산물류</option>
							<option value="간편식류">간편식류</option>
							<option value="콩고기류">콩고기류</option>
							<option value="음료류">음료류</option>
							<option value="양념소스류">양념소스류</option>
							<option value="생활용품류">생활용품류</option>
						</select>
					</div>
				
					<div class="mb-1 input-group-sm">
					<label for="pcode">상품코드 <span class="text-danger">*</span><span style="font-size:10pt"> &nbsp; ex) N001, G001, K001···</span></label> 
						<input type="text"
							class="form-control" name="pcode" id="pcode" value="${product.pcode}"
							placeholder="상품코드" pattern="^[A-Z0-9_]{3,20}$" 
							maxlength="20" required readonly>					
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pname">상품명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pname" id="pname" value="${product.pname}"
							placeholder="상품명" pattern="^[가-힣]+$" 
							maxlength="35" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pprice">가격 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pprice" id="pprice" value="${product.pprice}"
							placeholder="가격" pattern="^[0-9]+$" 
							maxlength="6" required readonly>
					</div>	

					<div class="mb-1 input-group-sm">
						<label for="ptag">태그명 <span class="text-danger">*</span><span style="font-size:10pt"> &nbsp; ex) 콩, 다이어트, 과일, 채소, 빵···</span></label> <input type="text"
							class="form-control"  name="ptag" id="ptag" value="${product.ptag}"
							placeholder="태그명" pattern="^[가-힣]+$" 
							maxlength="13" required readonly>
					</div>
					<div class="mb-1 input-group-sm" id="pfileZone">
					<div class="row">
					<div class="col-md-9 input-group-sm">
						<label for="pfile">상품사진 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name="pfile" id="pfile" placeholder="상품사진" value="${product.pfile}"
							maxlength="10" required readonly>
					</div>
					<div class="col-md-3">
						<input type="file" accept="image/jpeg"
							class="form-control" name="pfileUpload" id="pfileUpload" value="사진등록" onchange="pfileUploadAction()">
						<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>
						<input type="button" class="form-control" name="pfileUploadButton" id="pfileUploadButton" value="사진등록" onclick="document.getElementById('pfileUpload').click()" disabled>							
					</div>
					</div>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pcontent">상품설명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pcontent" id="pcontent" value="${product.pcontent}"
							placeholder="상품설명" 
							maxlength="60" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pregdate">등록일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pregdate" id="pregdate" value="${product.pregdate}"
							placeholder="등록일" 
							maxlength="20" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pcontent">판매자아이디 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="sid" id="sid" value="${product.sid}"
							placeholder="판매자아이디" 
							maxlength="20" required readonly>
					</div>
					
					
					<hr class="mb-4">
				
					<div class="row" id="productButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productUpdateButton" value="수정하기" title="수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productInsertButton" value="상품추가" 
						onclick="productInsertForm()" title="상품추가 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productRActionButton" value="리뷰보기" title="리뷰보기 버튼">
						</div>					
					</div>	
				</form>
			</div>
		</div>
	</div>	
	</div>
	</div>					
		<!--//상세정보패널-->
				</div>
			</div>
		</div>


	<script>

	function productUpdateOk() {
		var pcode = document.getElementById('pcode').value;
		var pname = document.getElementById('pname').value;
		var pcate = document.getElementById('pcate').value;
		var ptag = document.getElementById('ptag').value;
		var pfile = document.getElementById('pfile').value;
		var pprice = document.getElementById('pprice').value;
		var pcontent = document.getElementById('pcontent').value;
		
		if(!confirm('정말 수정하시겠습니까?')){
			return false;
		} else {
			if(pcate == '' || pcate == '카테고리 선택') {
				alert('카테고리를 선택해주세요.')
				return false;
			} else if(pcode == '') {
				alert('상품코드를 입력해주세요.')
				return false;
			} else if(pname == '') {
				alert('상품명을 입력해주세요.')
				return false;
			} else if(pprice == '') {
				alert('가격을 입력해주세요.')
				return false;
			} else if(ptag == '') {
				alert('태그명을 입력해주세요.')
				return false;
			} else if(pfile == '') {
				alert('사진을 추가해주세요.')
				return false;	
			} else if(pcontent == '') {
				alert('상품설명을 입력해주세요.')
				return false;
			} else {
				$("select[name=pcate]").removeAttr('disabled');
				productUpdateAction();
			}
		}
	}

	function productDeleteOk(){
		if(!confirm('정말 삭제하시겠습니까?')){
			return false;
		} else {
			productDeleteAction();
		}
	}
	
	function productInsertOk() {
		var pcode = document.getElementById('pcode').value;
		var pname = document.getElementById('pname').value;
		var pcate = document.getElementById('pcate').value;
		var ptag = document.getElementById('ptag').value;
		var pfile = document.getElementById('pfile').value;
		var pprice = document.getElementById('pprice').value;
		var pcontent = document.getElementById('pcontent').value;
		var sid = document.getElementById('sid').value;
		
		if(!confirm('상품을 추가하시겠습니까?')) {
			return false;
		} else {
			if(pcate == '' || pcate == '카테고리 선택') {
				alert('카테고리를 선택해주세요.')
				return false;
			} else if(pcode == '') {
				alert('상품코드를 입력해주세요.')
				return false;
			} else if(pname == '') {
				alert('상품명을 입력해주세요.')
				return false;
			} else if(pprice == '') {
				alert('가격을 입력해주세요.')
				return false;
			} else if(ptag == '') {
				alert('태그명을 입력해주세요.')
				return false;
			} else if(pfile == '') {
				alert('사진을 추가해주세요.')
				return false;	
			} else if(pcontent == '') {
				alert('상품설명을 입력해주세요.')
				return false;
			} else if(sid == '') {
				alert('판매자아이디를 입력해주세요.')
				return false;
			} else {
				productInsertAction();
			}
		}
	}
	
	function productRActionOk() {
		if(!confirm('리뷰페이지로 이동하시겠습니까?')){
			return false;
		} else {
			productRAction();
		}
	}
    
	</script>
	
	</div>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>
</div>
</body>
</html>