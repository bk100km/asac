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

#memberUpdateButtonHidden {
	display: none;
}

#memberSearchText {
    float: right;
    width: 74%;
}
</style>
</head>

<body>

<script>
<!-- 상세정보 조회 AJAX -->
function memberInfoAction(clickedMember) {
	var mid = clickedMember.getAttribute("data-mid");
	
    $.ajax({
        type: 'POST',
        url: './cI',
        data: {mid:mid},
        success: function(member) {
            $(member).each(function(index, item) {
                $('#mid').attr('value',member.mid);
                $('#mname').attr('value',member.mname);
                $('#mname').attr('readonly',false);
                $('#mbirth').attr('value',member.mbirth);
                $('#mbirth').attr('readonly',false);
                $('#mphone').attr('value',member.mphone);
                $('#mphone').attr('readonly',false);
                $('#mmail').attr('value',member.mmail);
                $('#mmail').attr('readonly',false);
                $('#maddrz').attr('value',member.maddrz);
                $('#maddr').attr('value',member.maddr);
                $('#maddr').attr('readonly',false);
                $('#maddr').attr('onclick',"maddrSearchAction()");
                $('#maddrd').attr('value',member.maddrd);
                $('#maddrd').attr('readonly',false);
                $('#mregdate').attr('value',member.mregdate);
            });
					
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
	}
$(document).ready(function () {
$("[id='memberSearchButton']").click(function () {
	
	var memberSearchCategory = $('#memberSearchCategory option:selected').val();
    var memberSearchText = document.getElementById('memberSearchText').value;
	var memberListText = "";
    
    $.ajax({
        type: 'POST',
        url: './cS/sC/' + memberSearchCategory + 
	 		'/sT/' + memberSearchText,
   		data: {memberSearchCategory:memberSearchCategory,
    		memberSearchText:memberSearchText},
        success: function(memberList) {
        	
        	 $.each(memberList , function(i){
                  memberListText += '<tr id="memberInfoBtn" onclick="memberInfoAction(this)" data-mid="' + memberList[i].mid + 
                  					'"><td>' + memberList[i].mid + 
                  					'</td><td>' + memberList[i].mname + 
                  					'</td><td>' + memberList[i].mphone + 
                  					'</td><td>' + memberList[i].mregdate + 
                  					'</td></tr>';
             });
        	document.getElementById("memberListBody").innerHTML = memberListText;
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
});
});
</script>

<br>
	<div id="wrapper">

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-5">
					<!--좌우분할 5:7-->
					<!--일반회원 관리//-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<select id="memberSearchCategory" name="memberSearchCategory" class="btn btn-default btn-md">
											<option value="mid">아이디</option>
											<option value="mname">이름</option>
											<option value="mphone">전화번호</option>
										</select>
										<input class="form-control input-sm" id="memberSearchText" type="text"
											placeholder="검색어 입력"> <span class="input-group-btn">
											<input type="button" class="btn btn-primary btn-sm" id="memberSearchButton" value="검색">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table id="memberListTable" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>전화번호</th>
											<th>가입일</th>
										</tr>
									</thead>
									<tbody id="memberListBody">
									<c:forEach items="${memberList}" var="member">
										<tr id="memberInfoBtn" data-mid="${member.mid}" onclick="memberInfoAction(this)">
											<td>${member.mid}</td>
											<td>${member.mname}</td>
											<td>${member.mphone}</td>
											<td>${member.mregdate}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--//일반회원관리 -->
				</div>
				<div class="col-lg-7">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel panel-default">
						<div class="panel-heading">상세정보패널</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="memberInfoDetail" id= "memberInfoDetail" name="memberInfoDetail" action="./cU" method="post">

					<label for="mid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text"
							class="form-control" name = "mid" id="mid" value="${member.mid}"
							placeholder="영문 소문자와 숫자만 입력가능" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" required readonly>
					</div>
					<div class="mb-3">
						<label for="mname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "mname" id="mname" value="${member.mname}"
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required readonly>
					</div>
					<div class="mb-3">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mbirth" id="mbirth" value="${member.mbirth}"
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required readonly>
					</div>
					<label for="mphone">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"> &nbsp; (010) </i></span>
						<input type="tel"
							class="form-control"  name = "mphone" id="mphone" value="${member.mphone}"
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required readonly>
					</div>
					<div class="mb-3"></div>
					<label for="mmail">이메일 <span class="text-danger">*</span></label>
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="email"
							class="form-control" name="mmail" id="mmail" value="${member.mmail}"
							placeholder="email@example.com" maxlength="30" required readonly>
					</div>					
					<div class="mb-3"></div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="maddrz">우편번호 </label><input type="text"
								class="form-control" name = "maddrz" id="maddrz" value="${member.maddrz}"
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-3">
							<label for="maddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "maddr" id="maddr" value="${member.maddr}"
								placeholder="여기를 클릭해주세요" required readonly>
						</div>
					</div>
					<label for="maddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="maddrd" id="maddrd" value="${member.maddrd}"
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="mregdate">가입일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mregdate" id="mregdate" placeholder="가입일" value="${member.mregdate}"
							maxlength="10" required readonly>
					</div>					
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="memberUpdateButton" value="수정하기" onclick="memberUpdateOk()" title="수정하기 버튼">
						<input type="submit" class="btn btn-default btn-lg btn-block" 
						id="memberUpdateButtonHidden" value="수정하기" title="숨겨진 수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="memberDeleteButton" value="삭제" onclick="deleteOk()" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="memberInsertButton" value="회원추가" 
						onclick="location='./ci'" title="회원추가 버튼">			
						</div>						
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

	function memberUpdateOk() {
		if(!confirm('정말로 수정하시겠습니까?')){
			return false;
		} else {
			document.getElementById('memebrUpdateButtonHidden').click();
		}
	}
	
	function memberDeleteOk(){
		
		var mid = document.getElementById('mid').value;
		
		if(!confirm('삭제할 ID = ' + mid + '\n정말로 삭제하시겠습니까?')){
			return false;
		} else {
			location.replace('./cD/mid/' + mid);
		}
	}
	</script>
	<!-- 다음 주소찾기 API -->
	<script>
	function maddrSearchAction() {
    	window.onload = (function(){
	        	new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
	            		document.getElementById("maddrz").value = data.zonecode; // 우편번호 넣기
	                	document.getElementById("maddr").value = data.address; // 주소 넣기
	                	document.querySelector("input[name=maddrd]").focus(); //상세입력 포커싱
	            	}
	        	}).open();
	    	})();
	}    	
	</script>
		
</body>
</html>