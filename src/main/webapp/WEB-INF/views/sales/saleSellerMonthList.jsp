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
<title>매출 목록 상품</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		getGraph();
	});
      
	function getGraph(){
		var jsonData = ${selmonList}
		var jsonDataConfirm = ${selmonConfirmList}
		    	  
		var jsonObject = JSON.stringify(jsonData);
		var jsonObjectConfirm = JSON.stringify(jsonDataConfirm);
		          
		var jData = JSON.parse(jsonObject);
		var jDataConfirm = JSON.parse(jsonObjectConfirm);
		
		var labelList = new Array();
		var valueList = new Array();
		var valueConfirmList = new Array();

		for (var i = 0; i < jData.length; i++) {
			var d = jData[i];
			labelList.push(d.month);
			valueList.push(d.total);
		}
		for (var i = 0; i < jDataConfirm.length; i++) {
			 var t = jDataConfirm[i];
			valueConfirmList.push(t.total);
		}
          
		new Chart(document.getElementById("chart"), {
			type: "bar",
			data: {
				labels : labelList,
				datasets : [ {
				label : "총주문수",
 					data : valueList,
					borderColor: "#0055ff",
					backgroundColor: "#0055ff",
					borderWidth: 2,
					borderRadius: 2,
					borderSkipped: false
				}, {
					label : "구매완료수",
					data : valueConfirmList,
					borderColor: "#005500",
					backgroundColor: "#005500",
					borderWidth: 2,
					borderRadius: 2,
					borderSkipped: false
				}]
			},
			options: {
				scales: {
					xAxes: [{
						reverse: true,
						gridLines: {
						color: "rgba(0,0,0,0.0)"
					}
				}],
					yAxes: [{
						ticks: {
						stepSize: 10000,
						min:0
						},
						display: true,
						borderDash: [3, 3],
						gridLines: {
						color: "rgba(0,0,0,0.0)"
					}
				}]
			},
			legend: {
				position: 'bottom',
				},
				title:{
 				display : true,
				text: '상품별 매출관리'
				}
			}
		});
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
</script>
</head>
<body>
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
<section id="listForm">
<div class="table-title">
	<h1 class="mainTitle">매출 통계(날짜)</h1></div>
<div>

<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./dy'">
<span class="btde">요일별</span></button>
<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./dt'">
<span class="btde">일별</span></button>
<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./we'" class="btn btn-success">
<span class="btde">주별</span></button>
<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./mo'" class="btn btn-success">
<span class="btde">월별</span></button>

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
						<td>주문월</td>
						<td>구매완료수</td>
						<td>총 주문수</td>
						<td>구매완료 금액</td>
						<td>총 주문금액</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleSellerMonthList}" varStatus="status">
						<tr class="line">
							<td>${sale.month}</td>
							<td>
								<c:choose>
								<c:when test="${saleSellerMonthConfirmList[status.index].count eq null}">0</c:when>
								<c:when test="${saleSellerMonthConfirmList[status.index].count ne null}">${saleSellerDayConfirmList[status.index].count}</c:when>
								</c:choose></td>
							<td>${sale.count}</td>
							<td>
								<c:choose>
								<c:when test="${saleSellerMonthConfirmList[status.index].total eq null}">0원</c:when>
								<c:when test="${saleSellerMonthConfirmList[status.index].total ne null}"><fmt:formatNumber value="${saleSellerDayConfirmList[status.index].total}" pattern="#,###"/>원</c:when>
								</c:choose></td>
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
    		<canvas id="chart"></canvas>
		</div>	
    </div>
      
    		</div>
    	</div>
    </div>        
</div>
</section>
</div>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>
</div>
</body>
</html>