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

#sellerUpdateButtonHidden {
	display: none;
}

#sellerSearchButtonHidden {
	display: none;
}

#sellerInsertButtonHidden {
	display: none;
}

#sellerSearchText {
    float: right;
    width: 79%;
}
</style>
</head>

<body>

<script>
<!-- 상세정보 조회 AJAX -->
function sellerInfoAction(clickedSeller) {
	var sid = clickedSeller.getAttribute("data-sid");
	
    $.ajax({
        type: 'POST',
        url: './sI',
        data: {sid:sid},
        success: function(seller) {
            $(seller).each(function(index, item) {
                $('#sid').attr('value',seller.sid);
                $('#sname').attr('value',seller.sname);
                $('#sname').attr('readonly',false);
                $('#sbirth').attr('value',seller.sbirth);
                $('#sbirth').attr('readonly',false);
                $('#sphone').attr('value',seller.sphone);
                $('#sphone').attr('readonly',false);
                $('#smail').attr('value',seller.smail);
                $('#smail').attr('readonly',false);
                $('#saddrz').attr('value',seller.saddrz);
                $('#saddr').attr('value',seller.saddr);
                $('#saddr').attr('readonly',false);
                $('#saddr').attr('onclick',"saddrSearchAction()");
                $('#saddrd').attr('value',seller.saddrd);
                $('#saddrd').attr('readonly',false);
                $('#scompany').attr('value',seller.scompany);
                $('#scompany').attr('readonly',false);
                $('#snumber').attr('value',seller.snumber);
                $('#snumber').attr('readonly',false);
                $('#sfile').attr('value',seller.sfile);
                $('#sregdate').attr('value',seller.sregdate);
                $('#sellerUpdateButton').attr('onclick',"sellerUpdateOk()");
                $('#sellerDeleteButton').attr('onclick',"sellerDeleteOk()");
            });
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function sellerSearchAction() {	
	var sellerSearchCategory = $('#sellerSearchCategory option:selected').val();
    var sellerSearchText = document.getElementById('sellerSearchText').value;
	var sellerListText = "";
    $.ajax({
        type: 'POST',
        url: './sS/sC/' + sellerSearchCategory,
   		data: {sellerSearchCategory:sellerSearchCategory,
    		sellerSearchText:sellerSearchText},
        success: function(sellerList) {
        	 $.each(sellerList , function(i){
        		  if (sellerList[i].sok == 'Y') {
                  sellerListText += '<tr id="sellerInfoBtn" data-sid="' + sellerList[i].sid + '" onclick="sellerInfoAction(this)"><td>' + sellerList[i].sid + 
                  					'</td><td>' + sellerList[i].sname + 
                  					'</td><td>' + sellerList[i].sphone + 
                  					'</td><td>' + sellerList[i].sregdate + 
                  					'</td><td><label id="' + sellerList[i].sid + 'sokText">' + sellerList[i].sok + '</label>' +
                  					'<input type="checkbox" id="sokCheckBox" onclick="sokCheckAction(this)" data-sid="' + sellerList[i].sid +
                  					'" data-sok="' + sellerList[i].sok + '"' + 'checked />' +
                  					'</td></tr>';
       		    } else {
       		    	sellerListText += '<tr id="sellerInfoBtn" data-sid="' + sellerList[i].sid + '" onclick="sellerInfoAction(this)"><td>' + sellerList[i].sid + 
  					'</td><td>' + sellerList[i].sname + 
  					'</td><td>' + sellerList[i].sphone + 
  					'</td><td>' + sellerList[i].sregdate + 
  					'</td><td><label id="' + sellerList[i].sid + 'sokText">' + sellerList[i].sok + '</label>' +
  					'<input type="checkbox" id="sokCheckBox" onclick="sokCheckAction(this)" data-sid="' + sellerList[i].sid +
  					'" data-sok="' + sellerList[i].sok + '"' + ' />' +
  					'</td></tr>';        			  
        			  
        		  }			
             });
        	document.getElementById("sellerListBody").innerHTML = sellerListText;
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function sellerInsertForm() {
	var sellerInsertFormText = '';
	var today = new Date();
    $.ajax({
        success: function() {
        	
        	$('#sid').attr('value',"");
            $('#sid').attr('readonly',false);
            $('#sname').attr('value',"");
            $('#sname').attr('readonly',false);
            $('#sbirth').attr('value',"");
            $('#sbirth').attr('readonly',false);
            $('#sphone').attr('value',"");
            $('#sphone').attr('readonly',false);
            $('#smail').attr('value',"");
            $('#smail').attr('readonly',false);
            $('#saddrz').attr('value',"");
            $('#saddrz').attr('readonly',false);
            $('#saddr').attr('value',"");
            $('#saddr').attr('readonly',false);
            $('#saddrd').attr('value',"");
            $('#saddrd').attr('readonly',false);
            $('#scompany').attr('value',"");
            $('#scompany').attr('readonly',false);
            $('#snumber').attr('value',"");
            $('#snumber').attr('readonly',false);
            $('#sfile').attr('value',"");
            $('#sfile').attr('readonly',false);
            $('#sregdate').attr('value', today.toLocaleDateString());
        	 
        	sellerInsertFormText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="insertButton" value="회원추가" onclick="insertOk()" title="회원추가 버튼">' +
			'<input type="submit" class="btn btn-default btn-lg btn-block"' + 
			'id="sellerInsertButtonHidden" value="회원추가" title="숨겨진 회원추가 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="backButton" value="뒤로가기" onclick="selerInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			document.getElementById("buttonZone").innerHTML = sellerInsertFormText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function sellerInsertCancel() {
    $.ajax({
        success: function() {
        	
        	$('#sid').attr('value',"");
            $('#sid').attr('readonly',true);
            $('#sname').attr('value',"");
            $('#sname').attr('readonly',true);
            $('#sbirth').attr('value',"");
            $('#sbirth').attr('readonly',true);
            $('#sphone').attr('value',"");
            $('#sphone').attr('readonly',true);
            $('#smail').attr('value',"");
            $('#smail').attr('readonly',true);
            $('#saddrz').attr('value',"");
            $('#saddrz').attr('readonly',true);
            $('#saddr').attr('value',"");
            $('#saddr').attr('readonly',true);
            $('#saddrd').attr('value',"");
            $('#saddrd').attr('readonly',true);
            $('#scompany').attr('value',"");
            $('#scompany').attr('readonly',true);
            $('#snumber').attr('value',"");
            $('#snumber').attr('readonly',true);
            $('#sfile').attr('value',"");
            $('#sfile').attr('readonly',true);
            $('#sregdate').attr('value', "");
        	 
        	sellerInsertFormText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="insertButton" value="회원추가" onclick="insertOk()" title="회원추가 버튼">' +
			'<input type="submit" class="btn btn-default btn-lg btn-block"' + 
			'id="sellerInsertButtonHidden" value="회원추가" title="숨겨진 회원추가 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-lg btn-block"' + 
			'id="backButton" value="뒤로가기" onclick="" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			document.getElementById("buttonZone").innerHTML = sellerInsertFormText;
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
										<select id="sellerSearchCategory" name="sellerSearchCategory" class="btn btn-default btn-md">
											<option value="sid">아이디</option>
											<option value="sname">이름</option>
											<option value="sphone">전화번호</option>
										</select>
										<input class="form-control input-sm" id="sellerSearchText" type="text"
											placeholder="검색어 입력"> <span class="input-group-btn">
											<input type="button" class="btn btn-primary btn-sm" id="sellerSearchButton" value="검색" onclick="sellerSearchAction()">
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
											<th>가입일</th>
											<th>가입승인</th>
										</tr>
									</thead>
									<tbody id="sellerListBody">
									<c:forEach items="${sellerList}" var="seller">
										<tr id="sellerInfoBtn" data-sid="${seller.sid}" onclick="sellerInfoAction(this)">
											<td>${seller.sid}</td>
											<td>${seller.sname}</td>
											<td>${seller.sphone}</td>
											<td>${seller.sregdate}</td>
											<td><label id="${seller.sid}sokText">${seller.sok}</label>
												<input type="checkbox" id="sokCheckBox" onclick="sokCheckAction(this)" data-sid="${seller.sid}" data-sok="${seller.sok}" <c:if test="${seller.sok eq 'Y'}">checked</c:if> />
											</td>
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
						<div class="panel-heading">상세정보패널</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="sellerInfoDetail" id= "sellerInfoDetail" name="sellerInfoDetail" action="./cU" method="post">

					<label for="sid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text"
							class="form-control" name = "sid" id="sid" value="${seller.sid}"
							placeholder="영문 소문자와 숫자만 입력가능" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" required readonly>
					</div>
					<div class="mb-3">
						<label for="sname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "sname" id="sname" value="${seller.sname}"
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required readonly>
					</div>
					<div class="mb-3">
						<label for="sbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sbirth" id="sbirth" value="${seller.sbirth}"
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required readonly>
					</div>
					<label for="sphone">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"> &nbsp; (010) </i></span>
						<input type="tel"
							class="form-control"  name = "sphone" id="sphone" value="${seller.sphone}"
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required readonly>
					</div>
					<div class="mb-3"></div>
					<label for="smail">이메일 <span class="text-danger">*</span></label>
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="email"
							class="form-control" name="mmail" id="smail" value="${seller.smail}"
							placeholder="email@example.com" maxlength="30" required readonly>
					</div>					
					<div class="mb-3"></div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="saddrz">우편번호 </label><input type="text"
								class="form-control" name = "saddrz" id="saddrz" value="${seller.saddrz}"
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-3">
							<label for="saddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "saddr" id="saddr" value="${seller.saddr}"
								placeholder="여기를 클릭해주세요" required readonly>
						</div>
					</div>
					<label for="saddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="saddrd" id="saddrd" value="${seller.saddrd}"
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="scompany">회사명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "scompany" id="scompany" placeholder="ASAC비건마켓" value="${seller.scompany}"
							maxlength="10" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="snumber">사업자등록번호 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "snumber" id="snumber" placeholder="00-0000-00" value="${seller.snumber}"
							maxlength="10" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sfile" id="sfile" placeholder=".png, .jpg" value="${seller.sfile}"
							maxlength="10" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="sregdate">가입일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sregdate" id="sregdate" placeholder="20220322" value="${seller.sregdate}"
							maxlength="10" required readonly>
					</div>					
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row" id="buttonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="sellerUpdateButton" value="수정하기" title="수정하기 버튼">
						<input type="submit" class="btn btn-default btn-lg btn-block" 
						id="sellerUpdateButtonHidden" value="수정하기" title="숨겨진 수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="sellerDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="sellerInsertButton" value="회원추가" 
						onclick="sellerInsertForm()" title="회원추가 버튼">
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
	
	function sokCheckAction(checkedSeller) {
		if(checkedSeller.getAttribute("data-sok") != 'Y') {
			if(!confirm('정말로 승인하시겠습니까?')){
				return false;
			} else {
				var sid = checkedSeller.getAttribute("data-sid");
			    $.ajax({
			        type: 'POST',
			        url: './sC',
			        data: {sid:sid, sok:'Y'},
			        success: function() {
			        	checkedSeller.setAttribute('data-sok', 'Y');
			        	document.getElementById(checkedSeller.getAttribute("data-sid") + "sokText").innerText = "Y";
			        	alert(checkedSeller.getAttribute("data-sid") + " 계정의 가입승인이 완료되었습니다.");
			        },
			        error: function(request, status, error) {
			            console.log("code:" + request.status + 
			            		"\n"+"message:" + request.responseText + 
			            		"\n"+"error:"+error);
			        }
			    });
			}
		} else {
			if(!confirm('정말로 취소하시겠습니까?')){
				return false;
			} else {
				var sid = checkedSeller.getAttribute("data-sid");
			    $.ajax({
			        type: 'POST',
			        url: './sC',
			        data: {sid:sid, sok:'N'},
			        success: function(seller) {
			        	checkedSeller.setAttribute('data-sok', 'N');
			        	document.getElementById(checkedSeller.getAttribute("data-sid") + "sokText").innerText = "N";
			        	alert(checkedSeller.getAttribute("data-sid") + " 계정의 가입승인이 취소되었습니다.");
			        },
			        error: function(request, status, error) {
			            console.log("code:" + request.status + 
			            		"\n"+"message:" + request.responseText + 
			            		"\n"+"error:"+error);
			        }
			    });
			}
		}		
	}
	
	function sellerUpdateOk() {
		if(!confirm('정말로 수정하시겠습니까?')){
			return false;
		} else {
			document.getElementById('sellerUpdateButtonHidden').click();
		}
	}
	
	function sellerDeleteOk(){
		
		var sid = document.getElementById('sid').value;
		
		if(!confirm('삭제할 ID = ' + sid + '\n정말로 삭제하시겠습니까?')){
			return false;
		} else {
			location.replace('./sD/sid/' + sid);
		}
	}
	</script>
	
	<!-- 카카오 주소찾기 API -->
	<script>
	function saddrSearchAction() {
	    window.onload = (function() {
	        	new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
	            		document.getElementById("saddrz").value = data.zonecode; // 우편번호 넣기
	                	document.getElementById("saddr").value = data.address; // 주소 넣기
	                	document.querySelector("input[name=saddrd]").focus(); //상세입력 포커싱
	            	}
	        	}).open();
		})();
    }
	</script>
		
</body>
</html>