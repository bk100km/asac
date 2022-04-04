<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />

			<h3>상품 정보</h3>
			<hr/>
			<div>
			
			</div>
      		<h3>배송지 정보</h3>
      		<hr/>
      		<div>
        	<div>이름  </div>
        	<div><input type="text"name="mname" id="mname" value="${memberInfo.mname}" required/></div>
        		
        	<div>우편번호  </div>
        	<div><input type="text" name="maddrz" id="maddrz" value="${memberInfo.maddrz}" readonly required/>
        	<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button></div>
        	
        	<div>주소  </div>
        	<div><input type="text" name="maddr" id="maddr" value="${memberInfo.maddr}" readonly required/></div>
        	
        	<div>상세주소  </div>
        	<div><input type="text" name="maddrd" id="maddrd" value="${memberInfo.maddrd}" required/></div>
        	
        	<div>전화번호  </div>
        	<div><input type="text" name="mphone" id="mphone" value="${memberInfo.mphone}" required/></div>
     		</div>
     		
     		<h3>총 결제 금액</h3>

     	
     	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('oaddrz').value = data.zonecode;
                document.getElementById("oaddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("oaddrd").value = null;
                document.getElementById("oaddrd").focus();
            }
        }).open();
    }
</script>
</body>
</html>