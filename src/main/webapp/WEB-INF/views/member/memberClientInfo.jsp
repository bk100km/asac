<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			$('#sample4_detailAddress').val('');
	   		$('#sample4_detailAddress').focus();
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

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

/* function updateBtn() {
	var pw = $('#pw').val();
	var pw2 = $('#pw2').val();
	var mname = $('#mname').val();
	var mbirth = $('#mbirth').val();
	var mphone = $('#mphone').val();
	var maddrz = $('#sample4_postcode').val();
	var maddr = $('#sample4_roadAddress').val();
	var maddrd = $('#sample4_detailAddress').val();
	if(pw !='' && pw2 != '' && mname != '' && mphone != '' && maddrz != '' && maddr != '' && maddrd != ''){
		alert("수정이 완료 되었습니다.1");
	}else if(mname != '' && mbirth != '' && mphone != '' && maddrz != '' && maddr != '' && maddrd != ''){
		alert("수정이 완료 되었습니다.2");
	}
}; */

$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( 
		$(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") 
	); 
});

function birth_keyup(obj){
	    let birth_len = obj.value.length;
	    if (event.keyCode==14){
	        obj.value = obj.value.slice(0,birth_len)
	        return 0;
	    } else if(birth_len==6 || birth_len==7){
	        obj.value += '-';
	    } else if(birth_len==8 || birth_len==9){
	        obj.value += '******';
	    }
	}

function removeCheck() {
	 if (confirm("정말 탈퇴하시겠습니까?")){    //확인
		 location.href= './dk';
	 }
}

</script>
<style type="text/css">
.pw_ok {
	color: #6A82FB;
	display: none;
}

.pw_nok {
	color: red;
	display: none;
}

input[readonly] { outline:none; background-color: #e2e2e2 !important; }
	
body {
min-height: 100vh;
background: -webkit-gradient(linear, left bottom, right top);
background: -webkit-linear-gradient(bottom left);
background: -moz-linear-gradient(bottom left);
background: -o-linear-gradient(bottom left);
background: linear-gradient(to top right);
}	

.input-form {
	max-width: 600px;
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
	float: unset;
}

#pw{
	font-size: 17px;
}

#pw2{
	font-size: 17px;
}

</style>
</head>
<body>
<div class="container">
	<div class="input-form-background">
		<div class="input-form ">
			<form action="./up" class="validation-form" method="post">
			<c:set var="mid" value="${member.mid }" />
				<c:if test="${mid.length() <= 10 }">
					<div class="mb-2">
						<label for="mid">아이디</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" class="form-control" name="mid" value="${member.mid }" readonly>
						</div>
					</div>
					<div class="mb-2">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" name="mpwd" id="pw" placeholder="영문/숫자 포함 4~16자 입력" pattern="^([a-z0-9_]){4,16}$" minlength="4" maxlength="16" required>
					</div>
					<div class="mb-2">
						<label for="pw2">비밀번호 확인 </label>
						<input type="password" class="form-control" name="mpwd2" id="pw2" placeholder="영문/숫자 포함 4~16자 입력" pattern="^([a-z0-9_]){4,16}$" minlength="4" maxlength="16" required>
						<span class="pw_ok">비밀번호가 일치합니다.</span>
						<span class="pw_nok">비밀번호가 일치하지 않습니다.</span>
					</div>
				</c:if>
			<c:set var="mid" value="${mid }" />
				<c:if test="${fn:contains(mid, 'n@') }">
					<input type="hidden" class="form-control" name="mid" value="${mid }" readonly>
					<input type="hidden" class="form-control" name="mpwd" value="${member.mpwd }" id="pw">
				</c:if>
			<c:set var="mid" value="${mid }" />
				<c:if test="${fn:contains(mid, 'k@') }">
					<input type="hidden" class="form-control" name="mid" value="${mid }" readonly>
					<input type="hidden" class="form-control" name="mpwd" value="${member.mpwd }" id="pw">
				</c:if>
			<div class="mb-2">
				<label for="mname">이름</label>
				<input type="text" class="form-control" name="mname" id="mname" value= "${member.mname }" required>
			</div>
			<c:set var="mbirth" value="${member.mbirth }" />
			<c:if test="${mbirth != '' }">
				<div class="mb-2">
					<label for="mbirth">생년월일</label>
					<input type="text" class="form-control birth" id="mbirth" name="mbirth" value="${member.mbirth.substring(2) }" placeholder="예) 910101-1****** " onkeyup="birth_keyup(this)" maxlength="14" required>
				</div>
			</c:if>
			<c:if test="${mbirth == '' }">
				<div class="mb-2">
					<label for="mbirth">생년월일</label>
					<input type="text" class="form-control birth" id="mbirth" name="mbirth" placeholder="예) 910101-1****** " onkeyup="birth_keyup(this)" maxlength="14" required>
				</div>
			</c:if>
			<div class="mb-2">
				<label for="mphone">전화번호</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"></i></span>
					<input type="text" class="form-control phoneNumber" id="mphone" name="mphone" value="${member.mphone }" placeholder="010-1234-1234" maxlength="13" required>
				</div>
			</div>
			<div class="mb-2">
				<label for="mmail">이메일</label>
				<div class="input-group">
	           		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	           		<input type="text" class="form-control" name="mmail" value="${member.mmail }" placeholder="you@example.com" pattern="^[a-zA-Z0-9._%+-]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" readonly>
	           	</div>
		    </div>
			<div class="row">
				<div class="col-md-9 mb-2">
					<label for="sample4_postcode">우편번호</label>
					<input type="text" class="form-control" name="maddrz" id="sample4_postcode" placeholder="우편번호" value="${member.maddrz }" readonly>
				</div>
				<div class="col-md-3 mb-2">
					<label>&nbsp;</label>
					<input type="button" class="btn btn-outline-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<div class="mb-2">
				<label for="sample4_roadAddress">도로명주소</label>
				<input type="text" class="form-control" name="maddr" id="sample4_roadAddress" placeholder="도로명주소" value="${member.maddr }" readonly required>
				<span id="guide" style="color:#999;display:none"></span>
			</div>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
			<div class="mb-2">
				<label for="sample4_detailAddress">상세주소</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="maddrd" id="sample4_detailAddress" placeholder="상세주소를 입력하세요" value="${member.maddrd }" required>
				</div>
			</div>
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
			<div class="mb-4"></div>
			<div align="center" >
				<input type="submit" class="btn btn-outline-secondary" value="수정하기" onclick="updateBtn()">&nbsp;&nbsp;&nbsp;
				<input type="submit" class="btn btn-outline-secondary" value="뒤로가기" onclick="history.go(-1)">&nbsp;&nbsp;&nbsp;
				<c:set var="mid" value="${mid }" />
					<c:if test="${mid.length() <= 10 }">
						<input type="button" class="btn btn-outline-secondary" value="탈퇴하기" onclick="location.href='./de'">
					</c:if>
				<c:set var="mid" value="${mid }" />
					<c:if test="${fn:contains(mid, 'n@') }">
						<input type="button" class="btn btn-outline-secondary" value="탈퇴하기" onclick="removeCheck()">
					</c:if>
				<c:set var="mid" value="${mid }" />
					<c:if test="${fn:contains(mid, 'k@') }">
						<input type="button" class="btn btn-outline-secondary" value="탈퇴하기" onclick="removeCheck()">
					</c:if>
			</div>
			</form>
		</div>
	</div>
</div>
<br>
</body>
</html>