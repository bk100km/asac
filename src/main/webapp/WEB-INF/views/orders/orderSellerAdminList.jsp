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
<title>주문 내역 - 중간 관리자</title>
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
#listForm {flex: 1; margin:auto; text-align: center;}
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
	<div class="wrap">
		<section id="listForm">
			<h1 class="jemok">주문 내역</h1>
		<form name="search">
			<div class="searchBox">
			<div class="search1">
				<select class="searchSelect" name="searchField">
					<option value="pname">상품명</option>
					<option value="oname">주문자명</option>
					<option value="mid">주문자아이디</option>
				</select>
			</div>
			<div class="search1"><input type="text" class="searchText"	placeholder="상품명을 입력하세요" name="searchText" size=100 maxlength="100"></div>
			<div class="search1"><button type="submit" id="btnSearch" class="btn">검색</button></div>
			</div></form>
	
		<div id="rListArea">
		<div class="table-responsive">
			<table class="table">
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
						<td>주 문 일</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="order" items="${orderSellerList}">
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
							<td>${order.oregdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pageList">
				<ul class="pagination pagination-lg justify-content-center">
					<c:if test="${pageInfo.getStartPage() > 10}">
						<li class="page-item"><a class="page-link tdetail pagenumber"
							href="reserveList.gt?pageNo=${pageInfo.getStartPage() - 10 }">이전</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${pageInfo.getStartPage()}"
						end="${pageInfo.getEndPage()}">
						<c:set var="pageNo" value="${param.pageNo}" />
						<li class='page-item'><a
							class="page-link tdetail pagenumber <c:if test="${ pNo == nowPage }">checked</c:if>"
							href="reserveList.gt?pageNo=${pNo}">${pNo}</a></li>
					</c:forEach>
					<c:if test="${pageInfo.getEndPage() < pageInfo.getMaxPage()}">
						<li class="page-item"><a class="page-link tdetail pagenumber"
							href="reserveList.gt?pageNo=${pageInfo.getStartPage() + 10}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div>
			<a href="#" id="topBtn">맨 위로</a>
		</div>
	</div>
	<div id="pageArea"></div>
	</section>
</div></body>
</html>