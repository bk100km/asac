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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
  const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  const data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {}
  };
  
  const myChart = new Chart(
		    document.getElementById('myChart'),
		    config
	);
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
<header>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" flush="false"></jsp:include>
</header>
<section id="listForm">
<div class="table-title">
	<h1 class="mainTitle">매출 목록(요일)</h1></div>
		<div class="tabclass">
  				<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./ad'">
				<span class="btde">전체 내역</span></button>
				<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./sd'" class="btn btn-success">
				<span class="btde">본인 내역</span></button>
<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./sd'">
<span class="btde">요일별 매출</span></button>
<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./sp'" class="btn btn-success">
<span class="btde">상품/카테고리별 매출</span></button>
</div>
<div class="container-xl">
    <div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
			
	<div class="col-lg-6">
	<div class="panel panel-default">		
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
					<tr class="line">
						<td>요일</td>
						<td>구매완료수</td>
						<td>총 주문수</td>
						<td>구매완료 금액</td>
						<td>총 주문금액</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleSellerAdDayList}" varStatus="status">
						<tr class="line">
							<td>${sale.daterange}</td>
							<td>${saleSellerAdDayConfirmList[status.index].count}</td>
							<td>${sale.count}</td>
							<td><fmt:formatNumber value="${saleSellerAdDayConfirmList[status.index].total}" pattern="#,###"/>원</td>
							<td><fmt:formatNumber value="${sale.total}" pattern="#,###"/>원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
        </div>
    </div>
    </div>
    </div>
    
    
    <div class="col-lg-6">
	<div class="panel panel-default">
   		<div class ="chartjs">
			<div class ="linechart"><canvas id="linechart" height="250" width="250"></canvas></div>
			<div class ="barchart"><canvas id="barchart" height="250" width="250"></canvas></div>
			<div class ="donutchart"><canvas id="donutchart" height="250" width="250"></canvas></div>
		</div>
    </div>
    </div>
    
    
    		</div>
    	</div>
    </div>        
</div>
</section>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>     
</body>
</html>