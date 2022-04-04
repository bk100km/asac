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
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
			
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
			
		var url = "la";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		}

	  //페이지 번호 클릭

	function fn_pagination(page, listSize) {

		var url = "la";
			url = url + "?page=" + page;
			url = url + "&listSize=" + $('#listSize').val();

			location.href = url;	
		}

		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;			
		var url = "la";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}
		
		
	/* $는 jQuery를 시작하는 명령어로
	$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
	e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
		
		// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "la";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		console.log(url);

	});	

	/*한페이지당 게시물 */
	function page(ocode){
	  var startPage = ocode;
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
	border-radius: 15px; line-height: 30px; text-align: center; text-decoration: none; background: #008000;	opacity: 0.7; color: #fff;}
#listForm {flex: 1;  width:80%; margin:auto; text-align: center;}
.mainTitle { font-family: ‘SUIT’; text-align: center; font-weight:900;}

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
	<h1 class="mainTitle">주문 목록</h1></div>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-filter">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="show-entries">
                            <span>주문 목록 갯수</span>
                <select class="form-control" name="searchType"
				id="listSize" onchange="page(1)">
				<option value="10"
					<c:if test="${orderPagingAd.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
				<option value="15"
					<c:if test="${orderPagingAd.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
				<option value="20"
					<c:if test="${orderPagingAd.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
			</select>
                        </div>
                    </div>
                <div class="col-sm-4">						
                	<a href="ls" class="btn btn-primary"><i class="material-icons">list</i> <span>나의 목록</span></a>
                	<a href="la" class="btn btn-primary"><i class="material-icons">list</i> <span>전체 목록</span></a>

                </div>
                    <div class="col-sm-5">
                        <button type="button" id="btnSearch" class="btn btn-primary"><i class="fa fa-search"></i><span>검색</span></button>
                        <div class="filter-group">
                            <input type="text" class="form-control" placeholder="내용을 입력하세요." name="keyword" id="keyword">
                        </div>
                        <div class="filter-group">
                            <select class="form-control" name="searchType" id="searchType">
								<option value="pname">상품명</option>
								<option value="oname">주문자명</option>
								<option value="mid">주문자아이디</option>							
                            </select>
                        </div>
                	</div>
                </div>
            </div>
            <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
					<tr class="line">
						<td>주문 번호</td>
						<td>판매자 아이디</td>
						<td>주문자 아이디</td>
						<td>주문자 명</td>
						<td>상품 코드</td>
						<td>상 품 명</td>
						<td>개당가격</td>
						<td>수 량</td>
						<td>총합 가격</td>
						<td>주문자전화번호</td>
						<td>주 문 일</td>
						<td>받는사람</td>
						<td>배송주소</td>
						<td>배송전화번호</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="order" items="${orderAdminList}">
						<tr class="line">
							<td><a href="in?ocode=${order.ocode}">${order.ocode}</a></td>
							<td>${order.sid}</td>
							<td>${order.mid}</td>
							<td>${order.mname}</td>
							<td>${order.pcode}</td>
							<td>${order.pname}</td>
							<td><fmt:formatNumber value="${order.pprice}" pattern="#,###"/>원</td>
							<td>${order.ocount}</td>
							<td>${order.ototal}</td>
							<td>${order.ophone}</td>
							<td><fmt:formatDate value="${order.oregdate}" pattern="yyyy-MM-dd"/></td>
							<td>${order.oname}</td>
							<td>${order.oaddr}</td>
							<td>${order.ophone}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
            <div class="clearfix">
                <ul class="pagination">
                    <c:if test="${orderPagingAd.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${orderPagingAd.page}', '${orderPagingAd.range}', '${orderPagingAd.rangeSize}', '${orderPagingAd.listSize}'
					,'${searchAd.searchType}', '${searchAd.keyword}')">이전</a></li>
			</c:if>

			<c:forEach begin="${orderPagingAd.startPage}"
				end="${orderPagingAd.endPage}" var="ocode">

				<li
					class="page-item <c:out value="${orderPagingAd.page == ocode ? 'active' : ''}"/> "><a
					class="page-link" href="#"
					onClick="fn_pagination('${ocode}', '${orderPagingAd.range}', '${orderPagingAd.rangeSize}', '${orderPagingAd.listSize}'
					 ,'${searchAd.searchType}', '${searchAd.keyword}')">
						${ocode} </a></li>
			</c:forEach>

			<c:if test="${orderPagingAd.next}">

				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${orderPagingAd.range}', '${orderPagingAd.range}', '${orderPagingAd.rangeSize}', '${orderPagingAd.listSize}'
					,'${searchAd.searchType}', '${searchAd.keyword}')">다음</a></li>
			</c:if>
                </ul>
            </div>
            <div>
			<a href="#" id="topBtn">맨 위로</a>
			</div>
        </div>
    </div>        
</div>
</section>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>     
</body>
</html>