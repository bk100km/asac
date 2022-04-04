<%@page import="kr.co.asac.product.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>최고 관리자 상품 추가 폼</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

</style>
<title>상품 추가</title>
<script type="text/javascript">
function goBack() {
	window.location.href = "./la";
}

$(function() {
	document.getElementById('pfile').onchange = function () {
	    var filename = this.value;
    	var a = filename.split(".");
    	if( a.length === 1 || ( a[0] === "" && a.length === 2 ) ) {
       	 return "";
    	}   
    	var suffix = a.pop().toLowerCase(); 
    	if (!(suffix in {jpg:'', jpeg:'', png:'', gif:'', tiff:''})){
       	 document.getElementById('pfile').value = "";
       	 alert('이미지파일만 업로드 가능합니다.'); 
    	} else {
    		document.getElementById('pfile').value = pfile;
    	}
    };
})

</script>
</head>
<body>
<jsp:useBean id="product" scope="request" class="kr.co.asac.product.bean.ProductBean"></jsp:useBean>
<header>
<jsp:include page="/WEB-INF/views/common/sellerHeader.jsp" flush="false"></jsp:include>
</header>
<div class="main-content">
<div class="container">
	<form class="productSellerInsert" id="productSellerInsert" name="productSellerInsert" action="./in" method="post">
		<div class="mb-3">
		<label for="pcode">상품 코드<span class="text-danger">*</span></label> 
			<input type="text" class="form-control" name="pcode" id="pcode" value="" placeholder="상품 코드" autocomplete="off" required></div>
		<div class="mb-3">
		<label for="pname">상품 명<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="pname" id="pname" value="" placeholder="상품 명" autocomplete="off" required></div>
		<div class="mb-3">
		<label for="pprice">상품 가격<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="pprice" id="pprice" value="" placeholder="상품 가격" autocomplete="off" maxlength="6"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></div>					
		<div class="mb-3">
		<label for="pcate">카테고리<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="pcate" id="pcate" value="" placeholder="카테고리" autocomplete="off" required></div>
		<div class="mb-3">
		<label for="ptag">상품 태그<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="ptag" id="ptag" value="" placeholder="상품 태그" autocomplete="off" required></div>
		<div class="mb-3">
		<label for="pfile">상품 사진<span class="text-danger">*</span></label>
			<input type="file" class="form-control" name="pfile" id="pfile" value="" placeholder="상품 사진" accept="image/*" autocomplete="off" required></div>
		<div class="mb-3">
		<label for="pcontent">상품 내용<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="pcontent" id="pcontent" value="" placeholder="상품 내용" autocomplete="off" required></div>	
		<div class="mb-3">
		<label for="sid">판매자 아이디<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="sid" id="sid" value="" placeholder="판매자 아이디" autocomplete="off" required></div>
		
		<div class="col-md-6 mb-3">
			<input type="submit" class="btn btn-default btn-lg btn-block" id="productSellerInsert" value="상품 추가"> </div>
		<div class="col-md-6 mb-3">
			<input type="button" class="btn btn-default btn-lg btn-block" id="productSellerInsert" onclick="goBack()" title="취소" value="취소"></div>			
	</form>					
<div class="space">&nbsp;</div>
<div class="space">&nbsp;</div>
</div>
</div>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>