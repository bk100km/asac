<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script type="text/javascript">
function sample4_execDaumPostcode() {
	function checkId() {
		var mid = $('#sid').val(); //id값이 "id"인 입력란의 값을 저장
		$.ajax({
			url : './iC', //Controller에서 인식할 주소
			type : 'post', //POST 방식으로 전달
			data : {
				mid : mid
			},
			success : function(result) {
				if (result != 1) { //result가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
					$('.id_ok').css("display", "inline-block");
					$('.id_already').css("display", "none");
					$('#submit').attr("disabled", false);
				} else { // result가 1일 경우 -> 이미 존재하는 아이디
					$('.id_already').css("display", "inline-block");
					$('.id_ok').css("display", "none");
					$('#sid').focus();
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
	
	$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
</script>
<h4 class="mb-3">회원가입</h4>
<form method="post" action="./jA">
	<div >
	<label>아이디</label> <input type="text" id="sid" name="sid" required>
	<button type="button" onclick="checkId()" >중복체크</button>
	</div><br>
	<div >
	<label>비밀번호</label> <input type="password" id="spwd" name="spwd" required>
	</div><br>
	<div >
	<label>비밀번호 확인 </label> <input type="password" id="spwd2" name="spwd2" required>
	</div><br>
	<div>
	<label>이름</label> <input type="text" id="sname" name="sname" required>
	</div><br>
	<div>
	<label>생년월일</label> <input type="text" id="sbirth" name="sbirth" required>
	</div><br>
	<div>
	<label>전화번호</label> <input type="text" id="sphone" name="sphone" required>
	</div><br>
	<div>
	<label>이메일</label> <input type="text" id="smail" name="smail" required>
	</div><br>
	<div>
	<label>회사명</label> <input type="text" id="scompany" name="scompany" required>
	</div><br>
	<div>
	<label>회사번호</label> <input type="text" id="snumber" name="snumber" required>
	</div><br>
	<div>
	<div class="row">
						<div class="col-md-9 mb-3">
							<label for="sample4_postcode">우편번호 <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="saddr"><br>
						</div>
						<div class="col-md-3 mb-3">
							<label>&nbsp;</label><br>
							<input type="submit" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
					</div>
					<div class="mb-3">
						<label for="sample4_roadAddress">도로명주소</label>
						<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="saddrd"><br>
						<span id="guide" style="color: #999; display: none"></span> 
					</div>
					<input type="hidden" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
					<div class="mb-3">
						<label for="sample4_detailAddress">상세주소</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="saddrz"><br>
						</div>
					</div>
	<label>증명서류</label> <input type="file" id="sfile" name="sfile" required>
	</div><br>
	<input type="submit" id="submit" class="join_button btn btn-primary btn-lg btn-block" value="가입하기"><br>
</form>
</body>
</html>