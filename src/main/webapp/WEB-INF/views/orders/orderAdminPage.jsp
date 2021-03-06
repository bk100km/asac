<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASAC 비건마켓</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Pretend Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

<style>
.table-responsive {
    overflow-x: hidden;
}

#orderUpdateButtonHidden {
	display: none;
}

#orderSearchButtonHidden {
	display: none;
}

#searchText {
    float: right;
}

#leftPanel {
	text-align: center;
	height: 700px;
	margin-top: 20px;
}
	
#leftPanel .table-responsive {
	height: 800px;
}

#orderInfoBtn td {
	line-height: 21px;
}

th {
    text-align: center;
}

.order-panel-default {
	height: 950px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
}

.left-order-panel-default {
	height: 950px;
}

.panel-heading {
	background: #d8e3c9;
	color: #85976d;
    border-top-right-radius: 5px;
    border-top-left-radius: 5px;
    height: 38px;
    font-weight: 600;
    font-size: 1.2rem;
    font-family: Pretendard;
}

#searchCategory {
	border: none;
	color: #72815d;
    font-weight: 700;
}
}

option {
	color: black;
}

.panel-body {
	padding: 15px;
}

#orderSearchButton {
	border: none;
	color: #72815d;	
    font-size: 1.1rem;
    font-weight: 600;
}

#panel-heading-right {
	padding: 4px;
}

#page-wrapper {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 100px;
	padding-right: 100px;
}

</style>
<script>
<!-- 상세정보 조회 AJAX -->
function orderInfoAction(clickedOrder) {
	var ocode = clickedOrder.getAttribute("data-ocode");
	var pname = clickedOrder.getAttribute("data-pname");
	var odelivery = clickedOrder.getAttribute("data-odelivery");
	
    $.ajax({
        type: 'POST',
        url: './in',
        data: {ocode:ocode, pname:pname, odelivery:odelivery},
        success: function(order) {
        	if(odelivery == "배송준비중"){
            	$(order).each(function(index, item) {
                	$('#ocode').prop('value',order.ocode);
                	$('#mid').prop('value',order.mid);
                	$('#mname').prop('value',order.mname);
                	$('#pname').prop('value',order.pname);
                	$('#ocount').prop('value',order.ocount);
                	$('#ototal').prop('value',order.ototal);
                	$('#oregdate').prop('value',order.oregdate);
                	$('#oname').prop('value',order.oname);
                	$('#oname').prop('readonly',false);
                	$('#oaddrz').prop('value',order.oaddrz);
                	$('#oaddr').prop('value',order.oaddr);
                	$('#oaddr').prop('readonly',false);
                	$('#oaddr').attr('onclick',"oaddrSearchAction()");
                	$('#oaddrd').prop('value',order.oaddrd);
                	$('#oaddrd').prop('readonly',false);
                	$('#ophone').prop('value',order.ophone);
                	$('#ophone').prop('readonly',false);
                	$('#ocode1').prop('value',order.ocode);
                	$('#orderUpdateButton').attr('onclick',"orderUpdateOk()");
                	$('#orderUpdateButton').removeAttr('disabled',"disabled");
                	$('#orderDeleteButton').attr('onclick',"orderDeleteOk()");
                	$('#orderDeleteButton').removeAttr('disabled',"disabled");
            	});
            } else {
            	$(order).each(function(index, item) {
                	$('#ocode').prop('value',order.ocode);
                	$('#mid').prop('value',order.mid);
                	$('#mname').prop('value',order.mname);
                	$('#pname').prop('value',order.pname);
                	$('#ocount').prop('value',order.ocount);
                	$('#ototal').prop('value',order.ototal);
                	$('#oregdate').prop('value',order.oregdate);
                	$('#oname').prop('value',order.oname);
                	$('#oname').prop('readonly',false);
                	$('#oaddrz').prop('value',order.oaddrz);
                	$('#oaddr').prop('value',order.oaddr);
                	$('#oaddr').prop('readonly',false);
                	$('#oaddr').attr('onclick',"oaddrSearchAction()");
                	$('#oaddrd').prop('value',order.oaddrd);
                	$('#oaddrd').prop('readonly',false);
                	$('#ophone').prop('value',order.ophone);
                	$('#ophone').prop('readonly',false);
                	$('#ocode1').prop('value',order.ocode);
                    $('#orderUpdateButton').attr('onclick',"orderUpdateOk()");
                    $('#orderUpdateButton').attr('disabled',"disabled");
                    $('#orderDeleteButton').attr('onclick',"orderDeleteOk()");
                    $('#orderDeleteButton').attr('disabled',"disabled");
	    		});
            }
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}


function orderSearchAction(clikedPage) {	
	var searchCategory = $('#searchCategory option:selected').val();
    var searchText = document.getElementById('searchText').value;
	var orderListText = "";
	var orderPagingText ="";
	var page = clikedPage;
	var step = 0;
    
    $.ajax({
        type: 'POST',
        url: './ls',
   		data: {searchCategory:searchCategory,
    		searchText:searchText,
    		page:page},
        success: function(map) {
        	 $.each(map.orderList , function(i){
                  orderListText += '<tr id="orderInfoBtn" onclick="orderInfoAction(this)" data-ocode="' + map.orderList[i].ocode + '" data-pname="' + map.orderList[i].pname + '" data-odelivery="' + map.orderList[i].odelivery +
                  					'"><td>' + map.orderList[i].ocode + 
                  					'</td><td>' + map.orderList[i].mname + 
                  					'</td><td>' + map.orderList[i].pname + 
                  					'</td><td>' + map.orderList[i].ocount +
                  					'</td><td>' + map.orderList[i].odelivery +
                  					'</td></tr>';
			});
        	 
        	 if (map.paging.prev) {
	    		 pagingText +=
			 	'<li class="page-item"><a class="page-link" href="#" onclick="orderSearchAction(1)">이전</a></li>'; 
    		 }
    		 for (step = map.paging.startPage; step < map.paging.endPage + 1; step++) {
    		 	orderPagingText +=
    		 	'<li class="page-item" id="orderPage' + step + '" value="' + step + '"><a class="page-link" href="#" onclick="orderSearchAction(' + step + ')">' + step + '</a></li>';
    	     }
    		 if (map.paging.next) {
    		 	orderPagingText +=
    		 	'<li class="page-item"><a class="page-link" href="#" onclick="orderSearchAction(' + map.paging.endPage + ')">다음</a></li>';
        	 }
    		document.getElementById("orderListBody").innerHTML = orderListText;
        	document.getElementById("orderPagingZone").innerHTML = orderPagingText;
        	[].forEach.call(document.getElementById("orderPage" + page), function(element) {
        	    element.classList.remove("active");
        	    element.classList.remove("orderActivePage");
        	});
        	document.getElementById("orderPage" + page).classList.add("active");
        	document.getElementById("orderPage" + page).classList.add("orderActivePage");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function orderUpdateAction() {	
	var ocode = document.getElementById('ocode').value;
	var order = $("form[name=orderUpdate]").serialize();
    
    $.ajax({
        type: 'POST',
        url: './up',
   		data: order,
        success: function() {
			orderSearchAction();
        	alert("수정된 주문 = " + ocode + "\n배송 정보 수정이 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function orderDeleteAction() {	
	var ocode = document.getElementById('ocode').value;
    
    $.ajax({
        type: 'POST',
        url: './de/ocode/' + ocode,
   		data: {ocode:ocode},
        success: function() {
        	orderSearchAction();
        	alert("취소된 주문 = " + ocode + "\n주문이 취소 되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}
</script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
<header>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
</header>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
        	<!-- Topbar -->
        	<jsp:include page="/WEB-INF/views/common/toolbarHeader.jsp" />
        	
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-6">
					<!--좌우분할-->
					<!--일반회원 관리//-->
					<div class="panel order-panel-default left-order-panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<select id="searchCategory" name="searchCategory" class="btn btn-default btn-md">
											<option value="pname">상품명</option>
											<option value="oname">주문자명</option>
											<option value="mid">주문자아이디</option>
										</select>
										<input class="form-control input-sm" id="searchText" type="text"
											placeholder="검색어 입력"> <span class="input-group-btn">
											<input type="button" class="btn btn-default btn-md" id="orderSearchButton" value="검색" onclick="orderSearchAction(1)">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body" id="leftPanel">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>주문자명</th>
											<th>상품명</th>
											<th>수량</th>
											<th>배송상태</th>
										</tr>
									</thead>
									<tbody id="orderListBody">
									<c:forEach items="${orderAdminList}" var="order">
										<tr id="orderInfoBtn" data-ocode="${order.ocode}" data-pname="${order.pname}" data-odelivery="${order.odelivery}" onclick="orderInfoAction(this)">
											<td>${order.ocode}</td>
											<td>${order.mname}</td>
											<td>${order.pname}</td>
											<td>${order.ocount}</td>
											<td>${order.odelivery}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<ul class="pagination justify-content-center" id="orderPagingZone">
								<c:if test= "${orderPaging.prev}">
									<li class="page-item"><a class="page-link" href="#" onclick="orderSearchAction(1)">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${orderPaging.startPage}" end="${orderPaging.endPage}">
									<c:if test="${orderPaging.page eq page}">
									<li class="page-item active orderActivePage" id="orderPage${page}" value="${page}"><a class="page-link" href="#" onclick="orderSearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${orderPaging.page ne page}">
									<li class="page-item" id="orderPage${page}" value="${page}"><a class="page-link" href="#" onclick="orderSearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${orderPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="orderSearchAction(${orderPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//일반회원관리 -->
				</div>
				<div class="col-lg-6">
					<!--좌우분할-->
					<!--상세정보패널//-->
					<div class="panel order-panel-default">
						<div class="panel-heading" id="panel-heading-right">&nbsp;주문 상세 정보</div>
						<div class="panel-body">
							<div class="table-responsive" id="orderFormTable">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
					<div class="mb1" id="orderIdZone">
					<label for="ocode">주문번호</label>
					<div class="input-group input-group-sm mb-1">
						<input type="text" class="form-control" name="ocode1" id="ocode1" value="${order.ocode}" placeholder="주문번호" readonly>
					</div>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="mid">고객 ID <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="mid" id="mid" value="${order.mid}" placeholder="고객 ID" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="mname">고객 이름 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="mname" id="mname" value="${order.mname}" placeholder="고객 이름" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="pname">상품명 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="pname" id="pname" value="${order.pname}" placeholder="상품명" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="ocount">수량 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="ocount" id="ocount" value="${order.ocount}" placeholder="수량" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="ototal">총 가격 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="ototal" id="ototal" value="${order.ototal}" placeholder="수량" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="oregdate">주문날짜<span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="oregdate" id="oregdate" value="${order.oregdate}"	placeholder="수량" required readonly>
					</div>
					
					
					<form class="orderUpdate" id="orderUpdate" name="orderUpdate" method="post">
					<div class="mb-1 input-group-sm">
						<label for="oname">받는 사람 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="oname" id="oname" value="${order.oname}" placeholder="받는 사람" required readonly>
					</div>
					
					<div class="row">
						<div class="col-md-4 mb-1 input-group-sm">
							<label for="saddrz">우편번호 </label><input type="text"
								class="form-control" name = "oaddrz" id="oaddrz" value=""
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-1 input-group-sm">
							<label for="saddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "oaddr" id="oaddr" value=""
								placeholder="여기를 클릭해주세요" required>
						</div>
					</div>
					<label for="saddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
					<span class="input-group-text"><i class="fa solid fa-house-chimney"></i></span>
					</div>		
					<input type="text" class="form-control" name="oaddrd" id="oaddrd" value=""
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					
					<div class="mb-1 input-group-sm">
						<label for="scompany">연락처<span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
						<input type="text" class="form-control" name="ophone" id="ophone" value="${order.ophone}"
							placeholder="전화번호 입력" required readonly>
						<input type="hidden" class="form-control" name="ocode" id="ocode" value="${order.ocode}"
							placeholder="주문번호" required readonly>
					</div>
					</div>
				</form>		
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row" id="orderButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" id="orderUpdateButton" value="주문 수정" title="주문 수정 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" id="orderDeleteButton" value="주문 취소" title="주문 취소 버튼">
						</div>			
					</div>
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	</div>
	
	<script>
	function orderUpdateOk() {
		if(!confirm('정말로 수정하시겠습니까?')){
			return false;
		} else {
			orderUpdateAction();
		}
	}
	
	function orderDeleteOk(){
		
		var ocode = document.getElementById('ocode').value;
		
		if(!confirm('취소한 주문번호  = ' + ocode + '\n정말로 취소하시겠습니까?')){
			return false;
		} else {
			orderDeleteAction();
		}
	}
    
	</script>
	
	<!-- 다음 주소찾기 API -->
	<script>
	function oaddrSearchAction() {
    	window.onload = (function(){
	        	new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
	            		document.getElementById("oaddrz").value = data.zonecode; // 우편번호 넣기
	                	document.getElementById("oaddr").value = data.address; // 주소 넣기
	                	document.querySelector("input[name=oaddrd]").value = "";
	                	document.querySelector("input[name=oaddrd]").focus(); //상세입력 포커싱
	            	}
	        	}).open();
	    	})();
	}    	
	</script>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>		
</body>
</html>