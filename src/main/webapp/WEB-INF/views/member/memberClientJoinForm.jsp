<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="shortcut icon" href="#">
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
	
	function checkEmail() {
		var mmail = $('#mmail').val(); //id값이 "id"인 입력란의 값을 저장
		$.ajax({
			url : './eC', //Controller에서 인식할 주소
			type : 'post', //POST 방식으로 전달
			data : {
				mmail : mmail
			},
			success : function(result) {
				if (result != 1) { //result가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
					$('.email_ok').css("display", "inline-block");
					$('.email_already').css("display", "none");
					$('#mail_check_button').attr("disabled", false);
				} else { // result가 1일 경우 -> 이미 존재하는 아이디
					$('.email_already').css("display", "inline-block");
					$('.email_ok').css("display", "none");
					$('#mmail').focus();
					$('#mail_check_button').attr("disabled", true);
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
		new daum.Postcode({
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
    
    $(document).on("keyup", ".phoneNumber", function() { 
  		$(this).val( 
  			$(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") 
  		); 
  	});
    
    /* $(document).on("keyup", ".birth", function() { 
  		$(this).val( 
  			$(this).val().replace(/([0-9]{6})([0-9]{1})$/gi,"$1-$2******").replace(/\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4]\d{6}/,"$1-$2******").replace("--", "-") 
  		); 
  	}); */
  	
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
    
    $(document).ready(function(){
	    var code = "";                //이메일전송 인증번호 저장위한 코드
	
	    $(".mail_input").on('input change', function(){
        	if($(".mail_input").val()=='')
        		$("#mail_check_button").attr("disabled", true);
        	else
        		$("#mail_check_button").attr("disabled", false);
        });
	    
	    /* 인증번호 이메일 전송 */
	    $(".mail_check_button").click(function(){
	    	var email = $(".mail_input").val();            // 입력한 이메일
	        var checkBox = $(".mail_check_input");        // 인증번호 입력란
	        var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
	        
	        if(email==''){
	        	alert("이메일을 입력해주세요.");
	        }else if(mailFormCheck(email)==false){
	        	alert('올바른 이메일 주소를 입력해주세요.');
	        	$('.mail_input').focus();
	        }else{
	        	$.ajax({
		            type:"GET",
		            url:"<%= request.getContextPath() %>/mailCheck?email=" + email,
		            success:function(data){
		            	//console.log("data : " + data);
		            	 checkBox.attr("disabled",false);
		            	 boxWrap.attr("id", "mail_check_input_box_true");
		            	 code = data;
		            	 alert("이메일을 전송했습니다.");
		            }
		        });
	        }
	        
	        /* 입력 이메일 형식 유효성 검사 */
	        function mailFormCheck(email){
	           var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	           return form.test(email);
	       }
	    });
	    
	    /* 인증번호 비교 */
	    $(".mail_check_input").blur(function(){
	    	var inputCode = $(".mail_check_input").val();        // 입력코드    
	        var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	        
	        if(inputCode == code){                            // 일치할 경우
	            checkResult.html("인증번호가 일치합니다.");
	            checkResult.attr("class", "correct");        
	        } else {                                            // 일치하지 않을 경우
	            checkResult.html("인증번호를 다시 확인해주세요.");
	            checkResult.attr("class", "incorrect");
	        }    
	        
	    });
	    
	    $(".mail_check_input").on("keyup", function(){ if(this.value.length == 6){ $(".btn_sample4_postcode").focus(); } });
	    
	})
	
	
	
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

.email_ok {
	color: #6A82FB;
	display: none;
}

.email_already {
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
	width: 650px;
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

#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}

.mailfloat{
	float: left !important;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

*:focus {
    outline: 0;
}

</style>
</head>
<body>

	
	<jsp:include page="../common/clientHeader.jsp" />
	<h2 align="center" class="mb-3">회원가입</h2>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form mx-auto my-auto">
				<form class="validation-form" method="post" action="./jA" onsubmit="return checkAll()" name="form">
					<div class="mb-3">
						<label for="mid">아이디 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" class="form-control" id="mid" name="mid" oninput="checkId()" maxlength="10" onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');" placeholder="영문 소문자와 숫자만 입력가능" required>
						</div>
						<div>
							<span class="id_ok"><p>사용 가능한 아이디입니다.</p></span>
							<span class="id_already"><p>이미 사용중인 아이디입니다.</p></span>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw">비밀번호 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="mpwd" id="pw" placeholder="영문/숫자를 포함하여 8~16자로 입력해야합니다." pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$" minlength="8" maxlength="16" required><br>
					</div>
					<div class="mb-3">
						<label for="pw2">비밀번호 확인 <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="mpwd2" id="pw2" placeholder="영문/숫자를 포함하여 8~16자로 입력해야합니다." pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$" minlength="8" maxlength="16" required>
						<span class="pw_ok"><p>비밀번호가 일치합니다.</p></span>
						<span class="pw_nok"><p>비밀번호가 일치하지 않습니다.</p></span>
					</div>
					<div class="mb-3">
						<label for="mname">이름 <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="mname" id="mname" placeholder="홍길동" pattern="^[가-힣]+$" maxlength="4"  required><br>
					</div>
					<div class="mb-3">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label>
						<input type="text" class="form-control birth" name="mbirth" id="mbirth" placeholder="예) 910101-1****** " maxlength="14" onkeyup="birth_keyup(this)" required><br>
					</div>
					<div class="mb-3">
						<label for="mphone">전화번호 <span class="text-danger">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"></i></span>
							<input type="tel" class="form-control phoneNumber" name="mphone" id="mphone" placeholder="010-1234-1234" maxlength="13" required>
						</div><br>
					</div>
					<label for="mmail">이메일 <span class="text-danger">*</span></label>
					<div class="row mail_wrap">
						<div class="col-md-9 input-group mailfloat mail_input_box">
		            		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<input type="text" class="form-control mail_input" name="mmail" id="mmail" maxlength="50" placeholder="you@example.com" pattern="^[a-zA-Z0-9._%+-]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" oninput="checkEmail()" required>
		            	</div>
		            	<div class="col-md-3">
		            		<!-- <label>&nbsp;</label> -->
		            		<!-- <span>인증번호 전송</span> -->
		            		<input type="button" value="인증번호 전송" id="mail_check_button" class="btn btn-outline-secondary mail_check_button"><br>
		            	</div>
					</div>
					<div class="mb-3">
						<span class="email_ok"><p>사용 가능한 이메일입니다.</p></span>
						<span class="email_already"><p>이미 사용중인 이메일입니다.</p></span>
					</div>
		           	<div class="clearfix"></div>
					<div class="mb-3 mail_check_wrap mail_check_input_box" id="mail_check_input_box_false">
						<input type="text" class="form-control mail_check_input" disabled="disabled" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="인증번호를 입력해주세요" required>
						<span id="mail_check_input_box_warn"></span>
					</div><br>
					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="sample4_postcode">우편번호 <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="maddrz" readonly required><br>
						</div>
						<div class="col-md-3 mb-3">
							<label>&nbsp;</label><br>
							<input type="submit" class="btn btn-outline-secondary btn_sample4_postcode" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
					</div>
					<div class="mb-3">
						<label for="sample4_roadAddress">도로명주소</label>
						<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="maddr" readonly required>
						<p><span id="guide" style="color: #999; display: none"></span><p>
					</div>
					<input type="hidden" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" required>
					<div class="mb-3">
						<label for="sample4_detailAddress">상세주소</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소를 입력하세요" name="maddrd" required><br>
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