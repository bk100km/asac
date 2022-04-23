<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<style>
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

.btn-default {
	width: 280px;
	position: relative;
	
}
</style>
	<script>
		function cancel() {
			if (confirm("수정을 취소합니까?")) {
				location.href = "./iF"
			}
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
		function exPostCode() {
			daum.postcode
					.load(function() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										var addr = '';
										if (data.userSelectedType === 'R') {
											addr = data.roadAddress;
										} else {
											addr = data.jibunAddress;
										}
										document.getElementById("saddrz").value = data.zonecode;
										document.getElementById("saddr").value = addr;

										document.getElementById("saddrd")
												.focus();
									}
								}).open();
					});
		}

		$(document)
				.on(
						"keyup",
						".phoneNumber",
						function() {
							$(this)
									.val(
											$(this)
													.val()
													.replace(/[^0-9]/g, "")
													.replace(
															/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
															"$1-$2-$3")
													.replace("--", "-"));
						});
	</script>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="../common/sellerHeader.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="../common/sellerToolbarHeader.jsp" />
				<h2 align="center">정보수정</h2>
				<div class="container">
					<div class="input-form-background">
						<div class="input-form ">
							<form action="./up" method="post">

								<div>
									<div class="mb-1">
									<label for="sid">아이디 <span class="text-danger">*</span></label>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input type="text"
											class="form-control" id="sid" name="sid"
											value="${seller.sid}" readonly>	
									</div>
									</div>
									<div class="mb-1">
										<label for="pw">비밀번호 <span class="text-danger">*</span></label>
										<input type="password" class="form-control" name="spwd"
											id="pw" pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{4,16}$"
											placeholder="비밀번호" minlength="4"
											maxlength="16" />
									</div>
									<div class="mb-1">
										<label for="pw2">비밀번호 확인 <span class="text-danger">*</span></label>
										<input type="password" class="form-control" name="spwd2"
											id="pw2" pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{4,16}$"
											placeholder="비밀번호확인" minlength="4"
											maxlength="16" /><span class="pw_ok"><p>비밀번호가
												일치합니다.</p></span> <span class="pw_nok"><p>비밀번호가 일치하지 않습니다.</p></span>
									</div>
									<div class="mb-1">
										<label for="sname">이름 <span class="text-danger">*</span></label>
										<input type="text" class="form-control"
											value="${seller.sname}" readonly />
									</div>
									<div class="mb-1">
										<label for="sbirth">생년월일 <span class="text-danger">*</span></label>
										<input type="text" class="form-control"
											value="${seller.sbirth}" readonly />
									</div>
									<div class="mb-1">
										<label for="sphone">전화번호 <span class="text-danger">*</span></label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-phone"></i></span> <input type="tel"
												class="form-control phoneNumber" name="sphone"
												value="${seller.sphone}" />
										</div>
									</div>
									<div class="mb-1">
										<label for="smail">이메일 <span class="text-danger">*</span></label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												type="email" class="form-control" name="smail" id="smail"
												value="${seller.smail}" />
										</div>
									</div>
									<div class="mb-1">
										<label for="scompany">회사명 <span class="text-danger">*</span></label>


										<input type="text" class="form-control"
											value="${seller.scompany}" readonly />

									</div>
									<div class="mb-1">
										<label for="snumber">사업자번호 <span class="text-danger">*</span></label>


										<input type="text" class="form-control"
											value="${seller.snumber}" readonly />

									</div>
									<div class="mb-1">
										<label for="snumber">증명서류 <span class="text-danger">*</span></label>


										<input type="text" class="form-control"
											value="${seller.sfile}" readonly />

									</div>
									<div class="row">
										<div class="col-md-9 mb-1">
											<label for="sample4_postcode">우편번호 <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="saddrz" placeholder="우편번호"
												name="saddrz" value="${seller.saddrz}" readonly required>
										</div>
										<div class="col-md-3 mb-1">
											<label>&nbsp;</label><br> <input type="button"
												class="btn" onclick="exPostCode()" value="우편번호 찾기">
										</div>
									</div>
									<div class="mb-1">
										<label for="sample4_roadAddress">도로명주소</label> <input
											type="text" class="form-control" id="saddr"
											placeholder="도로명주소" name="saddr" value="${seller.saddr}"
											readonly required>
										<p>
											<span id="guide" style="color: #999; display: none"></span>
										<p>
									</div>
									<input type="hidden" class="form-control"
										id="sample4_jibunAddress" placeholder="지번주소" required>
									<div class="mb-1">
										<label for="sample4_detailAddress">상세주소</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-home"></i></span> <input type="text"
												class="form-control" id="saddrd" placeholder="상세주소"
												name="saddrd" value="${seller.saddrd}" required><br>
										</div>
									</div>
								</div>
								<div></div>
								<div align="center">
								<br> <input type="submit" class="btn btn-default"
									value="수정하기">&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default"
									onclick="javascript:cancel();">뒤로가기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<br> <br> <br>

			</div>
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>