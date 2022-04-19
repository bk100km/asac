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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
}

.mgenderLabel input[type="radio"] {
    display: none;
}
 
.mgenderLabel input[type="radio"] + span {
	border-radius: 5px;
	width: 89px;
    height: 33px;
    display: inline-block;
    padding: 4px 10px;
    border: 1px solid #dfdfdf;
    background-color: #ffffff;
    text-align: center;
    cursor: pointer;
}
 
.mgenderLabel input[type="radio"]:checked + span {
    background-color: #a8c383;
    color: #ffffff;
}

#memberIdCheckLabel {
	margin-top:14px;
}

#leftPanel {
	text-align: center;
	height: 700px;
	margin-top: 20px;
}

#leftPanel .table-responsive {
	height: 620px;
}

#memberInfoBtn td {
	line-height: 28px;
}

th {
    text-align: center;
}

.panel-default {
	height: 760px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
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

#memberSearchCategory {
	border: none;
	color: #72815d;
    font-weight: 700;
}

option {
	color: black;
}

.panel-body {
	padding: 15px;
}

#memberSearchButton {
	border: none;
	color: #72815d;	
    font-size: 1.1rem;
    font-weight: 600;
}

#panel-heading-right {
	padding: 4px;
}

#memberIdCheckButton {
	height: 34px;
}

#page-wrapper {
	padding-left: 100px;
	padding-right: 100px;
}

</style>
</head>

<body id="page-top">

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
                $('#mid').prop('value',member.mid);
                $('#mname').prop('value',member.mname);
                $('#mname').prop('readonly',false);
                $('#mbirth').prop('value',(member.mbirth).substring(0,8));
                $('#mbirth').prop('readonly',false);
                if ((member.mbirth).substring(8) == "1") {
                    $('#mgenderMale').prop('disabled',false);
                    $('#mgenderFemale').prop('disabled',false);
                    $('#mgenderFemale').prop('checked',false);
                    $('#mgenderMale').prop('checked',true);
                } else {
                    $('#mgenderMale').prop('disabled',false);
                    $('#mgenderFemale').prop('disabled',false);
                    $('#mgenderMale').prop('checked',false);
                    $('#mgenderFemale').prop('checked',true);
                    }
                $('#mphone').prop('value',(member.mphone).substring(3));
                $('#mphone').prop('readonly',false);
                $('#mmail').prop('value',member.mmail);
                $('#mmail').prop('readonly',false);
                $('#maddrz').prop('value',member.maddrz);
                $('#maddr').prop('value',member.maddr);
                $('#maddr').prop('readonly',false);
                $('#maddr').attr('onclick',"maddrSearchAction()");
                $('#maddrd').prop('value',member.maddrd);
                $('#maddrd').prop('readonly',false);
                $('#mregdate').prop('value',member.mregdate);
                $('#memberUpdateButton').attr('onclick',"memberUpdateOk()");
                $('#memberDeleteButton').attr('onclick',"memberDeleteOk()");
            });
					
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}


function memberSearchAction(clikedPage) {	
	var memberSearchCategory = $('#memberSearchCategory option:selected').val();
    var memberSearchText = document.getElementById('memberSearchText').value;
	var memberListText = "";
	var memberPagingText = "";
	var page = clikedPage;
// 	var range = 1;
// 	if (clikedPage % 5 == 0) {
// 		range = 
// 	}
// 	var range = parseInt(clikedPage / 5) + 1;
	var step = 0;
    
    $.ajax({
        type: 'POST',
        url: './cS',
   		data: {memberSearchCategory:memberSearchCategory,
    		memberSearchText:memberSearchText,
    		page:page},
        success: function(map) {
        	 $.each(map.memberList , function(i){
                  memberListText += '<tr id="memberInfoBtn" onclick="memberInfoAction(this)" data-mid="' + map.memberList[i].mid + 
                  					'"><td>' + map.memberList[i].mid + 
                  					'</td><td>' + map.memberList[i].mname + 
                  					'</td><td>' + map.memberList[i].mphone + 
                  					'</td><td>' + map.memberList[i].mregdate + 
                  					'</td></tr>';
             });
        	 
   		     if (map.paging.prev) {
	    		 pagingText +=
			 	'<li class="page-item"><a class="page-link" href="#" onclick="memberSearchAction(1)">이전</a></li>'; 
    		 }
    		 for (step = map.paging.startPage; step < map.paging.endPage + 1; step++) {
    		 	memberPagingText +=
    		 	'<li class="page-item" id="memberPage' + step + '" value="' + step + '"><a class="page-link" href="#" onclick="memberSearchAction(' + step + ')">' + step + '</a></li>';
    	     }
    		 if (map.paging.next) {
    		 	memberPagingText +=
    		 	'<li class="page-item"><a class="page-link" href="#" onclick="memberSearchAction(' + map.paging.endPage + ')">다음</a></li>';
        	 }
        	document.getElementById("memberListBody").innerHTML = memberListText;
        	document.getElementById("memberPagingZone").innerHTML = memberPagingText;
        	[].forEach.call(document.getElementById("memberPage" + page), function(element) {
        	    element.classList.remove("active");
        	    element.classList.remove("memberActivePage");
        	});
        	document.getElementById("memberPage" + page).classList.add("active");
        	document.getElementById("memberPage" + page).classList.add("memberActivePage");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function memberInsertForm() {
	var memberInsertFormButtonZoneText = '';
	var memberInsertFormIdZoneText = '';
	var today = new Date();
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
            $('#maddr').attr('onclick',"maddrSearchAction()");
            $('#maddrd').prop('value',"");
            $('#maddrd').prop('readonly',false);
            $('#mregdate').prop('value', today.toLocaleDateString());
        	
        	memberInsertFormButtonZoneText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="memberInsertButton" value="추가하기" onclick="memberInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="memberInsertBackButton" value="뒤로가기" onclick="memberInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			memberInsertFormIdZoneText = '<div class="row">' +
			'<div class="col-md-9 input-group-sm">' +
			'<label for="mid">아이디  <span class="text-danger">*</span></label>' +
			'<input type="text"' +
			'class="form-control" name = "mid" id="mid"' + 
			'placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$"' + 
			'minlength="5" maxlength="20" onchange="memberIdChange()" required autofocus>' +
			'</div>' +
			'<div class="col-md-3 mb-1">' +
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
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="memberUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="memberDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-12 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="memberInsertButton" value="회원추가"' + 
			'onclick="memberInsertForm()" title="회원추가 버튼">';
			memberInsertFormIdZoneText = '<label for="mid">아이디 <span class="text-danger">*</span></label>' + 
			'<div class="input-group-sm mb-1">' +
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

function memberInsertAction() {	
	if ($('#mgenderMale').is(":checked") == true) {
		$('#mbirth').val($('#mbirth').val() + "1");
	} else {
		$('#mbirth').val($('#mbirth').val() + "2");	
	}
	$('#mphone').val("010" + $('#mphone').val());
	
	var mid = document.getElementById('mid').value;
	var member = $("form[name=memberInfoDetail]").serialize();
	
	$('#mbirth').val($('#mbirth').val().substring(0,8));
	$('#mphone').val($('#mphone').val().substring(3));
	
    $.ajax({
        type: 'POST',
        url: './ci',
   		data: member,
        success: function() {
			memberSearchAction(document.getElementsByClassName("memberActivePage")[0].value);
        	alert("추가한 ID = " + mid + "\n추가가 완료되었습니다.");
        	memberInsertCancel();
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function memberUpdateAction() {	
	if ($('#mgenderMale').is(":checked") == true) {
		$('#mbirth').val($('#mbirth').val() + "1");
	} else {
		$('#mbirth').val($('#mbirth').val() + "2");	
	}
	$('#mphone').val("010" + $('#mphone').val());
	
	var mid = document.getElementById('mid').value;
	var member = $("form[name=memberInfoDetail]").serialize();
	
	$('#mbirth').val($('#mbirth').val().substring(0,8));
	$('#mphone').val($('#mphone').val().substring(3));
    
    $.ajax({
        type: 'POST',
        url: './cU',
   		data: member,
        success: function() {
			memberSearchAction(document.getElementsByClassName("memberActivePage")[0].value);
        	alert("수정한 ID = " + mid + "\n수정이 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function memberDeleteAction() {	
	var mid = document.getElementById('mid').value;
    
    $.ajax({
        type: 'POST',
        url: './cD/mid/' + mid,
   		data: {mid:mid},
        success: function() {
        	memberSearchAction(document.getElementsByClassName("memberActivePage")[0].value);
        	alert("삭제한 ID = " + mid + "\n삭제가 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function memberIdCheckAction() {
	var mid = document.getElementById('mid').value;
	if (mid == null || mid == "" || mid == "admin" || mid.length < 4 || !mid.match(/^[a-zA-Z0-9]*$/)) {
		alert("아이디를 다시 입력해주세요.");
		return false;
	}
    
    $.ajax({
        type: 'POST',
        url: './cC',
   		data: {mid:mid},
        success: function(member) {
        	if (member.mid == null) {
        		alert("사용 가능한 아이디입니다.");
				document.getElementById('memberIdCheck').value = "Y";
        	} else {
        		alert("이미 존재하는 아이디입니다.");
        	}
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}
</script>

    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="../common/adminHeader.jsp"></jsp:include>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
        	<!-- Topbar -->
        	<jsp:include page="../common/toolbarHeader.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-6">
					<!--좌우분할 6:6-->
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
											<input type="button" class="btn btn-default btn-md" id="memberSearchButton" value="검색" onclick="memberSearchAction(1)">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body" id="leftPanel">
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
							<ul class="pagination justify-content-center" id="memberPagingZone">
								<c:if test= "${memberPaging.prev}">
									<li class="page-item"><a class="page-link" href="#" onclick="memberSearchAction(1)">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${memberPaging.startPage}" end="${memberPaging.endPage}">
									<c:if test="${memberPaging.page eq page}">
									<li class="page-item active memberActivePage" id="memberPage${page}" value="${page}"><a class="page-link" href="#" onclick="memberSearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${memberPaging.page ne page}">
									<li class="page-item" id="memberPage${page}" value="${page}"><a class="page-link" href="#" onclick="memberSearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${memberPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="memberSearchAction(${memberPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//일반회원관리 -->
				</div>
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel panel-default">
						<div class="panel-heading" id="panel-heading-right"> &nbsp;상세정보패널</div>
						<div class="panel-body">
							<div class="table-responsive">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="memberInfoDetail" id= "memberInfoDetail" name="memberInfoDetail" method="post">
					<div id="memberIdZone">
					<label for="mid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
						<input type="text"
							class="form-control" name = "mid" id="mid" value="${member.mid}"
							placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$" 
							minlength="5" maxlength="20" required readonly>
					</div>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="mname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "mname" id="mname" value="${member.mname}"
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required readonly>
					</div>
					<div class="row">	
					<div class="col-md-8 input-group-sm">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mbirth" id="mbirth" value="${member.mbirth}"
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required readonly>
					</div>
					<div class="col-md-4">
					<label for=msgender">성별 <span class="text-danger">*</span></label>
					<div> 
					<label id="mgenderLabel" class="mgenderLabel">
					<input type="radio"
							class="form-control" name = "mgenderGroup" id="mgenderMale" value="남자" disabled>
					<span>남자</span>
					</label>
					<label id="mgenderLabel" class="mgenderLabel">
					<input type="radio"
							class="form-control" name = "mgenderGroup" id="mgenderFemale" value="여자" disabled>
					<span>여자</span>
					</label>
					</div>
					</div>
					</div>
					<label for="mphone">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
		            <span class="input-group-text"><i class="fa-light fa-mobile-screen"></i><i class="mhpLabel"> (010) </i></span>
		            </div>
						<input type="tel"
							class="form-control"  name = "mphone" id="mphone" value="${member.mphone}"
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required readonly>
					</div>
					<label for="mmail">이메일 <span class="text-danger">*</span></label>
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
		            <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
		            </div>
					<input type="email"
							class="form-control" name="mmail" id="mmail" value="${member.mmail}"
							placeholder="email@example.com" maxlength="30" required readonly>
					</div>					
					<div class="row">
						<div class="col-md-4 mb-1 input-group-sm">
							<label for="maddrz">우편번호 </label><input type="text"
								class="form-control" name = "maddrz" id="maddrz" value="${member.maddrz}"
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-1 input-group-sm">
							<label for="maddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "maddr" id="maddr" value="${member.maddr}"
								placeholder="여기를 클릭해주세요" required readonly>
						</div>
					</div>
					<label for="maddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
					<span class="input-group-text"><i class="fa solid fa-house-chimney"></i></span>
					</div>	
					<input type="text" class="form-control" name="maddrd" id="maddrd" value="${member.maddrd}"
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					<div class="mb-3">
						<label for="mregdate">가입일 <span class="text-danger">*</span></label> 
						<div class="input-group input-group-sm">
						<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa light fa-calendar"></i></span>
						</div>
						<input type="text"
							class="form-control" name = "mregdate" id="mregdate" placeholder="가입일" value="${member.mregdate}"
							maxlength="10" required readonly>
						</div>
					</div>					
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row" id="memberButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="memberUpdateButton" value="수정하기" title="수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="memberDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="memberInsertButton" value="회원추가" 
						onclick="memberInsertForm()" title="회원추가 버튼">			
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	</div>

	
	<script>

	function memberUpdateOk() {
		if(!confirm('정말로 수정하시겠습니까?')){
			return false;
		} else {
			memberUpdateAction();
		}
	}
	
	function memberDeleteOk(){
		
		var mid = document.getElementById('mid').value;
		
		if(!confirm('삭제할 ID = ' + mid + '\n정말로 삭제하시겠습니까?')){
			return false;
		} else {
			memberDeleteAction();
		}
	}
	
	function memberInsertOk() {
		var memberIdCheck = document.getElementById('memberIdCheck').value;
		
		if(!confirm('정말로 추가하시겠습니까?')){
			return false;
		} else {
			if(memberIdCheck == "N"){
				alert("아이디 중복확인을 클릭해주세요.");
				return false;
			}
			memberInsertAction();				
		}
	}
	
    function memberIdChange() {
      	document.getElementById('memberIdCheck').value = "N";
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