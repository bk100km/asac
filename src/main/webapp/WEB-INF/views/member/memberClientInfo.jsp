<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
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

/* $(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); }); */

</script>
<style type="text/css">
input[readonly] { outline:none; background-color: #e2e2e2; }
	
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
	float: unset;
}	
</style>
</head>
<body>
<div class="container">
	<div class="input-form-background">
		<div class="input-form ">
			<form action="./up" class="validation-form" method="post">
			<div class="mb-3">
				<label for="mid">아이디</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" class="form-control" name="mid" value="${member.mid }" readonly>
				</div><br>
			</div>
			<div class="mb-3">
				<label for="pw">비밀번호</label><br>
				<input type="password" class="form-control" name="mpwd" value="${member.mpwd }" required><br>
			</div>
			<div class="mb-3">
				<label for="mname">이름</label><br>
				<input type="text" class="form-control" name="mname" value= "${member.mname }" required><br>
			</div>
			<div class="mb-3">
				<label for="mbirth">생년월일</label><br>
				<input type="text" class="form-control" name="mbirth" value="${member.mbirth }" required><br>
			</div>
			<div class="mb-3">
				<label for="mphone">전화번호</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"></i></span>
					<input type="text" class="form-control phoneNumber" name="mphone" value="${member.mphone }" required><br>
				</div><br>
			</div>
			<div class="mb-3">
				<label for="mmail">이메일</label>
				<div class="input-group">
	           		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	           		<input type="text" class="form-control" name="mmail" value="${member.mmail }" required><br>
	           	</div><br>
		    </div>
			<div class="row">
				<div class="col-md-9 mb-3">
					<label for="sample4_postcode">우편번호</label><br>
					<input type="text" class="form-control" name="maddrz" id="sample4_postcode" placeholder="우편번호" value="${member.maddrz }" readonly>
				</div>
				<div class="col-md-3 mb-3">
					<label>&nbsp;</label><br>
					<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div><br>
			<div class="mb-3">
				<label for="sample4_roadAddress">도로명주소</label><br>
				<input type="text" class="form-control" name="maddr" id="sample4_roadAddress" placeholder="도로명주소" value="${member.maddr }" readonly required><br>
				<span id="guide" style="color:#999;display:none"></span>
			</div>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
			<div class="mb-3">
				<label for="sample4_detailAddress">상세주소</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="maddrd" id="sample4_detailAddress" placeholder="상세주소" value="${member.maddrd }" readonly required><br>
				</div>
			</div>
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
			<br><br>
			<input type="submit" class="btn" value="수정하기">
			<input type="submit" class="btn" value="뒤로가기" onclick="history.go(-1)">
			<input type="button" class="btn" value="탈퇴하기" onclick="location.href='./de'">
			</form>
		</div>
	</div>
</div>
<br><br>
</body>
</html>