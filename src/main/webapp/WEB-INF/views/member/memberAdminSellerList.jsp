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
}

.sgenderLabel input[type="radio"] {
    display: none;
}
 
.sgenderLabel input[type="radio"] + span {
	border-radius: 5px;
	width: 88px;
    height: 33px;
    display: inline-block;
    padding: 4px 10px;
    border: 1px solid #dfdfdf;
    background-color: #ffffff;
    text-align: center;
    cursor: pointer;
}
 
.sgenderLabel input[type="radio"]:checked + span {
    background-color: #82ae46;
    color: #ffffff;
}

#sellerIdCheckLabel {
	margin-top:14px;
}

#sfileUploadButtonLabel {
	margin-top:14px;
}

#sfileUpload {
	display: none;
}

#leftPanel {
	text-align: center;
	height: 700px;
	margin-top: 20px;
}
	
#leftPanel .table-responsive {
	height: 620px;
}

#sellerInfoBtn td {
	line-height: 21px;
}

th {
    text-align: center;
}

/* Overlay */
.image {
	display: block;
	width: auto;
	height:100%;
}
.overlay {
	position: absolute;
	transition: all .3s ease;
	opacity: 0;
}
.overlayFade {
	height: 100%;
	width:100%;
	top: 0;
	left: 0;
	opacity: 0;
}

.seller-panel-default {
	height: 950px;
	border: 1px solid;
	border-radius: 10px;
    border-color:  #d8e3c9;
    border-width: 2px;
}

.left-seller-panel-default {
	height: 760px;
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

#sellerSearchCategory {
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

#sellerSearchButton {
	border: none;
	color: #72815d;	
    font-size: 1.1rem;
    font-weight: 600;
}

#panel-heading-right {
	padding: 4px;
}

#sfileUploadButton {
	height: 34px;
}

#sfilePreview {
	font-size: 15px;
	float: right;
	color: #85976d;
    font-weight: 600;
    font-family: 'Pretendard';
}

#sellerIdCheckButton {
	height: 34px;
}

#page-wrapper {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 100px;
	padding-right: 100px;
}

</style>
</head>

<body id="page-top">

<script>

// sfilePreview
$('body').on('click', function() {
	$('#overlayFade').css("opacity", "0");
    $('#sellerFormTable').css("opacity", "1");
    $('#sellerFormTable').css("transition", "all .5s ease");
});

function sfilePreview() {
	$('#overlayFade').css("opacity", "0.95");
    $('#sellerFormTable').css("opacity", "0.05");
    $('#sellerFormTable').css("transition", "all .5s ease");
}

// 상세정보 조회 AJAX
function sellerInfoAction(clickedSeller) {
	var sid = clickedSeller.getAttribute("data-sid");
	var sfileZoneText = "";
	
    $.ajax({
        type: 'POST',
        url: './sI',
        data: {sid:sid},
        success: function(seller) {
        	
            sfileZoneText +=  
				'<div class="row">' +
				'<div class="col-md-9 mb-1 input-group-sm">' +
					'<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text"' +
						'class="form-control" name = "sfile" id="sfile" placeholder=".png, .jpg" value="' + sfile + '"' +
						'maxlength="10" required readonly>' +
				'</div>' +
				'<div class="col-md-3 mb-1">' +
					'<input type="file" accept="image/jpeg"' +
						'class="form-control" name = "sfileUpload" id="sfileUpload" value="파일등록" onchange="sfileUploadAction()">' +
					'<label for="sfileUploadButton" id="sfileUploadButtonLabel"></label>' +
					'<input type="button" class="form-control" name = "sfileUploadButton" id="sfileUploadButton" value="파일등록" onclick="document.getElementById(`sfileUpload`).click()">' +							
				'</div>' +
				'</div>' + 
				'<a href="javascript:sfilePreview()" id="sfilePreview"> 미리보기&nbsp; </a>';
            document.getElementById("sfileZone").innerHTML = sfileZoneText;
        	
            $(seller).each(function(index, item) {
                $('#sid').prop('value',seller.sid);
                $('#sname').prop('value',seller.sname);
                $('#sname').prop('readonly',false);
                $('#sbirth').prop('value',(seller.sbirth).substring(0,8));
                $('#sbirth').prop('readonly',false);
                if ((seller.sbirth).substring(8) == "1") {
                	$('#sgenderMale').prop('disabled',false);
                	$('#sgenderFemale').prop('disabled',false);
                	$('#sgenderFemale').prop('checked',false);
                	$('#sgenderMale').prop('checked',true);
                } else {
                	$('#sgenderMale').prop('disabled',false);
                	$('#sgenderFemale').prop('disabled',false);
                	$('#sgenderMale').prop('checked',false);
                	$('#sgenderFemale').prop('checked',true);
                }
                $('#sphone').prop('value',(seller.sphone).substring(3));
                $('#sphone').prop('readonly',false);
                $('#smail').prop('value',seller.smail);
                $('#smail').prop('readonly',false);
                $('#saddrz').prop('value',seller.saddrz);
                $('#saddr').prop('value',seller.saddr);
                $('#saddr').prop('readonly',false);
                $('#saddr').attr('onclick',"saddrSearchAction()");
                $('#saddrd').prop('value',seller.saddrd);
                $('#saddrd').prop('readonly',false);
                $('#scompany').prop('value',seller.scompany);
                $('#scompany').prop('readonly',false);
                $('#snumber').prop('value',seller.snumber);
                $('#snumber').prop('readonly',false);
                $('#sfile').prop('value',seller.sfile);
                $('#sfileUploadButton').prop('disabled',false);
                $('#sregdate').prop('value',seller.sregdate);
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

function sellerSearchAction(clikedPage) {	
	var sellerSearchCategory = $('#sellerSearchCategory option:selected').val();
    var sellerSearchText = document.getElementById('sellerSearchText').value;
	var sellerListText = "";
	var sellerPagingText = "";
	var page = clikedPage;
	var step = 0;
    $.ajax({
        type: 'POST',
        url: './sS',
   		data: {sellerSearchCategory:sellerSearchCategory,
    		sellerSearchText:sellerSearchText,
    		page:page},
        success: function(map) {
        	 $.each(map.sellerList , function(i){
        		  if (map.sellerList[i].sok == 'Y') {
                  sellerListText += '<tr id="sellerInfoBtn" data-sid="' + map.sellerList[i].sid + '" onclick="sellerInfoAction(this)"><td>' + map.sellerList[i].sid + 
                  					'</td><td>' + map.sellerList[i].sname + 
                  					'</td><td>' + map.sellerList[i].sphone + 
                  					'</td><td>' + map.sellerList[i].sregdate + 
                  					'</td><td><label id="' + map.sellerList[i].sid + 'sokText">' + map.sellerList[i].sok + '</label>' +
                  					'<input type="checkbox" id="sokCheckBox" onchange="sokCheckAction(this)" data-sid="' + map.sellerList[i].sid +
                  					'" data-sok="' + map.sellerList[i].sok + '"' + 'checked />' +
                  					'</td></tr>';
       		      } else {
       		    	sellerListText += '<tr id="sellerInfoBtn" data-sid="' + map.sellerList[i].sid + '" onclick="sellerInfoAction(this)"><td>' + map.sellerList[i].sid + 
  					'</td><td>' + map.sellerList[i].sname + 
  					'</td><td>' + map.sellerList[i].sphone + 
  					'</td><td>' + map.sellerList[i].sregdate + 
  					'</td><td><label id="' + map.sellerList[i].sid + 'sokText">' + map.sellerList[i].sok + '</label>' +
  					'<input type="checkbox" id="sokCheckBox" onchange="sokCheckAction(this)" data-sid="' + map.sellerList[i].sid +
  					'" data-sok="' + map.sellerList[i].sok + '"' + ' />' +
  					'</td></tr>';        			  
        			  
        		  }	
             });
        	 
   		     if (map.paging.prev) {
	    		 sellerPagingText +=
			 	'<li class="page-item"><a class="page-link" href="#" onclick="sellerSearchAction(1)">이전</a></li>'; 
    		 }
    		 for (step = map.paging.startPage; step < map.paging.endPage + 1; step++) {
    		 	sellerPagingText +=
    		 	'<li class="page-item" id="page' + step + '" value="' + step + '"><a class="page-link" href="#" onclick="sellerSearchAction(' + step + ')">' + step + '</a></li>';
    	     }
    		 if (map.paging.next) {
    		 	sellerPagingText +=
    		 	'<li class="page-item"><a class="page-link" href="#" onclick="sellerSearchAction(' + map.paging.endPage + ')">다음</a></li>';
        	 }
        	document.getElementById("sellerListBody").innerHTML = sellerListText;
        	document.getElementById("sellerPagingZone").innerHTML = sellerPagingText;
        	[].forEach.call(document.getElementById("page" + page), function(element) {
        	    element.classList.remove("active");
        	    element.classList.remove("sellerActivePage");
        	});
        	document.getElementById("page" + page).classList.add("active");
        	document.getElementById("page" + page).classList.add("sellerActivePage");
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
	var memberInsertFormIdZoneText = '';
	var today = new Date();
    $.ajax({
        success: function() {
        	
        	$('#sellerInfoDetail').prop('action',"sellerInsertAction()");
        	$('#sid').prop('value',"");
            $('#sid').prop('readonly',false);
            $('#sname').prop('value',"");
            $('#sname').prop('readonly',false);
            $('#sbirth').prop('value',"");
            $('#sbirth').prop('readonly',false);
            $('#sgenderMale').prop('checked',false);
            $('#sgenderFemale').prop('checked',false);
            $('#sgenderMale').prop('disabled',false);
            $('#sgenderFemale').prop('disabled',false);
            $('#sphone').prop('value',"");
            $('#sphone').prop('readonly',false);
            $('#smail').prop('value',"");
            $('#smail').prop('readonly',false);
            $('#saddrz').prop('value',"");
            $('#saddrz').prop('readonly',true);
            $('#saddr').prop('value',"");
            $('#saddr').prop('readonly',false);
            $('#saddr').attr('onclick',"saddrSearchAction()");
            $('#saddrd').prop('value',"");
            $('#saddrd').prop('readonly',false);
            $('#scompany').prop('value',"");
            $('#scompany').prop('readonly',false);
            $('#snumber').prop('value',"");
            $('#snumber').prop('readonly',false);
            $('#sfile').prop('value',"");
            $('#sfile').prop('readonly',false);
            $('#sfileUploadButton').prop('disabled',false);
            $('#sregdate').prop('value', today.toLocaleDateString());
        	 
        	sellerInsertFormText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="sellerInsertButton" value="추가하기" onclick="sellerInsertOk()" title="추가하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="sellerInsertBackButton" value="뒤로가기" onclick="sellerInsertCancel()" title="뒤로가기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>';
			sellerInsertFormIdZoneText = '<div class="row">' + 
			'<div class="col-md-9 mb-1">' +
			'<label for="sid">아이디  <span class="text-danger">*</span></label>' +
			'<div class="input-group-sm">' +
			'<input type="text"' +
			'class="form-control" name = "sid" id="sid"' + 
			'placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$"' + 
			'minlength="5" maxlength="20" onchange="sellerIdChange()" required autofocus>' +
			'</div>' +
			'</div>' +
			'<div class="col-md-3">' +
			'<label for="sellerIdCheckButton" id="sellerIdCheckLabel"></label>' +
			'<input type="button" class="form-control" name = "sellerIdCheckButton" id="sellerIdCheckButton" value="중복확인" onclick="sellerIdCheckAction()">' +			
			'<input type="hidden" id="sellerIdCheck" name="sellerIdCheck" value="N">' +
			'</div>' +
			'</div>';	
			document.getElementById("sellerButtonZone").innerHTML = sellerInsertFormText;
			document.getElementById("sellerIdZone").innerHTML = sellerInsertFormIdZoneText;
			
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function sellerInsertCancel() {
	var sellerInsertCancelText = '';
	var sellerInsertFormIdZoneText = '';
    $.ajax({
        success: function() {
        	
        	$('#sellerInfoDetail').prop('action',"./sU");
        	$('#sid').prop('value',"");
            $('#sid').prop('readonly',true);
            $('#sname').prop('value',"");
            $('#sname').prop('readonly',true);
            $('#sbirth').prop('value',"");
            $('#sbirth').prop('readonly',true);
            $('#sgenderMale').prop('checked',false);
            $('#sgenderFemale').prop('checked',false);
            $('#sgenderMale').prop('disabled',true);
            $('#sgenderFemale').prop('disabled',true);
            $('#sphone').prop('value',"");
            $('#sphone').prop('readonly',true);
            $('#smail').prop('value',"");
            $('#smail').prop('readonly',true);
            $('#saddrz').prop('value',"");
            $('#saddrz').prop('readonly',true);
            $('#saddr').prop('value',"");
            $('#saddr').prop('readonly',true);
            $('#saddr').attr('onclick',"");
            $('#saddrd').prop('value',"");
            $('#saddrd').prop('readonly',true);
            $('#scompany').prop('value',"");
            $('#scompany').prop('readonly',true);
            $('#snumber').prop('value',"");
            $('#snumber').prop('readonly',true);
            $('#sfile').prop('value',"");
            $('#sfile').prop('readonly',true);
            $('#sfileUploadButton').prop('disabled',true);
            $('#sregdate').prop('value', "");
        	 
        	sellerInsertCancelText = '<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="sellerUpdateButton" value="수정하기" title="수정하기 버튼">' +
			'</div>' +
			'<div class="col-md-6 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="sellerDeleteButton" value="삭제" title="삭제하기 버튼">' +
			'</div>' +		
			'<hr class="mb-4">' +
			'<br>' +
			'<div class="col-md-12 mb-3">' +
			'<input type="button" class="btn btn-default btn-md btn-block"' + 
			'id="sellerInsertButton" value="회원추가"' + 
			'onclick="sellerInsertForm()" title="회원추가 버튼">';
			sellerInsertFormIdZoneText = '<label for="sid">아이디 <span class="text-danger">*</span></label>' + 
			'<div class="input-group-sm">' +
			'<input type="text"' +
			'class="form-control" name = "sid" id="sid" value="${seller.sid}"' +
			'placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$"' + 
			'minlength="5" maxlength="20" required readonly>' +
			'</div>';
			 document.getElementById("sellerButtonZone").innerHTML = sellerInsertCancelText;
			 document.getElementById("sellerIdZone").innerHTML = sellerInsertFormIdZoneText;
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });    
}

function sellerInsertAction() {	
	if ($('#sgenderMale').is(":checked") == true) {
		$('#sbirth').val($('#sbirth').val() + "1");
	} else {
		$('#sbirth').val($('#sbirth').val() + "2");	
	}
	$('#sphone').val("010" + $('#sphone').val());
	
	var sid = document.getElementById('sid').value;
	var seller = $("form[name=sellerInfoDetail]").serialize();
	
	$('#sbirth').val($('#sbirth').val().substring(0,8));
	$('#sphone').val($('#sphone').val().substring(3));
	
    $.ajax({
        type: 'POST',
        url: './si',
   		data: seller,
        success: function() {
			sellerSearchAction(document.getElementsByClassName("sellerActivePage")[0].value);
        	alert("추가한 ID = " + sid + "\n추가가 완료되었습니다.");
        	sellerInsertCancel();
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function sellerUpdateAction() {	
	if ($('#sgenderMale').is(":checked") == true) {
		$('#sbirth').val($('#sbirth').val() + "1");
	} else {
		$('#sbirth').val($('#sbirth').val() + "2");	
	}
	$('#sphone').val("010" + $('#sphone').val());
	
	var sid = document.getElementById('sid').value;
	var seller = $("form[name=sellerInfoDetail]").serialize();
	
	$('#sbirth').val($('#sbirth').val().substring(0,8));
	$('#sphone').val($('#sphone').val().substring(3));
    
    $.ajax({
        type: 'POST',
        url: './sU',
   		data: seller,
        success: function() {
			sellerSearchAction(document.getElementsByClassName("sellerActivePage")[0].value);
        	alert("수정한 ID = " + sid + "\n수정이 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function sellerDeleteAction() {	
	var sid = document.getElementById('sid').value;
    
    $.ajax({
        type: 'POST',
        url: './sD/sid/' + sid,
   		data: {sid:sid},
        success: function() {
        	sellerSearchAction(document.getElementsByClassName("sellerActivePage")[0].value);
        	alert("삭제한 ID = " + sid + "\n삭제가 완료되었습니다.");
				
        },
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}

function sellerIdCheckAction() {	
	var sid = document.getElementById('sid').value;
	if (sid == null || sid == "" || sid == "admin" || sid.length < 5 || !sid.match(/^[a-zA-Z0-9]*$/)) {
		alert("아이디를 다시 입력해주세요.");
		return false;
	}
    
    $.ajax({
        type: 'POST',
        url: './sC',
   		data: {sid:sid},
        success: function(seller) {
        	if (seller.sid == null) {
        		alert("사용 가능한 아이디입니다.");
				document.getElementById('sellerIdCheck').value = "Y";
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

function sfileUploadAction() {
			var sfileUpload = new FormData($("#sellerInfoDetail")[0]);
	        var sfileZoneText = "";
			
	        $.ajax({
	            url: "./sF",
	            type: "POST",
	            data: sfileUpload,
	            async: false, 
	            cache: false, 
	            processData: false,
	            contentType: false,
	            success: function(sfile){
	                sfileZoneText +=  
					'<div class="row">' +
					'<div class="col-md-9 input-group-sm">' +
						'<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text"' +
							'class="form-control" name = "sfile" id="sfile" placeholder=".png, .jpg" value="' + sfile + '"' +
							'maxlength="10" required readonly>' +
					'</div>' +
					'<div class="col-md-3">' +
						'<input type="file" accept="image/jpeg"' +
							'class="form-control" name = "sfileUpload" id="sfileUpload" value="파일등록" onchange="sfileUploadAction()">' +
						'<label for="sfileUploadButton" id="sfileUploadButtonLabel"></label>' +
						'<input type="button" class="form-control" name = "sfileUploadButton" id="sfileUploadButton" value="파일등록" onclick="document.getElementById(`sfileUpload`).click()">' +							
					'</div>' +
					'</div>' + 
					'<a href="javascript:sfilePreview()" id="sfilePreview"> 미리보기</a>';
	                document.getElementById("sfileZone").innerHTML = sfileZoneText;
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
					<!--좌우분할 5:7-->
					<!--일반회원 관리//-->
					<div class="panel seller-panel-default left-seller-panel-default">
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
											<input type="button" class="btn btn-default btn-md" id="sellerSearchButton" value="검색" onclick="sellerSearchAction(1)">
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
												<input type="checkbox" id="sokCheckBox${seller.sid}" onchange="sokCheckAction(this)" data-sid="${seller.sid}" data-sok="${seller.sok}" <c:if test="${seller.sok eq 'Y'}">checked</c:if> />
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<ul class="pagination justify-content-center" id="sellerPagingZone">
								<c:if test= "${sellerPaging.prev}">
									<li class="page-item"><a class="page-link" href="#" onclick="sellerSearchAction(1)">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${sellerPaging.startPage}" end="${sellerPaging.endPage}">
									<c:if test="${sellerPaging.page eq page}">
									<li class="page-item active sellerActivePage" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="sellerSearchAction(${page})">${page}</a></li>
									</c:if>
									<c:if test="${sellerPaging.page ne page}">
									<li class="page-item" id="page${page}" value="${page}"><a class="page-link" href="#" onclick="sellerSearchAction(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<c:if test= "${sellerPaging.next}">
									<li class="page-item"><a class="page-link" href="#"  onclick="sellerSearchAction(${sellerPaging.endPage})">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--//일반회원관리 -->
				</div>
				<div class="col-lg-6">
					<!--좌우분할 5:7-->
					<!--상세정보패널//-->
					<div class="panel seller-panel-default">
						<div class="panel-heading" id="panel-heading-right"> &nbsp;상세정보패널</div>
						<div class="panel-body">
									<div class="overlay overlayFade" id="overlayFade">
										<img src="/resources/upload/d.jpg" alt="img" class="image">
									</div>
							<div class="table-responsive" id="sellerFormTable">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="sellerInfoDetail" id= "sellerInfoDetail" name="sellerInfoDetail" method="post">

					<div class="mb1" id="sellerIdZone">
					<label for="sid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
						<input type="text"
							class="form-control" name = "sid" id="sid" value=""
							placeholder="영문 소문자와 숫자만 입력가능, 5글자 이상" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" required readonly>
					</div>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="sname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "sname" id="sname" value=""
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required readonly>
					</div>
					<div class="row">					
					<div class="col-md-8 input-group-sm">
						<label for="sbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sbirth" id="sbirth" value=""
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required readonly>
					</div>
					<div class="col-md-4 input-group-sm">
					<label for="sgender">성별 <span class="text-danger">*</span></label>
					<div> 
					<label id="sgenderLabel" class="sgenderLabel">
					<input type="radio"
							class="form-control" name = "sgenderGroup" id="sgenderMale" value="남자" disabled>
					<span>남자</span>
					</label>
					<label id="sgenderLabel" class="sgenderLabel">
					<input type="radio"
							class="form-control" name = "sgenderGroup" id="sgenderFemale" value="여자" disabled>
					<span>여자</span>
					</label>
					</div>
					</div>
					</div>
					<label for="sphone">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
		            <span class="input-group-text"><i class="fa-light fa-mobile-screen"></i><i class="mhpLabel"> (010) </i></span>
		            </div>
						<input type="tel"
							class="form-control"  name = "sphone" id="sphone" value=""
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required readonly>
					</div>
					<label for="smail">이메일 <span class="text-danger">*</span></label>
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
		            <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
		            </div>
					<input type="email"
							class="form-control" name="smail" id="smail" value=""
							placeholder="email@example.com" maxlength="30" required readonly>
					</div>					
					<div class="row">
						<div class="col-md-4 mb-1 input-group-sm">
							<label for="saddrz">우편번호 </label><input type="text"
								class="form-control" name = "saddrz" id="saddrz" value=""
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-1 input-group-sm">
							<label for="saddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "saddr" id="saddr" value=""
								placeholder="여기를 클릭해주세요" required readonly>
						</div>
					</div>
					<label for="saddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group input-group-sm mb-1">
					<div class="input-group-prepend">
					<span class="input-group-text"><i class="fa solid fa-house-chimney"></i></span>
					</div>		
					<input type="text" class="form-control" name="saddrd" id="saddrd" value=""
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="scompany">회사명 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "scompany" id="scompany" placeholder="ASAC비건마켓" value=""
							maxlength="10" required readonly>
					</div>
					<div class="mb-1 input-group-sm">
						<label for="snumber">사업자등록번호 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "snumber" id="snumber" placeholder="00-0000-00" value=""
							maxlength="10" required readonly>
					</div>
					<div class="mb-1 input-group-sm" id="sfileZone">
					<div class="row">
					<div class="col-md-9 input-group-sm">
						<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "sfile" id="sfile" placeholder="파일명은 id로 지정 / .png, .jpg" value=""
							maxlength="10" required readonly>
					</div>
					<div class="col-md-3">
						<input type="file" accept="image/jpeg"
							class="form-control" name = "sfileUpload" id="sfileUpload" value="파일등록" onchange="sfileUploadAction()">
						<label for="sfileUploadButton" id="sfileUploadButtonLabel"></label>
						<input type="button" class="form-control" name = "sfileUploadButton" id="sfileUploadButton" value="파일등록" onclick="document.getElementById('sfileUpload').click()" disabled>							
					</div>
					</div>
					</div>
					<div class="mb-3">
					<label for="sregdate">가입일 <span class="text-danger">*</span></label> 
					<div class="mb-1 input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa light fa-calendar"></i></span>
					</div>
					<input type="text"
						class="form-control" name = "sregdate" id="sregdate" placeholder="20220322" value=""
						maxlength="10" required readonly>
					</div>				
					</div>	
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row" id="sellerButtonZone">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="sellerUpdateButton" value="수정하기" title="수정하기 버튼">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
						id="sellerDeleteButton" value="삭제" title="삭제하기 버튼">
						</div>		
						<hr class="mb-4">
						<br>
						<div class="col-md-12 mb-3">
						<input type="button" class="btn btn-default btn-md btn-block" 
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	</div>
	
	<script>
	function sokCheckAction(checkedSeller) {
		if(checkedSeller.getAttribute("data-sok") != 'Y') {
			if(!confirm('정말로 승인하시겠습니까?')) {
				document.getElementById("sokCheckBox" + checkedSeller.getAttribute('data-sid')).checked = false;
				return false;
			} else {
				var sid = checkedSeller.getAttribute("data-sid");
			    $.ajax({
			        type: 'POST',
			        url: './sc',
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
				document.getElementById("sokCheckBox" + checkedSeller.getAttribute('data-sid')).checked = true;
				return false;
			} else {
				var sid = checkedSeller.getAttribute("data-sid");
			    $.ajax({
			        type: 'POST',
			        url: './sc',
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
			sellerUpdateAction();
		}
	}
	
	function sellerDeleteOk(){
		
		var sid = document.getElementById('sid').value;
		
		if(!confirm('삭제할 ID = ' + sid + '\n정말로 삭제하시겠습니까?')){
			return false;
		} else {
			sellerDeleteAction();
		}
	}
	
	function sellerInsertOk() {
		var sellerIdCheck = document.getElementById('sellerIdCheck').value;
		
		if(!confirm('정말로 추가하시겠습니까?')){
			return false;
		} else {
			if(sellerIdCheck == "N"){
				alert("아이디 중복확인을 클릭해주세요.");
				return false;
			}
			sellerInsertAction();
		}
	}    
	
	function sellerIdChange() {
      	document.getElementById('sellerIdCheck').value = "N";
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