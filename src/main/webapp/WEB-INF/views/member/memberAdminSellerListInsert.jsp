<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASAC 비건마켓</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.table-responsive {
    overflow-x: hidden;
}

#insertButtonHidden {
	display: none;
}
</style>
</head>

<body>

<br>
	<div id="wrapper">

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-5">
					<!--좌우분할 5:7-->
					<!--판매자회원 관리//-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-5 pt5">판매자회원관리</div>
								<div class="col-lg-7">
									<div class="input-group">
										<span class="input-group-addon">전체검색</span> <input
											class="form-control input-sm" id="btn-input" type="text"
											placeholder="검색어 입력"> <span class="input-group-btn">
											<button class="btn btn-primary btn-sm" id="btn-chat">검색</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${sellerList}" var="seller">
										<tr id="infoBtn" data-sid="${seller.sid}">
											<td>${seller.sid}</td>
											<td>${seller.sname}</td>
											<td>${seller.sphone}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--//판매자회원관리 -->
				</div>
				<div class="col-lg-7">
					<!--좌우분할 5:7-->
					<!--회원추가패널//-->
					<div class="panel panel-default">
						<div class="panel-heading">회원추가패널</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="sellerClientInsert" id= "sellerClientInsert" name="sellerClientInsert" action="./ci" method="post">

					<label for="sid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text"
							class="form-control" name = "sid" id="sid" value=""
							placeholder="영문 소문자와 숫자만 입력가능" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" required>
					</div>
					<div class="mb-3">
						<label for="sname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "sname" id="sname" value=""
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required>
					</div>
					<div class="mb-3">
						<label for="sbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sbirth" id="sbirth" value=""
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required>
					</div>
					<label for="sphone">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"> &nbsp; (010) </i></span>
						<input type="tel"
							class="form-control"  name = "sphone" id="sphone" value=""
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required>
					</div>
					<div class="mb-3"></div>
					<label for="smail">이메일 <span class="text-danger">*</span></label>
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="email"
							class="form-control" name="smail" id="smail" value=""
							placeholder="email@example.com" maxlength="30" required>
					</div>					
					<div class="mb-3"></div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="saddrz">우편번호 </label><input type="text"
								class="form-control" name = "saddrz" id="saddrz" value=""
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-3">
							<label for="saddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "saddr" id="saddr" value=""
								placeholder="여기를 클릭해주세요" required>
						</div>
					</div>
					<label for="saddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="saddrd" id="saddrd" value=""
							placeholder="상세주소를 입력해주세요." maxlength="50" required>
					</div>
					<div class="mb-3"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="insertButton" value="회원추가" onclick="insertOk()" title="회원추가 버튼">
						<input type="submit" class="btn btn-default btn-lg btn-block" 
						id="insertButtonHidden" value="회원추가" title="숨겨진 회원추가 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="backButton" value="뒤로가기" onclick="location='./li'" title="뒤로가기 버튼">
						</div>		
						<hr class="mb-4">
						<br>						
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
	
	<script>
	function insertOk() {
		if(!confirm('정말로 추가하시겠습니까?')){
			return false;
		} else {
			document.getElementById('insertButtonHidden').click();
		}
	}
	</script>
	<!-- 카카오 주소찾기 API -->
	<script>
	    window.onload = (function(){
	    document.getElementById("saddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("saddrz").value = data.zonecode; // 우편번호 넣기
	                document.getElementById("saddr").value = data.address; // 주소 넣기
	                document.querySelector("input[name=saddrd]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	})();
	</script>
		
</body>
</html>