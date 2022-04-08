<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASAC 비건마켓</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.table-responsive {
    overflow-x: hidden;
}

#productMyUpdateButtonHidden {
	display: none;
}

#productMySearchButtonHidden {
	display: none;
}

#productMyInsertButtonHidden {
	display: none;
}

#productMySearchText {
    float: right;
}

#productMyIdCheckLabel {
	margin-top:14px;
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

#productMyInfoBtn td {
	line-height: 21px;
}

th {
    text-align: center;
}

/* Overlay */
.image {
	display: block;
	width: auto;
	height:100%;
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

.productMy-panel-default {
	height: 950px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
}

.left-productMy-panel-default {
	height: 760px;
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

#productMySearchCategory {
	border: none;
	color: #72815d;
    font-weight: 700;
}
}

option {
	color: black;
}

.panel-body {
	padding: 15px;
}

#productMySearchButton {
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

</style>
</head>
<body>

<script>

//pfilePreview
$('body').on('click', function() {
	$('#overlayFade').css("opacity", "0");
    $('#productMyFormTable').css("opacity", "1");
    $('#productMyFormTable').css("transition", "all .5s ease");
});

function pfilePreview() {
	$('#overlayFade').css("opacity", "0.95");
    $('#productMyFormTable').css("opacity", "0.05");
    $('#productMyFormTable').css("transition", "all .5s ease");
}

<!-- 상세정보 조회 AJAX -->
function productMyInfoAction(clickedproductMy) {
	var pcode = clickedproductMy.getAttribute("data-pcode");
	var pfileZoneText = "";
	
    $.ajax({
        type: 'POST',
        url: './aif',
        data: {pcode:pcode},
        success: function(productMy) {
        	
            pfileZoneText +=  
				'<div class="row">' +
				'<div class="col-md-9 mb-1 input-group-sm">' +
					'<label for="pfile">증명서류 <span class="text-danger">*</span></label> <input type="text"' +
						'class="form-control" name="pfile" id="pfile" placeholder="상품사진" value="' + pfile + '"' +
						'maxlength="10" required readonly>' +
				'</div>' +
				'<div class="col-md-3 mb-1">' +
					'<input type="file" accept="image/*"' +
						'class="form-control" name="pfileUpload" id="pfileUpload" value="사진등록" onchange="pfileUploadAction()">' +
					'<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>' +
					'<input type="button" class="form-control" name="pfileUploadButton" id="pfileUploadButton" value="사진등록" onclick="document.getElementById(`pfileUpload`).click()">' +							
				'</div>' +
				'</div>' + 
				'<a href="javascript:pfilePreview()" id="pfilePreview"> 미리보기&nbsp; </a>';
            document.getElementById("pfileZone").innerHTML = pfileZoneText;

            $(productMy).each(function(index, item) {
                $('#pcode').prop('value',productMy.pcode);
                $('#pname').prop('value',productMy.pname);
                $('#pname').prop('readonly',false);
                $('#pprice').prop('value',productMy.pprice);
                $('#pprice').prop('readonly',false);
                $('#pcate').prop('value',productMy.pcate);
                $('#pcate').prop('readonly',false);
                $('#ptag').prop('value',productMy.ptag);
                $('#ptag').prop('readonly',false);
                $('#pfile').prop('value',productMy.pfile);
                $('#pfileUploadButton').prop('disabled',false);
                $('#pcontent').prop('value',productMy.pcontent);
                $('#pcontent').prop('readonly',false);
                $('#pregdate').prop('value',productMy.pregdate);
                $('#sid').prop('value',productMy.sid);
                $('#productMyUpdateButton').attr('onclick',"productMyUpdateOk()");
                $('#productMyDeleteButton').attr('onclick',"productMyDeleteOk()");
            });
					
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function productMySearchAction(clickedPage) {	
	var productMySearchCategory = $('#productMySearchCategory option:selected').val();
    var productMySearchText = document.getElementById('productMySearchText').value;
	var productMyListText = "";
	var productMyPagingText = "";
	var page = clickedPage;
	var step = 0;
    $.ajax({
        type: 'POST',
        url: './ase',
   		data: {productMySearchCategory:productMySearchCategory,
   			productMySearchText:productMySearchText,
    		page:page},
    		success: function(map) {
           	 $.each(map.productMyList , function(i){
           		productMyListText += '<tr id="productMyInfoBtn" onclick="productMyInfoAction(this)" data-pcode="' + map.productMyList[i].pcode + 
                     					'"><td>' + map.productMyList[i].pname + 
                     					'</td><td>' + map.productMyList[i].pcate + 
                     					'</td><td>' + map.productMyList[i].ptag +
                     					'</td><td>' + map.productMyList[i].sid +
                     					'</td></tr>';
                });
        	 
   		     if (map.paging.prev) {
	    		 productMyPagingText +=
			 	'<li class="page-item"><a class="page-link" href="#" onclick="productMySearchAction(1)">이전</a></li>'; 
    		 }
    		 for (step = map.paging.startPage; step < map.paging.endPage + 1; step++) {
    			 productMyPagingText +=
    		 	'<li class="page-item" id="page' + step + '" value="' + step + '"><a class="page-link" href="#" onclick="productMySearchAction(' + step + ')">' + step + '</a></li>';
    	     }
    		 if (map.paging.next) {
    		 	productMyPagingText +=
    		 	'<li class="page-item"><a class="page-link" href="#" onclick="productMySearchAction(' + map.paging.endPage + ')">다음</a></li>';
        	 }
        	document.getElementById("productMyListBody").innerHTML = productMyListText;
        	document.getElementById("productMyPagingZone").innerHTML = productMyPagingText;
        	[].forEach.call(document.getElementById("page" + page), function(element) {
        	    element.classList.remove("active");
        	    element.classList.remove("productMyActivePage");
        	});
        	document.getElementById("page" + page).classList.add("active");
        	document.getElementById("page" + page).classList.add("productMyActivePage");
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function productMyInsertForm() {
	var productMyInsertFormText = '';
	var productMyInsertFormIdZoneText = '';
	var today = new Date();
    $.ajax({
        success: function() {
        	
        	$('#productMyInfoDetail').prop('action',"productMyInsertAction()");
        	$('#pcode').prop('value',"");
            $('#pcode').prop('readonly',false);
            $('#pname').prop('value',"");
            $('#pname').prop('readonly',false);
            $('#pprice').prop('value',"");
            $('#pprice').prop('readonly',false);
            $('#pcate').prop('value',"");
            $('#pcate').prop('readonly',false);
            $('#ptag').prop('value',"");
            $('#ptag').prop('readonly',false);
            $('#pfile').prop('value',"");
            $('#pfile').prop('readonly',false);
            $('#pfileUploadButton').prop('disabled',false);
            $('#pcontent').prop('value',"");
            $('#pcontent').prop('readonly',false);
            $('#pregdate').prop('value', today.toLocaleDateString());
            $('#sid').prop('value',"");
            $('#sid').prop('readonly',false);
        	 
        	productMyInsertFormText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productMyInsertButton" value="추가하기" onclick="productMyInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productMyInsertBackButton" value="뒤로가기" onclick="productMyInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			document.getElementById("productMyButtonZone").innerHTML = productMyInsertFormText;
			
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function productMyInsertCancel() {
	var productMyInsertCancelText = '';
	var productMyInsertFormIdZoneText = '';
    $.ajax({
        success: function() {
        	
        	$('#productMyInfoDetail').prop('action',"./aup");
        	$('#pcode').prop('value',"");
            $('#pcode').prop('readonly',true);
            $('#pname').prop('value',"");
            $('#pname').prop('readonly',true);
            $('#pprice').prop('value',"");
            $('#pprice').prop('readonly',true);
            $('#pcate').prop('value',"");
            $('#pcate').prop('readonly',true);
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
        	 
        	productMyInsertCancelText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productMyUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productMyDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-12 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="productMyInsertButton" value="회원추가"' + 
			'onclick="productMyInsertForm()" title="회원추가 버튼">';

			 document.getElementById("productMyButtonZone").innerHTML = productMyInsertCancelText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}


function productMyInsertAction() {	
	var pname = document.getElementById('pname').value;
	var productMy = $("form[name=productMyInfoDetail]").serialize();
	
    $.ajax({
        type: 'POST',
        url: './ain',
   		data: productMy,
        success: function() {
        	productMySearchAction(document.getElementsByClassName("productMyActivePage")[0].value);
        	alert("추가한 상품 = " + pname + "\n추가가 완료되었습니다.");
        	productMyInsertCancel();
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function productMyUpdateAction() {	
	var pcode = document.getElementById('pcode').value;
	var productMy = $("form[name=productMyInfoDetail]").serialize();
	
    $.ajax({
        type: 'POST',
        url: './aup',
   		data: productMy,
        success: function() {
        	productMySearchAction(document.getElementsByClassName("productMyActivePage")[0].value);
        	alert("수정이 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function productMyDeleteAction() {	
	var pcode = document.getElementById('pcode').value;
    
    $.ajax({
        type: 'POST',
        url: './ade/pcode/' + pcode,
   		data: {pcode:pcode},
        success: function() {
        	productMySearchAction(document.getElementsByClassName("productMyActivePage")[0].value);
        	alert("삭제가 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function pfileUploadAction() {
	var pfileUpload = new FormData($("#productMyInfoDetail")[0]);
    var pfileZoneText = "";
	
    $.ajax({
        url: "./afu",
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

</script>

<br>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--전체 상품 관리//-->
					<div class="panel productMy-panel-default left-productMy-panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<select id="productMySearchCategory" name="productMySearchCategory" class="btn btn-default btn-md">
											<option value="pname">상품명</option>
											<option value="pcate">카테고리</option>
											<option value="ptag">태그명</option>											
											<option value="sid">판매자아이디</option>
										</select>
										<input class="form-control input-sm" id="productMySearchText" type="text"
											placeholder="검색어를 입력해주세요."> <span class="input-group-btn">
											<input type="button" class="btn btn-default btn-md" id="productMySearchButton" value="검색" onclick="productMySearchAction()">
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
											<th>카테고리</th>
											<th>태그명</th>								
											<th>판매자아이디</th>
										</tr>
									</thead>
									<tbody id="productMyListBody">
									<c:forEach items="${productMyList}" var="productMy">
										<tr id="productMyInfoBtn" data-pcode="${productMy.pcode}" onclick="productMyInfoAction(this)">
											<td>${productMy.pname}</td>
											<td>${productMy.pcate}</td>
											<td>${productMy.ptag}</td>											
											<td>${productMy.sid}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<ul class="pagination justify-content-center" id="productMyPagingZone">
								<c:if test= "${productMyPaging.prev}">
									<li class="page-item"><a class="page-link" href="#" onclick="productMySearchAction(1)">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${productMyPaging.startPage}" end="${productMyPaging.endPage}">
									<c:if test="${productMyPaging.page eq page}">
									<li class="page-item active productMyActivePage" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="productMySearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${productMyPaging.page ne page}">
									<li class="page-item" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="productMySearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${productMyPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="productMySearchAction(${productMyPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//전체 상품 관리 -->
				</div>
				
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel productMy-panel-default">
						<div class="panel-heading" id="panel-heading-right"> &nbsp;상품 상세 정보</div>
						<div class="panel-body">
									<div class="overlay overlayFade" id="overlayFade">
										<img src="/asac/resources/upload/" alt="img" class="image">
									</div>
							<div class="table-responsive" id="productMyFormTable">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="productMyInfoDetail" id= "productMyInfoDetail" name="productMyInfoDetail" method="post">
				
					<div class="mb-1 input-group-sm">
					<label for="pcode">상품코드 <span class="text-danger">*</span></label> 
						<input type="text"
							class="form-control" name="pcode" id="pcode" value="${productMy.pcode}"
							placeholder="상품코드" pattern="^[A-Z0-9_]{3,20}$" 
							maxlength="20" required readonly>					
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pname">상품명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pname" id="pname" value="${productMy.pname}"
							placeholder="상품명" pattern="^[가-힣]+$" 
							maxlength="35" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pprice">가격 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pprice" id="pprice" value="${productMy.pprice}"
							placeholder="가격" pattern="^[0-9]+$" 
							maxlength="6" required readonly>
					</div>	
					<div class="mb-1 input-group-sm">
						<label for="pcate">카테고리 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pcate" id="pcate" value="${productMy.pcate}"
							placeholder="카테고리" pattern="^[가-힣]+$" 
							maxlength="20" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="ptag">태그명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="ptag" id="ptag" value="${productMy.ptag}"
							placeholder="태그명" pattern="^[가-힣]+$" 
							maxlength="13" required readonly>
					</div>
					<div class="mb-1 input-group-sm" id="pfileZone">
					<div class="row">
					<div class="col-md-9 input-group-sm">
						<label for="pfile">증명서류 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name="pfile" id="pfile" placeholder="상품사진" value=""
							maxlength="10" required readonly>
					</div>
					<div class="col-md-3">
						<input type="file" accept="image/*"
							class="form-control" name="pfileUpload" id="pfileUpload" value="사진등록" onchange="pfileUploadAction()">
						<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>
						<input type="button" class="form-control" name="pfileUploadButton" id="pfileUploadButton" value="사진등록" onclick="document.getElementById('pfileUpload').click()" disabled>							
					</div>
					</div>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pcontent">상품설명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pcontent" id="pcontent" value="${productMy.pcontent}"
							placeholder="상품설명" 
							maxlength="60" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pregdate">등록일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pregdate" id="pregdate" value="${productMy.pregdate}"
							placeholder="등록일" 
							maxlength="20" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="pcontent">판매자아이디 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="sid" id="sid" value="${productMy.sid}"
							placeholder="판매자아이디" 
							maxlength="20" required readonly>
					</div>
					
					
					<hr class="mb-4">
				
					<div class="row" id="productMyButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productMyUpdateButton" value="수정하기" title="수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productMyDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="productMyInsertButton" value="상품추가" 
						onclick="productMyInsertForm()" title="상품추가 버튼">
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
	</div>
	
	<script>

	function productMyUpdateOk() {
		if(!confirm('정말 수정하시겠습니까?')){
			return false;
		} else {
			productMyUpdateAction();
		}
	}
	
	function productMyDeleteOk(){
		if(!confirm('정말 삭제하시겠습니까?')){
			return false;
		} else {
			productMyDeleteAction();
		}
	}
	
	function productMyInsertOk() {
		if(!confirm('상품을 추가하시겠습니까?')){
			return false;
		} else {
			productMyInsertAction();
		}
	}
    
	</script>

		
</body>
</html>