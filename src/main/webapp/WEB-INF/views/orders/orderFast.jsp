<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>빠른 주문</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script>
$(document).ready(function(){ 
	document.getElementById("cartTotal").innerHTML = ${cart.pprice * cart.pcount};
});
</script>
<style>
.updatebtn{
	 	display: inline-block;
		min-width: 60px;
		padding: 5px 7px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: top;
		border: 2px solid #74bf0f !important;
		border-radius: 20px;
		background-color: #fff !important;
		background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
		color: #74bf0f;
		font-weight: 800;
}
.btn {
		display: inline-block;
		min-width: 112px;
		padding: 11px 31px;
		font-size: 16px;
		line-height: 26px;
		vertical-align: top;
		border: 1px solid #74bf0f !important;
		border-radius: 26px;
		background-color: #74bf0f !important;
		background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
		color: #fff !important;
		font-weight: 500;
	}
.pay{text-align:right;}
.yellow{background-color: #74bf0f; padding:5px; color:white;text-align:center; margin-top:5px;}  
.white{background-color: #ffffff; padding:5px; }
td{padding: 20px 5px !important;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />
	<div class="container">
		<h2 style ="text-align: center;">빠른 주문</h2>
		<br/><br/>
		<h3>상품 정보</h3>

		<table class="table">
			<thead class="thead-dark">
				<tr>
  					<th scope="col">상품이미지</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총가격</th>
				</tr>
			</thead>
			<c:forEach var="cart" items="${cartList}">
			<c:choose>
			<c:when test="${fn:length(cartList) ne null}">
				<form id="form" name="form" method="post">
				<tbody>
					<tr>
						<td>
							<input name="sid" type="hidden" value="${cart.sid}" />
							<input name="ccode" type="hidden" value="${cart.ccode}" />
							<img class="card-img-to imgpadding" src="/resources/image/product/${cart.pfile}" style="width:60px; height:60px;" title="${cart.pname}" /></td>
						<td>
							<input name="pcode" type="hidden" value="${cart.pcode}" />
							<input name="pname" type="hidden" value="${cart.pname}" />${cart.pname}</td>
						<td>
							<span id="productPrice"><fmt:formatNumber value="${cart.pprice}" pattern="#,###,###원" /></span>
							<input type="hidden" name="proPrice" id="proPrice" value="${cart.pprice}"/></td>
						<td>
							<input name="pcount" type="number" min="1" max="20"value="${cart.pcount}" style="max-width: 4rem" />
							<button type="submit" class="updatebtn" onclick="javascript: form.action='./fu'">변경</button></td>
						<td>
							<fmt:formatNumber value="${cart.pprice * cart.pcount}" pattern="#,###,###원" />
							<input type="hidden" name="ototal" value="${cart.pprice * cart.pcount}"/></td>
					</tr>
				</tbody>
				</form>
			</c:when>
			<c:when test="${fn:length(cartList) eq null}">
				<tbody>
					<tr>
						<td colspan="7">상품이 없습니다</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</c:when>
			</c:choose>
			</c:forEach>
		</table>
		
     		<h3>배송정보</h3>
      		<hr/>
      		<form id="ordera" name="ordera" method="post">
      		<div class="row">
      			<input type="hidden"name="mid" id="mid" value="${memberInfo.mid}" />
	        	<div class="col-2 yellow">이름  </div>
	        	<div class="col-10 white"><input type="text"name="oname" id="oname" value="${memberInfo.mname}" required/></div>
	        		
	        	<div class="col-2 yellow">우편번호  </div>
	        	<div class="col-10 white"><input type="text" name="oaddrz" id="oaddrz" value="${memberInfo.maddrz}" readonly required/> &nbsp;
	        	&nbsp;<button type="button" class="updatebtn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button></div>
	        	
	        	<div class="col-2 yellow">주소  </div>
	        	<div class="col-10 white"><input type="text" name="oaddr" id="oaddr" value="${memberInfo.maddr}" readonly required/></div>
	        	
	        	<div class="col-2 yellow">상세주소  </div>
	        	<div class="col-10 white"><input type="text" name="oaddrd" id="oaddrd" value="${memberInfo.maddrd}" required/></div>
	        	
	        	<div class="col-2 yellow">전화번호  </div>
	        	<div class="col-10 white"><input type="text" name="ophone" id="ophone" value="${memberInfo.mphone}" required/></div>
	        	
	        	<div class="col-2 yellow">배송요청사항  </div>
	        	<div class="col-10 white"><input type="text" name="omessage" id="omessage" /></div>
	        	<div id='result'></div>
	        </div>
        	</form>
		
		<br/>
		<br/>
		<div class="pay">
		<c:forEach var="cart" items="${cartList}">
		<h3 style ="text-align: right;"> 상품총액 <fmt:formatNumber value="${cart.pprice * cart.pcount}" pattern="#,###,###원" /><input type="hidden" name="ototal" value="${cart.pprice * cart.pcount}"/></h3>
		</c:forEach>
		<br/><br/>
     	<button style ="text-align: center;" class="btn" id="kakaopay" type="button">결제하기</button>
     	</div>
     	</div>
     	<br/>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
<script>
	$("#kakaopay").click(function () {
		
		var ccode = $("input[name='ccode']").val();
		console.log(ccode);		
		var pname = $("input[name='pname']").val();
		console.log(pname);
		var mid = $("#mid").val();
		console.log(mid);
		var oname = $("#oname").val();
		console.log(oname);
		var oaddrz = $("#oaddrz").val();
		console.log(oaddrz);
		var oaddr = $("#oaddr").val();
		console.log(oaddr);
		var oaddrd = $("#oaddrd").val();
		console.log(oaddrd);
		var ophone = $("#ophone").val();
		console.log(ophone);
		var omessage = $("#omessage").val();
		console.log(omessage);	
		var sid = $('input[name=sid]').val();		
		console.log(sid);
		var pcode = $('input[name=pcode]').val();
		console.log(pcode);
		var ocount = $('input[name=pcount]').val();
		console.log(ocount);		
		var ototal = $('input[name=ototal]').val();
		console.log(ototal);

		var IMP = window.IMP; // 생략가능
		IMP.init('imp21297747'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: pname, 
			// 결제창에서 보여질 이름	
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: ototal,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: oname,
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: oaddrz,
			
			}, function (rsp) {
				console.log("function 호출 " + rsp);
			if (rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url: "/or/cl/fi", //cross-domain error가 발생하지 않도록 주의해주세요
					type: 'POST',
					traditional : true,
					data: {
			    		imp_uid : rsp.imp_uid,
			    		sid : sid,
			    		mid : mid,
			    		pcode : pcode,
			    		ocount : ocount,
			    		oname : oname,
			    		oaddrz : oaddrz,
			    		oaddr : oaddr,
			    		oaddrd : oaddrd,
			    		ophone : ophone,
			    		ototal : ototal,
			    		omessage : omessage
			    		//기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					var ocode = data;
					if (ocode != null) { //여기부터
						
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid; 
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						
						location.href = "/or/cl/su/"+ocode+"/"+ccode;
					} else {
						alert("결제실패" + msg);
					}
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	});
	
	
</script>

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