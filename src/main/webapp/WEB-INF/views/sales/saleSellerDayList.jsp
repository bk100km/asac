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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		getGraph();
	});
      
	function getGraph(){
		var jsonData = ${seldayList}
		var jsonDataConfirm = ${seldayConfirmList}
		    	  
		var jsonObject = JSON.stringify(jsonData);
		var jsonObjectConfirm = JSON.stringify(jsonDataConfirm);
		          
		var jData = JSON.parse(jsonObject);
		var jDataConfirm = JSON.parse(jsonObjectConfirm);
		
		var labelList = new Array();
		var valueList = new Array();
		var valueConfirmList = new Array();

		for (var i = 0; i < jData.length; i++) {
			var d = jData[i];
			labelList.push(d.daterange);
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
						stepSize: 50000,
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
<style type="text/css">
body { font-family: ‘SUIT’, 'GulimChe';	color: #72815D;}
.tabclass{text-align:left; border-bottom:1px solid #005000; margin-bottom:20px;}
#topBtn { position: fixed; top: 300px; right: 20px; z-index: 99; display: inline-block; width: 75px; height: 30px;
	border-radius: 15px; line-height: 30px; text-align: center; text-decoration: none; background: #72815D;	opacity: 0.7; color: #fff;}
th, td {border-bottom: 5px 20px; solid #dee2e6;}
.btde {font-size:1.5rem; font-family: ‘SUIT’;}
.line {border-bottom:2px solid #72815D; border-top:2px solid #72815D; font-weight:900; color:#72815D;}
#listForm {flex: 1; width:80%; margin:auto; text-align: center;}
.wrap { display: flex; min-height: 100vh; flex-direction: column; }
.nobr { text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
table {table-layout: fixed;position: relative;width:100%; }
.table td {vertical-align:middle;}
.jemok {margin:20px; font-family: ‘SUIT’; text-align: center; font-size: 4em; font-weight:900;}
#btnRes { font-size:1.5rem; font-family: ‘SUIT’; border: 3px solid #72815D; background-color: #72815D; color: #FFFFFF; font-weight: bold;}
#btnUse { font-size:1.5rem; font-family: ‘SUIT’; color: #72815D; font-weight: bold;}

@media only screen and (max-width:768px) {
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

$(window).ready(function() {
	var win = $(this);
	if (win.width() < 450) {
		$('td.hide').css('display', 'none');
		$('td.show').css('width', '100%');
		$('td').css('height', '40px');
	} else {
		$('td.hide').css('display', 'table-cell');
		$('td').css('width', '100%');
	}
});

$(window).on(
		'resize',
		function() {
			var win = $(this);
			if (win.width() < 450) {
				$('td.hide').css('display', 'none');
				$('td.show').css('width', '100%');
				$('td').css('height', '40px');
			}else if (win.width() <= 750) {
				$('td.hide').css('display', 'none');
				$('td.show').css('width', '30%');
			} else {
				$('td.hide').css('display', 'table-cell');
				$('td').css('width', '100%');
			}
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
	<h1 class="mainTitle">매출 통계</h1></div>

<div>
	<button type="button" id="btnRes" class="btn btn-lg" onclick="location.href='./dy'">
	<span class="btde">요일별</span></button>
	<button type="button" id="btnUse" class="btn btn-lg" onclick="location.href='./mo'" class="btn btn-success">
	<span class="btde">월별</span></button>
</div>

<div class="wrap">
	<h4 class="jemok">리스트</h4>
	<div id="rListArea">
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr class="line">
						<td class="show">요일</td>
						<td class="hide">정산 상품</td>
						<td class="hide">전체 상품</td>
						<td class="show">정산 금액</td>
						<td class="show">전체 금액</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleSellerDayList}" varStatus="status">
						<tr>
							<td class="show">${sale.daterange}</td>
							<td class="hide">
								<c:choose>
								<c:when test="${saleSellerDayConfirmList[status.index].count eq null}">0</c:when>
								<c:when test="${saleSellerDayConfirmList[status.index].count ne null}">${saleSellerDayConfirmList[status.index].count}</c:when>
								</c:choose></td>
							<td class="hide">${sale.count}</td>
							<td class="show"><c:choose>
								<c:when test="${saleSellerDayConfirmList[status.index].total eq null}">0원</c:when>
								<c:when test="${saleSellerDayConfirmList[status.index].total ne null}"><fmt:formatNumber value="${saleSellerDayConfirmList[status.index].total}" pattern="#,###,###"/>원</c:when>
								</c:choose></td>
							<td class="show"><fmt:formatNumber value="${sale.total}" pattern="#,###,###"/>원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div>
	<h4 class="jemok">차트</h4>
    	<canvas id="chart"></canvas>
    </div>
</div>
</section>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div>
</div>
</div>
</body>
</html>