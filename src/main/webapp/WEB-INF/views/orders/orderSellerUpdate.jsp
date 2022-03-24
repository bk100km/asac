<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function exPostCode(){
		daum.postcode.load(function(){
			new daum.Postcode({
				oncomplete : function(data){
					var addr = '';
					if (data.userSelectedType === 'R'){
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}
					document.getElementById("oaddrz").value = data.zonecode;
					document.getElementById("oaddr").value = addr;
					document.sellerUpdate.oaddrd.value = "";
					document.getElementById("oaddrd").focus();
				}
			}).open();
		});
	}
</script>
<title>Update</title>
</head>
<body><div class="wrap">
<header>
<jsp:include page="/WEB-INF/views/common/sellerHeader.jsp" flush="false"></jsp:include>
</header>
<section id="userModifyArea">
<form name="sellerUpdate" action="./up" method="post">
<h1 class="jemok">주문 정보 수정</h1>
<div id="container" class="table-responsive">
<div id="content">
	<input type="text" name="ocode" id="ocode" value="${orderSellerUpdate.ocode}">
	<table class="table table-borderless tdiv table-sm">
    
	  <tr><td class="thde">주문번호</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.ocode}</td></tr>
      
      <tr><td class="thde">판매자아이디</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.sid}</td></tr>
      
      <tr><td class="thde">주문자아이디</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.mid}</td></tr>
      
      <tr><td class="thde">주문자 명</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.mname}</td></tr>
      
      <tr><td class="thde">상품코드</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.pcode}</td></tr>
      
      <tr><td class="thde">상품명</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.pname}</td></tr>
      
      <tr><td class="thde">상품가격</td></tr>
      <tr><td class="tdde"><fmt:formatNumber value="${orderSellerUpdate.pprice}" pattern="#,###"/>원</td></tr>
      
      <tr><td class="thde">수량</td></tr>
      <tr><td class="tdde">${orderSellerUpdate.ocount}</td></tr>
      
      <tr><td class="thde">주문자이름</td></tr>
      <tr><td class="tdde"><input type="text" name="oname" class="col2" id="oname" value="${orderSellerUpdate.oname}" required></td></tr>
      
      <tr><td class="thde">주문자전화번호</td></tr>
      <tr><td class="tdde"><input type="text" name="ophone" class="col2" id="ophone" value="${orderSellerUpdate.ophone}" required></td></tr>
      
      <tr><td class="thde">주문자우편번호</td></tr>
      <tr><td class="tdde"><input type="text" name="oaddrz" class="col2" id="oaddrz" value="${orderSellerUpdate.oaddrz}" required></td></tr>
      
      <tr><td class="thde">우편번호찾기</td></tr>
      <tr><td class="tdde"><button type="button" onclick="exPostCode()" id="btnPost" class="btn">우편번호찾기</button></td></tr>
      
      <tr><td class="thde">주문자주소</td></tr>
      <tr><td class="tdde"><input type="text" name="oaddr" class="col2" id="oaddr" value="${orderSellerUpdate.oaddr}" required></td></tr>
      
      <tr><td class="thde">주문자상세주소</td></tr>
      <tr><td class="tdde"><input type="text" name="oaddrd" class="col2" id="oaddrd" value="${orderSellerUpdate.oaddrd}" required></td></tr>
      
      
      
    </table><br>
	
    <button type="submit" id="btnMod" class="btn btn-lg" >
		<span class="btde">수 정</span></button>&nbsp;&nbsp;&nbsp;
	<button type="button" id="btnCan" class="btn btn-lg" onclick="javascript:confirmCancel();">
		<span class="btde">취 소</span></button>
		<div>
		<a href="#" id="topBtn">맨 위로</a>
		</div>
	<script>	
    function confirmCancel() {
		if(confirm("주문 수정을 취소하시겠습니까?")){
			location.href = './li';
    	}
	}
    </script>
</div></div><br>
</form>
</section>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
</footer>
</div></body>
</html>