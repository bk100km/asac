<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="kr.co.asac.orders.bean.OrderBean" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 내역</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

		//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {	
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var searchType = '${searchAd.searchType}';
		var keyword = '${searchAd.keyword}';
		var url = "la";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		}

	  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
		  
		var range;
		if (page == 1 || page == 2 || page == 3 || page == 4 || page == 5) {
			range = 1;
		} else if (page == 6 || page == 7 || page == 8 || page == 9 || page == 10) { 
			range = 2;
		} else if (page == 11 || page == 12 || page == 13 || page == 14 || page == 15) {
			range = 3;
		} else if (page == 16 || page == 17 || page == 18 || page == 19 || page == 20) {
			range = 4;
		} else if (page == 21 || page == 22 || page == 23 || page == 24 || page == 25) {
			range = 5;
		}
		var searchType = '${searchAd.searchType}';
		var keyword = '${searchAd.keyword}';
		var url = "la";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;	
	}


		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var searchType = '${searchAd.searchType}';
		var keyword = '${searchAd.keyword}';
		var url = "la";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&listSize=" + $('#listSize').val();
			location.href = url;
		}		
	/* $는 jQuery를 시작하는 명령어로
	$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
	e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
		
		// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var page = 1;
		var range = 1;
		var url = "la";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		console.log(url);

	});	

	/*한페이지당 게시물 */
	function page(pcode){
	  var startPage = pcode;
	  var listSize = $("#listSize option:selected").val();		
	  if(listSize == 10){
		  var url="la?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 15){
		  var url ="la?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 20){
	      var url="la?startPage="+startPage+"&listSize="+listSize
	 
	  }
	  location.href = url;
	}
</script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}
.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}
.table-wrapper .btn.btn-primary {
	color: #fff;
	background: #03A9F4;
}
.table-wrapper .btn.btn-primary:hover {
	background: #03a3e7;
}

.show-entries select.form-control {        
	width: 80px;
	margin: 0 5px;
}

.table-title {	
	padding: 16px 25px;
	margin: -20px -25px 10px;
}
.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-filter .filter-group {
	float: right;
}
.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}
.table-filter {
	padding: 5px 0 10px;
}

.table-filter .btn {
	height: 34px;
	font-size: 13px;
	border: none;
}

.table-filter .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}
.table-filter .btn span {
	float: left;
	margin-top: 2px;
}
.table-filter label {
	font-weight: normal;
}
.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}
.table-filter input {
	width: 150px;
	display: inline-block;
}
.filter-group select.form-control {
	width: 110px;
}
.filter-icon {
	float: right;
	margin-top: 7px;
}
.filter-icon i {
	font-size: 18px;
	opacity: 0.7;
}	
table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}
table.table tr th:first-child {
	width: 60px;
}
table.table tr th:last-child {
	width: 80px;
}
table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}	
table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}
table.table td a:hover {
	color: #2196F3;
}
table.table td a.view {        
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}
table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}   
table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}
.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}
.text-success {
	color: #10c469;
}
.text-info {
	color: #62c9e8;
}
.text-warning {
	color: #FFC107;
}
.text-danger {
	color: #ff5b5b;
}
.pagination {
    float: center;
    margin: 0 0 5px;
}
.pagination li a {
    border: none !important;
    font-size: 13px;
    min-width: 30px;
    min-height: 30px;
    padding: 0 10px;
    color: #999;
    margin: 0 2px;
    line-height: 30px;
    border-radius: 30px !important;
    text-align: center;
}
.pagination li a:hover {
    color: #666;
}	
.pagination li.active a {
    background: #03A9F4;
}
.pagination li.active a:hover {        
    background: #0397d6;
}
.pagination li.disabled i {
    color: #ccc;
}
.pagination li i {
    font-size: 16px;
    padding-top: 6px
}
.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
#topBtn { position: fixed; top: 300px; right: 20px; z-index: 99; display: inline-block; width: 75px; height: 30px;
	border-radius: 15px; line-height: 30px; text-align: center; text-decoration: none; background: blue;	opacity: 0.7; color: #fff;}
#listForm {flex: 1;  width:80%; margin:auto; text-align: center;}
.mainTitle { font-family: ‘SUIT’; text-align: center; font-weight:900;}
#btnUpd {font-family: ‘SUIT’; background-color:skyblue; color: #FFFFFF; font-weight: bold;}
#btnInf {font-family: ‘SUIT’; background-color:skyblue; color: #FFFFFF; font-weight: bold;}
#btnDel {font-family: ‘SUIT’; background-color:skyblue; color: #FFFFFF; font-weight: bold;}
#tdHead {font-size: 20px; font-weight: bold;}
</style>
<script type="text/javascript">

$(function() {

	var url = window.location.href;
	$('.page-item').find('a').each(function() {
		if (url == (this.href)) {
			$(this).toggleClass('active');
		}
	});
});

$(function() {
	$('#topBtn').hide();
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	$("#topBtn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 300);
		return false;
	});
});

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});

</script>
</head>
<body>
<div class="wrap">
<header>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" flush="false"></jsp:include>
</header>
<section id="listForm">
<div class="table-title">
<h1 class="mainTitle">상품 목록</h1>
</div>
<div class="container-xl">
    <div class="table-responsive menu">
        <div class="table-wrapper">
            <div class="table-filter">
                <div class="row">
                    <div class="col-lg-3 col-sm-12">
                        <div class="show-entries">
                            <span>상품 목록 갯수</span>
                				<select class="form-control" name="searchType" id="listSize" onchange="page(1)">
								<option value="10"
									<c:if test="${productPagingAd.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
								<option value="15"
									<c:if test="${productPagingAd.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
								<option value="20"
									<c:if test="${productPagingAd.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
								</select>
                        </div>
                    </div>
                	<div class="col-lg-4 col-sm-12">
                	    <a href="ls" class="btn btn-primary"><i class="material-icons">list</i> <span>나의 목록</span></a>
                		<a href="la" class="btn btn-primary"><i class="material-icons">list</i> <span>전체 목록</span></a>
	                </div>
                    <div class="col-lg-5 col-sm-12">
                        <button type="button" id="btnSearch" class="btn btn-primary"><i class="fa fa-search"></i><span>검색</span></button>
                        <div class="filter-group">
                            <input type="text" class="form-control" placeholder="내용을 입력하세요." name="keyword" id="keyword">
                        </div>
                        <div class="filter-group">
                            <select class="form-control" name="searchType" id="searchType">
								<option value="pname">상품명</option>
								<option value="ptag">태그명</option>
								<option value="pcontent">상품내용</option>
								<option value="sid">판매자 아이디</option>
							</select>
                        </div>
                	</div>
                </div>
            </div>
	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<thead>
				<tr class="line" id="tdHead">
					<td>상품 코드</td>
					<td>상품명</td>
					<td>상품 가격</td>
					<td>카테고리</td>
					<td>태그명</td>
					<td>상품 내용</td>
					<td>등록일</td>
					<td>판매자 아이디</td>
					<td class="table-filter"><a href="./in" class="btn btn-primary"><i class="material-icons">add</i> <span>상품 추가</span></a></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productAdminList}">
					<tr class="line" data-pcode="${product.pcode}">
						<td>${product.pcode}</td>
						<td>${product.pname}</td>
						<td><fmt:formatNumber value="${product.pprice}" pattern="#,###,###"/>원</td>
						<td>${product.pcate}</td>
						<td>${product.ptag}</td>
						<td>${product.pcontent}</td>
						<td>${product.pregdate}</td>
						<td>${product.sid}</td>
						<td>
							<button type="button" id="btnInf" class="btn" onclick="location.href='if?pcode=${product.pcode}'">상세</button>
							<button type="button" id="btnUpd" class="btn" onclick="location.href='./up?pcode=${product.pcode}'">수정</button>
							<button type="button" id="btnDel" class="btn" onclick="location.href='de?pcode=${product.pcode}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <div class="clearfix">
		<ul class="pagination">
			<c:if test="${productPagingAd.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${productPagingAd.page}', '${productPagingAd.range}', '${productPagingAd.rangeSize}', '${productPagingAd.listSize}', 
					'${searchAd.searchType}', '${searchAd.keyword}')">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${productPagingAd.startPage}" end="${productPagingAd.endPage}" var="pcode">
				<li
					class="page-item <c:out value="${productPagingAd.page == pcode ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${pcode}', '${productPagingAd.page}', '${productPagingAd.range}', '${productPagingAd.rangeSize}', '${productPagingAd.listSize}'
					 ,'${searchAd.searchType}', '${searchAd.keyword}')">${pcode} </a>
				</li>
			</c:forEach>
			<c:if test="${productPagingAd.next}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${productPagingAd.range}', '${productPagingAd.range}', '${productPagingAd.rangeSize}', '${productPagingAd.listSize}', 
					'${searchAd.searchType}', '${searchAd.keyword}')">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div>
		<a href="#" id="topBtn">맨 위로</a>
	</div></div></div></div>
</section>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>     
</body>
</html>