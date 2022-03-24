<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function checkId() {
		var mid = $('#mid').val(); //id값이 "id"인 입력란의 값을 저장
		var idRegExp = /^[a-zA-z0-9]{4,12}$/;
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
	
	$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	
	function checkAll() {
        if (!checkUserId(form.mid.value)) {
            return false;
        } else if (!checkPassword(form.mid.value, form.mpwd.value,
                form.mpwd2.value)) {
            return false;
        } else if (!checkMail(form.mail.value)) {
            return false;
        } else if (!checkName(form.name.value)) {
            return false;
        } else if (!checkBirth(form.identi1.value, form.identi2.value)) {
            return false;
        } else if (!checkFavorite()) {
            return false;
        } else if (!checkIntro()) {
            return false;
        }
        return true;
    }

	function checkUserId(id) {
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.mid.value = "";
            form.mid.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }

    function checkPassword(password1, password2) {
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password1)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.mpwd.value = "";
            form.mpwd2.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }    

    function checkMail(mail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(mail, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.mail.value = "";
            form.mail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }

    function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }

    function checkBirth(identi1, identi2) {
        //birth이 입력되었는지 확인하기
        if (!checkExistData(identi1, "주민등록번호를 ")
                || !checkExistData(identi2, "주민등록번호를 "))
            return false;
 
        var totalIdenti = "" + identi1 + identi2;
 
        var identiArr = new Array();
        var sum = 0;
        var plus = 2;
 
        //배열에 주민등록번호 입력 후 유효값 확인하기 위해 sum에 저장
        for (var i = 0; i < 12; i++) {
            identiArr[i] = totalIdenti.charAt(i);
            if (i >= 0 && i <= 7) {
                sum += totalIdenti[i] * plus;
                plus++;
                if (i == 7)
                    plus = 2;
            } else {
                sum += totalIdenti[i] * plus;
                plus++;
            }
        }
        //주민등록번호 길이 확인하기
        if (identiArr.length < 12) {
            alert("주민등록번호는 13자리입니다.");
            form.identi1.value = "";
            form.identi2.value = "";
            form.identi1.focus();
            return false;
        }
        //주민등록번호 유효한지 확인
        var result = 11 - (sum % 11) % 10
        if (result != totalIdenti.charAt(12)) { //주민등록번호가 유효하지 않은 경우
            alert("유효하지않은 주민번호입니다.");
            form.identi1.value = "";
            form.identi2.value = "";
            form.identi1.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
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
</style>
</head>
<body>

	<jsp:include page="../common/clientHeader.jsp" />
	
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form mx-auto my-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" method="post" action="./jA" onsubmit="return checkAll()" name="form">
					<div class="mb-3">
						<label for="mid">아이디 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" class="form-control" id="mid" name="mid" oninput="checkId()" required>
						</div><br>
						<div>
							<span class="id_ok"><p>사용 가능한 아이디입니다.</p></span>
							<span class="id_already"><p>이미 사용중인 아이디입니다.</p></span>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw">비밀번호 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="mpwd" id="pw" required /><br>
					</div>
					<div class="mb-3">
						<label for="pw2">비밀번호 확인 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="mpwd2" id="pw2" required /><br>
						<span class="pw_ok"><p>비밀번호가 일치합니다.</p></span>
						<span class="pw_nok"><p>비밀번호가 일치하지 않습니다.</p></span>
					</div>
					<div class="mb-3">
						<label for="mname">이름 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="mname" id="mname" required /><br>
					</div>
					<div class="mb-3">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="mbirth" id="mbirth" required /><br>
					</div>
					<div class="mb-3">
						<label for="mphone">전화번호 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"></i></span>
							<input type="text" class="form-control phoneNumber" name="mphone" id="mphone" required /><br>
						</div><br>
					</div>
					<div class="mb-3">
						<label for="mmail">이메일 <span class="text-danger">*</span></label>
						<div class="input-group">
		            		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<input type="text" class="form-control" name="mmail" id="mmail" placeholder="you@example.com" value="" required /><br>
		            	</div><br>
					</div>
					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="sample4_postcode">우편번호 <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="maddr" readonly required><br>
						</div>
						<div class="col-md-3 mb-3">
							<label>&nbsp;</label><br>
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
					</div>
					<div class="mb-3">
						<label for="sample4_roadAddress">도로명주소</label>
						<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="maddrd" readonly required>
						<p><span id="guide" style="color: #999; display: none"></span><p>
					</div>
					<input type="hidden" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" required>
					<div class="mb-3">
						<label for="sample4_detailAddress">상세주소</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="maddrz" required><br>
						</div>
					</div>
					<input type="hidden" class="form-control" id="sample4_extraAddress" placeholder="참고항목"><br><br>
					<!-- 
						<hr class="mb-4">
						우편번호 : <input type = "text" name="maddr"><br>
						주소 : <input type = "text" name="maddrd"><br>
						상세주소 : <input type = "text" name="maddrz"><br> -->
					<div class="mb-4"></div>
				<input type="submit" id="submit" class="join_button btn btn-primary btn-lg btn-block" value="가입하기"><br>
				</form>
			</div>
		</div>
	</div>
	<br><br>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>