<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 상세 - 최고 관리자</title>
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
#AdminInfoArea {flex: 1; width:80%; margin:auto; text-align: center;}
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
		#AdminInfoArea {width:90%;}
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
<div class="wrap">
	<header>
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" flush="false"></jsp:include>
	</header>
	
	<section id="AdminInfoArea">
	<% String category = request.getParameter("pcate"); %>
	<h1 class="title"> <%= category %> 매출 상세정보</h1>
	<div id="container" class="table-responsive">
	<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="line">
						<td>상품명</td>
						<td>구매확정 수</td>
						<td>총 주문수</td>
						<td>정산완료 금액</td>
						<td>총 주문가격</td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="sale" items="${saleAdminInfo}" varStatus="status">
						<tr class="line">
							<td>${sale.pname}</td>
							<td>${saleAdminConfirmInfo[status.index].count}</td>
							<td>${sale.count}</td>
							<td>${saleAdminConfirmInfo[status.index].total}</td>
							<td>${sale.total}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
	<button type="button" id="btnCan" class="btn btn-lg" onclick="location.href = document.referrer;">
	<span class="btde">목 록</span></button>
	</div>
	<div>
		<a href="#" id="topBtn">맨 위로</a>
	</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
	</footer>

</div>
</body>
</html>