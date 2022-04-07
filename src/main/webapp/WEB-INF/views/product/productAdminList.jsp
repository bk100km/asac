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

#productUpdateButtonHidden {
	display: none;
}

#productInsertButtonHidden {
	display: none;
}

#productSearchText {
    float: right;
    width: 78%;
}
 
#leftPanel {
	text-align: center;
	height: 600px;
}
	
#leftPanel .table-responsive {
	height: 500px;
}

#sellerInfoBtn td {
	line-height: 20px;
}

th {
    text-align: center;
}

#pfileUploadButtonLabel {
	margin-top:15px;
}

#pfileUpload {
	display: none;
</style>
</head>

<body>

<script>
<!-- 상세정보 조회 AJAX -->
function productInfoAction(clickedProduct) {
	var pcode = clickedProduct.getAttribute("data-pcode");
	
    $.ajax({
        type: 'POST',
        url: './if',
        data: {pcode:pcode},
        success: function(product) {

            $(product).each(function(index, item) {
                $('#pcode').prop('value',product.pcode);
                $('#pname').prop('value',product.pname);
                $('#pname').prop('readonly',false);
                $('#pprice').prop('value',product.pprice);
                $('#pprice').prop('readonly',false);
                $('#pcate').prop('value',product.pcate);
                $('#pcate').prop('readonly',false);
                $('#ptag').prop('value',product.ptag);
                $('#ptag').prop('readonly',false);
                $('#pfile').prop('value',product.pfile);
                $('#pfileUploadButton').prop('disabled',false);
                $('#pcontent').prop('value',product.pcontent);
                $('#pcontent').prop('readonly',false);
                $('#pregdate').prop('value',product.pregdate);
                $('#sid').prop('value',product.sid);
                $('#productUpdateButton').attr('onclick',"productUpdateOk()");
                $('#productDeleteButton').attr('onclick',"productDeleteOk()");
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
	var productPagingText = "";
	var page = clickedPage;
	var step = 0;
    $.ajax({
        type: 'POST',
        url: './se',
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
	var productInsertFormButtonZoneText = '';
	var productInsertFormIdZoneText = '';
	var today = new Date();
    $.ajax({
        success: function() {
        	
        	$('#productInfoDetail').prop('action',"productInsertAction()");
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
        	
        	productInsertFormButtonZoneText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="productInsertButton" value="추가하기" onclick="productInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="productInsertBackButton" value="뒤로가기" onclick="productInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			productInsertFormIdZoneText = '<div class="row">' + 
			'<div class="col-md-12 mb-3">' +
			'<label for="pcode">상품코드  <span class="text-danger">*</span></label>' +
			'<input type="text"' +
			'class="form-control" name="pcode" id="pcode"' + 
			'placeholder="상품코드" pattern="^[A-Z0-9_]{3,20}$"' + 
			'minlength="4" maxlength="20" required>' +
			'</div>' +
			'</div>';			
				
			document.getElementById("productButtonZone").innerHTML = productInsertFormButtonZoneText;
			document.getElementById("productIdZone").innerHTML = productInsertFormIdZoneText;
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
        	 
        	productInsertCancelText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="productUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="productDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-12 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="productInsertButton" value="상품추가"' + 
			'onclick="productInsertForm()" title="상품추가 버튼">';
			productInsertFormIdZoneText = '<label for="pcode">상품코드 <span class="text-danger">*</span></label>' +
			'<input type="text"' +
			'class="form-control" name="pcode" id="pcode" value="${product.pcode}"' +
			'placeholder="상품코드" pattern="^[A-Z0-9_]{3,20}$"' + 
			'minlength="4" maxlength="20" required readonly>' +
			'</div>';
			 document.getElementById("productButtonZone").innerHTML = productInsertCancelText;
			 document.getElementById("productIdZone").innerHTML = productInsertFormIdZoneText;
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
				
        },
        error: function(request, status, error) {
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
			'<div class="col-md-9 mb-3">' +
				'<label for="pfile">상품사진 <span class="text-danger">*</span></label> <input type="text"' +
					'class="form-control" name="pfile" id="pfile" placeholder="상품사진" value="' + pfile + '"' +
					'maxlength="11" required readonly>' +
			'</div>' +
			'<div class="col-md-3 mb-3">' +
				'<input type="file" accept="image/*"' +
					'class="form-control" name="pfileUpload" id="pfileUpload" value="파일등록" onchange="pfileUploadAction()">' +
				'<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>' +
				'<input type="button" class="form-control" name = "pfileUploadButton" id="pfileUploadButton" value="파일등록" onclick="document.getElementById(`pfileUpload`).click()">' +							
			'</div>' +
			'</div>' + 
			'<a href="resources/image/product/' + pfile + '">미리보기' + pfile + '</a><br/>';
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
				<div class="col-lg-7">
					<!--좌우분할 5:7-->
					<!--전체 상품 관리//-->
					<div class="panel panel-default">
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
											placeholder="검색어를 입력해주세요."> <span class="input-group-btn">
											<input type="button" class="btn btn-primary btn-sm" id="productSearchButton" value="검색" onclick="productSearchAction()">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body" id="leftPanel">
							<div class="table-responsive">
								<table id="productListTable" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>										
											<th>상품명</th>								
											<th>카테고리</th>
											<th>태그명</th>								
											<th>판매자아이디</th>
										</tr>
									</thead>
									<tbody id="productListBody">
									<c:forEach items="${productList}" var="product">
										<tr id="productInfoBtn" data-pcode="${product.pcode}" onclick="productInfoAction(this)">
											<td>${product.pname}</td>
											<td>${product.pcate}</td>
											<td>${product.ptag}</td>											
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
									<li class="page-item active productActivePage" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="productSearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${productPaging.page ne page}">
									<li class="page-item" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="productSearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${productPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="productSearchAction(${productPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//전체 상품 관리 -->
				</div>
				
				<div class="col-lg-5">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel panel-default">
						<div class="panel-heading">상품 상세 정보</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="productInfoDetail" id= "productInfoDetail" name="productInfoDetail" method="post">
					<div class="mb-3" id="productIdZone">
					<label for="pcode">상품코드 <span class="text-danger">*</span></label> 
						<input type="text"
							class="form-control" name="pcode" id="pcode" value="${product.pcode}"
							placeholder="상품코드" pattern="^[A-Z0-9_]{3,20}$" 
							maxlength="20" required readonly>					
					</div>
					<div class="mb-3">
						<label for="pname">상품명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pname" id="pname" value="${product.pname}"
							placeholder="상품명" pattern="^[가-힣]+$" 
							maxlength="35" required readonly>
					</div>
					<div class="mb-3">
						<label for="pprice">가격 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pprice" id="pprice" value="${product.pprice}"
							placeholder="가격" pattern="^[0-9]+$" 
							maxlength="6" required readonly>
					</div>	
					<div class="mb-3">
						<label for="pcate">카테고리 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pcate" id="pcate" value="${product.pcate}"
							placeholder="카테고리" pattern="^[가-힣]+$" 
							maxlength="20" required readonly>
					</div>
					<div class="mb-3">
						<label for="ptag">태그명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="ptag" id="ptag" value="${product.ptag}"
							placeholder="태그명" pattern="^[가-힣]+$" 
							maxlength="13" required readonly>
					</div>
					<div class="mb-3" id="pfileZone">
					<div class="row">
					<div class="col-md-9 mb-3">
						<label for="pfile">상품사진 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name="pfile" id="pfile" placeholder="상품사진" value="${product.pfile}"
							maxlength="11" required readonly>
					</div>
					<div class="col-md-3 mb-3">
						<input type="file" accept="image/*"
							class="form-control" name="pfileUpload" id="pfileUpload" value="파일등록" onchange="pfileUploadAction()">
						<label for="pfileUploadButton" id="pfileUploadButtonLabel"></label>
						<input type="button" class="form-control" name = "pfileUploadButton" id="pfileUploadButton" value="파일등록" onclick="document.getElementById('pfileUpload').click()" disabled>							
					</div>
					</div>
					</div>
					<div class="mb-3">
						<label for="pcontent">상품설명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pcontent" id="pcontent" value="${product.pcontent}"
							placeholder="상품설명" 
							maxlength="60" required readonly>
					</div>
					<div class="mb-3">
						<label for="pregdate">등록일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="pregdate" id="pregdate" value="${product.pregdate}"
							placeholder="등록일" 
							maxlength="20" required readonly>
					</div>
					<div class="mb-3">
						<label for="pcontent">판매자아이디 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name="sid" id="sid" value="${product.sid}"
							placeholder="판매자아이디" 
							maxlength="20" required readonly>
					</div>
					
				
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row" id="productButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="productUpdateButton" value="수정하기" title="수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="productDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="productInsertButton" value="상품추가" 
						onclick="productInsertForm()" title="상품추가 버튼">			
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

	function productUpdateOk() {
		if(!confirm('정말 수정하시겠습니까?')){
			return false;
		} else {
			productUpdateAction();
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
		if(!confirm('상품을 추가하시겠습니까?')){
			return false;
		} else {
			productInsertAction();
		}
	}
    
	</script>

		
</body>
</html>