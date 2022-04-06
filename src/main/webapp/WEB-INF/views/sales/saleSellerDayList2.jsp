<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASAC 비건마켓</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<style>
.table-responsive {
    overflow-x: hidden;
}

#memberUpdateButtonHidden {
	display: none;
}

#memberInsertButtonHidden {
	display: none;
}

#memberSearchText {
    float: right;
    width: 74%;
}

.mgenderLabel input[type="radio"] {
    display: none;
}
 
.mgenderLabel input[type="radio"] + span {
	border-radius: 5px;
	width: 97px;
    height: 35px;
    display: inline-block;
    padding: 7px 10px;
    border: 1px solid #dfdfdf;
    background-color: #ffffff;
    text-align: center;
    cursor: pointer;
}
 
.mgenderLabel input[type="radio"]:checked + span {
    background-color: #113a6b;
    color: #ffffff;
}

#memberIdCheckLabel {
	margin-top:14px;
}
</style>
</head>

<body>

<script>

function memberInsertForm() {
	var memberInsertFormButtonZoneText = '';
	var memberInsertFormIdZoneText = '';
    $.ajax({
        success: function() {
        	
        	$('#memberInfoDetail').prop('action',"memberInsertAction()");
        	$('#mid').prop('value',"");
            $('#mid').prop('readonly',false);
            $('#mname').prop('value',"");
            $('#mname').prop('readonly',false);
            $('#mbirth').prop('value',"");
            $('#mbirth').prop('readonly',false);
            $('#mgenderMale').prop('checked',false);
            $('#mgenderFemale').prop('checked',false);
            $('#mgenderMale').prop('disabled',false);
            $('#mgenderMale').prop('disabled',false);
            $('#mphone').prop('value',"");
            $('#mphone').prop('readonly',false);
            $('#mmail').prop('value',"");
            $('#mmail').prop('readonly',false);
            $('#maddrz').prop('value',"");
            $('#maddrz').prop('readonly',true);
            $('#maddr').prop('value',"");
            $('#maddr').prop('readonly',false);
            $('#maddr').prop('onclick',"maddrSearchAction()");
            $('#maddrd').prop('value',"");
            $('#maddrd').prop('readonly',false);
            $('#mregdate').prop('value', today.toLocaleDateString());
        	
        	memberInsertFormButtonZoneText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="memberInsertButton" value="추가하기" onclick="memberInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="memberInsertBackButton" value="뒤로가기" onclick="memberInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			memberInsertFormIdZoneText = '<div class="row">' + 
			'<div class="col-md-9 mb-3">' +
			'<label for="mid">아이디  <span class="text-danger">*</span></label>' +
			'<div class="input-group">' +
			'<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>' +
			'<input type="text"' +
			'class="form-control" name = "mid" id="mid"' + 
			'placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$"' + 
			'minlength="5" maxlength="20" onchange="memberIdChange()" required autofocus>' +
			'</div>' +
			'</div>' +
			'<div class="col-md-3 mb-3">' +
			'<label for="memberIdCheckButton" id="memberIdCheckLabel"></label>' +
			'<input type="button" class="form-control" name = "memberIdCheckButton" id="memberIdCheckButton" value="중복확인" onclick="memberIdCheckAction()">' +			
			'<input type="hidden" id="memberIdCheck" name="memberIdCheck" value="N">' +
			'</div>' +
			'</div>';			
				
			document.getElementById("memberButtonZone").innerHTML = memberInsertFormButtonZoneText;
			document.getElementById("memberIdZone").innerHTML = memberInsertFormIdZoneText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function memberInsertCancel() {
	var memberInsertCancelText = '';
	var memberInsertFormIdZoneText = '';
    $.ajax({
        success: function() {
        	
        	$('#memberInfoDetail').prop('action',"./cU");
        	$('#mid').prop('value',"");
            $('#mid').prop('readonly',true);
            $('#mname').prop('value',"");
            $('#mname').prop('readonly',true);
            $('#mbirth').prop('value',"");
            $('#mbirth').prop('readonly',true);
            $('#mgenderMale').prop('checked',false);
            $('#mgenderFemale').prop('checked',false);
            $('#mgenderMale').prop('disabled',true);
            $('#mgenderMale').prop('disabled',true);
            $('#mphone').prop('value',"");
            $('#mphone').prop('readonly',true);
            $('#mmail').prop('value',"");
            $('#mmail').prop('readonly',true);
            $('#maddrz').prop('value',"");
            $('#maddrz').prop('readonly',true);
            $('#maddr').prop('value',"");
            $('#maddr').prop('readonly',true);
            $('#maddr').prop('onclick',"");
            $('#maddrd').prop('value',"");
            $('#maddrd').prop('readonly',true);
            $('#mregdate').prop('value', "");
        	 
        	memberInsertCancelText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="memberUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="memberDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-12 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="memberInsertButton" value="회원추가"' + 
			'onclick="memberInsertForm()" title="회원추가 버튼">';
			memberInsertFormIdZoneText = '<label for="mid">아이디 <span class="text-danger">*</span></label>' + 
			'<div class="input-group">' +
			'<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>' +
			'<input type="text"' +
			'class="form-control" name = "mid" id="mid" value="${member.mid}"' +
			'placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$"' + 
			'minlength="5" maxlength="20" required readonly>' +
			'</div>';
			 document.getElementById("memberButtonZone").innerHTML = memberInsertCancelText;
			 document.getElementById("memberIdZone").innerHTML = memberInsertFormIdZoneText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}
</script>

<br>
	<div id="wrapper">

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--일반회원 관리//-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<div>리스트</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="table-responsive" >
								<table id="memberListTable" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>요일</th>
											<th>구매완료 수</th>
											<th>총 주문 수</th>
											<th>구매완료 금액</th>
											<th>총 주문 금액</th>
										</tr>
									</thead>
									<tbody id="memberListBody">
									<c:forEach var="sale" items="${saleSellerDayList}" varStatus="status">
										<tr id="memberInfoBtn" data-mid="${sale.sid}" onclick="memberInfoAction(this)">
											<td>${sale.daterange}</td>
											<td><c:choose>
													<c:when test="${saleSellerDayConfirmList[status.index].count eq null}">0</c:when>
													<c:when test="${saleSellerDayConfirmList[status.index].count ne null}">${saleSellerDayConfirmList[status.index].count}</c:when>
												</c:choose></td>
											<td>${sale.count}</td>
											<td><c:choose>
												<c:when test="${saleSellerDayConfirmList[status.index].total eq null}">0원</c:when>
												<c:when test="${saleSellerDayConfirmList[status.index].total ne null}"><fmt:formatNumber value="${saleSellerDayConfirmList[status.index].total}" pattern="#,###"/>원</c:when>
												</c:choose></td>
											<td><fmt:formatNumber value="${sale.total}" pattern="#,###"/>원</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--//일반회원관리 -->
				</div>
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<div class="col-md-4 mb-3">
											<input type="button" class="btn btn-default btn-lg btn-block" id="memberUpdateButton" value="일별 매출" onclick="memberInsertForm()" title="일별">
										</div>
										<div class="col-md-4 mb-3">
											<input type="button" class="btn btn-default btn-lg btn-block" id="memberDeleteButton" value="월별 매출" onclick="memberInsertForm()" title="월별">
										</div>
										<div class="col-md-4 mb-3">
											<input type="button" class="btn btn-default btn-lg btn-block" id="memberInsertButton" value="상품별 매출" onclick="memberInsertForm()" title="상품별">			
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="memberInfoDetail" id= "memberInfoDetail" name="memberInfoDetail" method="post">
					<div class="mb3" id="memberIdZone">
					</div>	
				</form>
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
</body>
</html>