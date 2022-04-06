<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


	function checkId() {
		var sid = $('#sid').val(); //id값이 "id"인 입력란의 값을 저장
		var idRegExp = /^[a-zA-z0-9]{4,12}$/;
		$.ajax({
			url : './iC', //Controller에서 인식할 주소
			type : 'post', //POST 방식으로 전달
			data : {
				sid : sid
			},
			success : function(result) {
				if (result != 1) { //result가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
					$('.id_ok').css("display", "inline-block");
					$('.id_already').css("display", "none");
					$('#submit').attr("disabled", false);
				} else { // result가 1일 경우 -> 이미 존재하는 아이디
					$('.id_already').css("display", "inline-block");
					$('.id_ok').css("display", "none");
					$('#mid').focus();
					$('#submit').attr("disabled", true);
				} 
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	$(function() {
		//비밀번호 확인
		$('#pw2').blur(function() {
			if ($('#pw').val() != $('#pw2').val()) {
				$('.pw_nok').css("display", "inline-block");
				$('.pw_ok').css("display", "none");
				if ($('#pw2').val() != '') { // 비밀번호가 일치하지 않을 때
					$('#pw2').val('');
					$('#pw2').focus();
				}
			} else { // 비밀번호가 일치할 때
				$('.pw_nok').css("display", "none");
				$('.pw_ok').css("display", "inline-block");
			}
		})
	});

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	
	
function fileUpload(){
        
        var sfileUpload = new FormData($("#seller")[0])
        var sfilezone ="";
        
        $.ajax({
        	
        	 url: "./sF",
	            type: "POST",
	            data: sfileUpload,
	            async: false, 
	            cache: false, 
	            processData: false,
	            contentType: false,
	            
	            success:function(sfile){
	            	sfilezone +=  
	            		'<div class="row">' +
						'<div class="col-md-9 mb-3">' +
							'<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text"' +
								'class="form-control" name = "sfile" id="sfile" placeholder=".png, .jpg" value="' + sfile + '"' +
								'maxlength="10" required readonly>' +
						'</div>' +
						'<div class="col-md-3 mb-3">' +
							'<input type="file" accept="image/jpeg"' +
								'class="form-control" name = "sfileUpload" id="sfileUpload" value="파일등록" onchange="fileUpload()">' +
							'<label for="sfileUploadButton" id="sfileUploadButtonLabel"></label>' +
							'<input type="button" class="form-control" name = "sfileUploadButton" id="sfileUploadButton" value="파일등록" onclick="document.getElementById(`sfileUpload`).click()">' +							
						'</div>' +
						'</div>' ;
	            	 document.getElementById("sfileZone").innerHTML = sfilezone;
	            },
	            error:function(request, status, error) {
	                console.log("code:" + request.status + 
	                		"\n"+"message:" + request.responseText + 
	                		"\n"+"error:"+error);
	            }
        	
        })
}
	
</script>
<style type="text/css">
.id_ok {
	color: #6A82FB;
	display: none;
}

.id_already {
	color: red;
	display: none;
}

.pw_ok {
	color: #6A82FB;
	display: none;
}

.pw_nok {
	color: red;
	display: none;
}

body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top);
	background: -webkit-linear-gradient(bottom left);
	background: -moz-linear-gradient(bottom left);
	background: -o-linear-gradient(bottom left);
	background: linear-gradient(to top right);
}

.input-form {
	max-width: 680px;
	margin-top: 30px !important;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	margin: auto;
	
	
}
sfileUploadButtonLabel {
	margin-top:14px;
}

#sfileUpload {
	display: none;
}
</style>
</head>
<body>

	<jsp:include page="../common/sellerHeader.jsp" />
	
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form mx-auto my-auto">
				<h4 class="mb-3">회원가입</h4>
				<form:form class="validation-form" method="post" action="./jA" enctype = "multipart/form-data"  id ="seller" name="seller" >
					<div class="mb-3">
						<label for="sid">아이디 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" class="form-control" id="sid" name="sid" oninput="checkId()" pattern="^[a-z0-9_]{4,10}$" placeholder="아이디(영문소문자와 숫자로 입력)" minlength="4" maxlength="10" required>
						</div><br>
						<div>
							<span class="id_ok"><p>사용 가능한 아이디입니다.</p></span>
							<span class="id_already"><p>이미 사용중인 아이디입니다.</p></span>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw">비밀번호 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="spwd" id="pw" pattern="^[a-z0-9_]{4,10}$" placeholder="비밀번호(영문소문자와 숫자로 입력)" minlength="4" maxlength="10" required /><br>
					</div>
					<div class="mb-3">
						<label for="pw2">비밀번호 확인 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="spwd2" id="pw2" pattern="^[a-z0-9_]{4,10}$" placeholder="비밀번호확인(영문소문자와 숫자로 입력)" minlength="4"  maxlength="10" required /><br>
						<span class="pw_ok"><p>비밀번호가 일치합니다.</p></span>
						<span class="pw_nok"><p>비밀번호가 일치하지 않습니다.</p></span>
					</div>
					<div class="mb-3">
						<label for="sname">이름 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" pattern=^[가-힣]+$ minlength="3" maxlength="6" placeholder="이름" name="sname" id="sname" required /><br>
					</div>
					<div class="mb-3">
						<label for="sbirth">생년월일 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" maxlength="8" pattern="^[0-9_]{8}$" placeholder="생년월일(8자리)" name="sbirth" id="sbirth" required /><br>
					</div>
					<div class="mb-3">
						<label for="sphone">전화번호 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"></i>(010)</span>
							<input type="tel" class="form-control phoneNumber" maxlength="8" pattern=".{8}" placeholder="전화번호(8자리)" name="sphone" id="sphone" required /><br>
						</div><br>
					</div>
					<div class="mb-3">
						<label for="smail">이메일 <span class="text-danger">*</span></label>
						<div class="input-group">
		            		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<input type="email" class="form-control" name="smail" id="smail" placeholder="you@example.com" maxlength="30" value="" required /><br>
		            	</div><br>
					</div>
					<div class="mb-3">
						<label for="scompany">회사명 <span class="text-danger">*</span></label>
						
		            		
							<input type="text" class="form-control" minlength="4" maxlength="8" name="scompany" id="scompany" placeholder="회사번호" required /><br>
		            	
					</div>
					<div class="mb-3">
						<label for="snumber">사업자번호 <span class="text-danger">*</span></label>
						
		            		
							<input type="text" class="form-control" maxlength="9" name="snumber" id="snumber" placeholder="사업자번호" required /><br>
		            	
					</div>
					<div class="mb-3" id="sfileZone">
					<div class="row">
					<div class="col-md-9 mb-3">
						<label for="sfile">증명서류 <span class="text-danger">*</span></label> <input type="text" 
							class="form-control" name = "sfile" id="sfile" placeholder=".png, .jpg" value="${seller.sfile}"
							maxlength="10" required readonly>
					</div>
					<div class="col-md-3 mb-3">
						<input type="file" accept="image/jpeg" 
							class="form-control" name = "sfileUpload" id="sfileUpload" value="파일등록" onchange="fileUpload()">
						<label for="sfileUploadButton" id="sfileUploadButtonLabel"></label>
						<input type="button" class="form-control" name = "sfileUploadButton" id="sfileUploadButton" value="파일등록" onclick="document.getElementById('sfileUpload').click()" >							
					</div>
					</div>
					</div>
					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="sample4_postcode">우편번호 <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="saddrz" readonly required><br>
						</div>
						<div class="col-md-3 mb-3">
							<label>&nbsp;</label><br>
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
					</div>
					<div class="mb-3">
						<label for="sample4_roadAddress">도로명주소</label>
						<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="saddr" readonly required>
						<p><span id="guide" style="color: #999; display: none"></span><p>
					</div>
					<input type="hidden" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" required>
					<div class="mb-3">
						<label for="sample4_detailAddress">상세주소</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="saddrd" required><br>
						</div>
					</div>
					<input type="hidden" class="form-control" id="sample4_extraAddress" placeholder="참고항목">
					
					<br><br>
					<div>
				<input type="submit" id="submit" class="join_button btn btn-primary btn-lg btn-block" value="가입하기" ><br>
				</div>
				</form:form>
			</div>
		</div>
	</div>
	<br><br>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>