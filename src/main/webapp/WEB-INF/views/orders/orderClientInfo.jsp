<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
	.subtitle{display:inline;}
	.center{<!--background-color:#fff8ff;-->}
	.yellow{background-color: #C0FA6C; padding:20px;}  
	.white{background-color: #ffffff; padding:20px;}
</style>
</head> 
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />

<form:form method="post" action="http://localhost:8080/asac/or/cl/up?ocode=${orderClientInfo[0].ocode}" modelAttribute="orderClientInfo">
	<div class="container-fluid">
  		<h2 style="text-align:center;">주문정보</h2>
  		<br>
  		<h3 class="subtitle">주문 날짜 
  			 <fmt:formatDate value="${orderClientInfo[0].oregdate}" pattern="yyyy-MM-dd"/>
	    	   &nbsp;</h3>
		<h3 class="subtitle">주문 번호 ${orderClientInfo[0].ocode}<br></h3>
		<br>
	</div>
	<div class="container-fluid center"> 
  		<div class="row">
   		<div class="col-8">
      		<h3>결제정보</h3>
      		<hr/>
      		<c:forEach var="orderClientInfo" items="${orderClientInfo}">
      		<div class="row">
        	<div class="col-4 yellow">상품 이름  </div>
        	<div class="col-8 white">${orderClientInfo.pname}</div>
        	
        	<div class="col-4 yellow">상품 가격  </div>
        	<div class="col-8 white"><fmt:formatNumber value="${orderClientInfo.pprice}" pattern="#,###,###원"/></div>
        	
        	<div class="col-4 yellow">상품 수량  </div>
        	<div class="col-8 white"><fmt:formatNumber value="${orderClientInfo.ocount}" /></div>
        	
        	<div class="col-4 yellow">상품 번호  </div>
        	<div class="col-8 white">${orderClientInfo.pcode}</div>
        	
        	<div class="col-4 yellow">총 가격  </div>
        	<div class="col-8 white"><fmt:formatNumber value="${orderClientInfo.ototal}" pattern="#,###,###원"/> </div>
     		</div>
     		<hr/>
     		<c:set var="otototal" value="${orderClientInfo.ototal}"/>
     		<c:set var="ototototal" value="${ototototal = ototototal + otototal}"/>
     		</c:forEach>
     		<h2>총 결제 가격: ${ototototal}</h2>
    	</div>
    	
    	<div class="col-8">
      		<h3>배송정보</h3>
      		<hr/>
      		
      		<div class="row">
        	<div class="col-4 yellow">이름  </div>
        	<div class="col-8 white"><input type="text"name="oname" id="oname" value="${orderClientInfo[0].oname}" required/></div>
        		
        	<div class="col-4 yellow">우편번호  </div>
        	<div class="col-8 white"><input type="text" name="oaddrz" id="oaddrz" value="${orderClientInfo[0].oaddrz}" readonly required/>
        	<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button></div>
        	
        	<div class="col-4 yellow">주소  </div>
        	<div class="col-8 white"><input type="text" name="oaddr" id="oaddr" value="${orderClientInfo[0].oaddr}" readonly required/></div>
        	
        	<div class="col-4 yellow">상세주소  </div>
        	<div class="col-8 white"><input type="text" name="oaddrd" id="oaddrd" value="${orderClientInfo[0].oaddrd}" required/></div>
        	
        	<div class="col-4 yellow">전화번호  </div>
        	<div class="col-8 white"><input type="text" name="ophone" id="ophone" value="${orderClientInfo[0].ophone}" required/></div>
        	
        	<div class="col-4 yellow">요청사항  </div>
        	<div class="col-8 white"><input type="text" name="omessage" id="omessage" value="${orderClientInfo[0].omessage}" /></div>
        	<input type="submit" value="변경사항 적용">
     		</div>
     		
     	</div>
     		<hr/>
    	</div>
  		</div>
  		</form:form>
<a href="../../or/cl/de?ocode=${orderClientInfo[0].ocode}" onclick="return confirm('주문을 취소 하시겠습니까?');">주문 취소</a>

<a href="http://localhost:8080/asac/me/cl/my"><button>주문 목록으로</button></a>
<br/>
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