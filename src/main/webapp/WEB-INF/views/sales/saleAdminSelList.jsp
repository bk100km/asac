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
<title>주문 내역 - 최고 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<style type="text/css">
body {
	font-family: ‘SUIT’, 'GulimChe';
	color: #2B2B2B;
}
.tabclass{text-align:left; border-bottom:1px solid #005000; margin-bottom:20px;}
#pageList { margin: auto; width: 500px; text-align: center; }
#topBtn { position: fixed; top: 300px; right: 20px; z-index: 99; display: inline-block; width: 75px; height: 30px;
	border-radius: 15px; line-height: 30px; text-align: center; text-decoration: none; background: #008000;	opacity: 0.7; color: #fff;}
.fontdetail {
	font-family: ‘SUIT’;
	font-size: 1.2em;
}
.pagenumber {
	font-family: ‘SUIT’;
	text-align: center;
	font-size: 1.5em;
}
.checked:link {
	color: #28A745;
	text-decoration: none;
}
th, td {
	border-bottom: 5px 20px; solid #dee2e6;}
	.btde {font-size:1.5rem; font-family: ‘SUIT’;}
	
	.tabclass{text-align:left;}
	
}
a.tdetail:link {
	color: #2B2B2B;
	text-decoration: none;
}
a.tdetail:visited {
	color: #2B2B2B !important;
	text-decoration: none;
}
a.tdetail:hover {
	color: #28A745;
	text-decoration: none;
}
a.tdetail:active {
	color: #28A745 ;
	text-decoration: none;
}
.page-item a.active { background-color: #008000; color: white; font-weight: bold; }
.searchBox { display: flex; flex-wrap: nowrap; justify-content: flex-end; margin-top:20px; margin-bottom: 10px; }
.search1{ margin-right: 3px; }
.searchText { width: 300px; height: 38px; border-radius: 3px; border: 1px solid #999999; color: #2B2B2B; }
.searchSelect { width: 80px; height: 38px; border-radius: 3px; border: 1px solid #999999; color: #2B2B2B; }
.line {border-bottom:2px solid #008000; border-top:2px solid #008000; font-weight:900; color:#008000;}
#listForm {flex: 1; width:80%; margin:auto; text-align: center;}
.wrap { display: flex; min-height: 100vh; flex-direction: column; }
.nobr { text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
table {table-layout: fixed;position: relative;width:100%; }
.table td {vertical-align:middle;}
.jemok {margin:20px; font-family: ‘SUIT’; text-align: center; font-size: 4em; font-weight:900;}
#btnRes { font-size:1.5rem; font-family: ‘SUIT’; border: 3px solid #008000; background-color: #008000; color: #FFFFFF; font-weight: bold;}
#btnUse { font-size:1.5rem; font-family: ‘SUIT’; color: #008000; font-weight: bold;}
#btnSearch { font-size:1rem; font-family: ‘SUIT’; border: 2px solid #008000; color: #008000; font-weight: bold;}
#btnSebu {font-family: ‘SUIT’; background-color:#008000; color: #FFFFFF; font-weight: bold;}

@media only screen and (max-width:768px) {
		#pageList { margin: auto; width: 200px; text-align: center; }
		#input {width : 100px; margin-top:5px; margin-bottom:5px;}
		.searchText { width: 120px; }
		.searchBox { justify-content: center; }
		#btnSebu {font-family: ‘SUIT’; color:#008000; background-color: #FFFFFF; border:1px solid #008000; font-size:12px; font-weight: bold;}
		#listForm {width:90%;}
		.jemok {margin:20px; font-family: ‘SUIT’; text-align: center; font-size: 3em; font-weight:900;}
		#content { overflow: hidden; font-size:1em;}		
	}
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
</script>
</head>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="../common/adminHeader.jsp"></jsp:include>
	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
            
		<section id="listForm">
			<h1 class="jemok">주문 내역</h1>
		<div class="tabclass">
  				<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./ad'">
				<span class="btde">전체 내역</span></button>
				<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./sd'" class="btn btn-success">
				<span class="btde">본인 내역</span></button>
			</div>
		
		<div class="tabclass">
		<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./ad'">
				<span class="btde">요일별 매출</span></button>
		<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./as'" class="btn btn-success">
				<span class="btde">판매자별 매출</span></button>
		<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./ap'" class="btn btn-success">
				<span class="btde">상품/카테고리별 매출</span></button>
		</div>
		
		
		<div id="rListArea">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="line">
						<td>판매자아이디</td>
						<td>총 주문수</td>
						<td>총 주문가격</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleAdminSellerList}">
						<tr class="line">
							<td>${sale.sid}</td>
							<td>${sale.count}</td>
							<td>${sale.total}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
		<br/><br/><br/>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="line">
						<td>주문일</td>
						<td>총 주문수</td>
						<td>총 주문가격</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleAdminSellerListBest}">
						<tr class="line">
							<td>${sale.sid}</td>
							<td>${sale.count}</td>
							<td>${sale.total}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
		<br/><br/><br/>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="line">
						<td>해당일</td>
						<td>총 주문수</td>
						<td>총 주문가격</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleAdminSellerListWorst}">
						<tr class="line">
							<td>${sale.sid}</td>
							<td>${sale.count}</td>
							<td>${sale.total}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
		<div>
			<a href="#" id="topBtn">맨 위로</a>
		</div>
	</div>
	<div id="pageArea"></div>
	</section>
</div>

	<br><br><br>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
	</footer>
	</div>
</div>

</body>
</html>