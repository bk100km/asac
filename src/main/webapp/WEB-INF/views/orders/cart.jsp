<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>

<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />
</head>
<body>
	<div class="container">
		<h2>장바구니</h2>
		<br><br><br>
		<h3>상품 정보</h3>
      		<hr/>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><input id="allCheck" type="checkbox" name="allCheck"/></th>
  					<th scope="col">상품</th>
  					<th scope="col">상품이미지</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총가격</th>
				</tr>
			</thead>
			<c:forEach var="cart" items="${cartList}">
				<form id="form" name="form" method="post">
				<tbody>
					<tr>
						<td>
						<input type="checkbox" id="ccode" name="check" value="${cart.ccode}" />
						<input name="ccode" type="hidden" value="${cart.ccode}" />
						<input name="sid" type="hidden" value="${cart.sid}" /></td>
						<td>${cart.pfile}</td>
						<td>
						<input name="pcode" type="hidden" value="${cart.pcode}" />
						<input name="pname" type="hidden" value="${cart.pname}" />${cart.pname}</td>
						<td>${cart.pprice}</td>
						<td>
						<input name="pcount" type="number" min="1" max="20"value="${cart.pcount}" style="max-width: 4rem" />
						<button class="btn btn-outline-info" type="submit" onclick="javascript: form.action='./up'">변경</button></td>
						<td><fmt:formatNumber value="${cart.pprice * cart.pcount}" pattern="#,###,###원" /></td>
					</tr>
				</tbody>
				</form>	
			</c:forEach>
		</table>
		
		<!-- 삭제 -->
<!-- 		<form action="./ds" method="post" id="delAction"> -->
<!-- 		<input type="hidden" name="valueArr" id="cnoArray"/> -->
<!-- 		</form> -->
		
		<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
		<button type="button" class="btn btn-outline-info" id="btnDelete">장바구니 비우기</button>
		<br><br><br>
      		<h3>배송지 정보</h3>
      		<hr/>
      		<form id="ordera" name="ordera" method="post">
      		<div>
      		<input type="hidden"name="mid" id="mid" value="${memberInfo.mid}" />
        	<div>이름  </div>
        	<div><input type="text"name="oname" id="oname" value="${memberInfo.mname}" required/></div>
        		
        	<div>우편번호  </div>
        	<div><input type="text" name="oaddrz" id="oaddrz" value="${memberInfo.maddrz}" readonly required/>
        	<button class="btn btn-outline-info" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button></div>
        	
        	<div>주소  </div>
        	<div><input type="text" name="oaddr" id="oaddr" value="${memberInfo.maddr}" readonly required/></div>
        	
        	<div>상세주소  </div>
        	<div><input type="text" name="oaddrd" id="oaddrd" value="${memberInfo.maddrd}" required/></div>
        	
        	<div>전화번호  </div>
        	<div><input type="text" name="ophone" id="ophone" value="${memberInfo.mphone}" required/></div>
     		
     		
     		<div>배송요청사항</div>
        	<div><input type="text" name="omessage" id="omessage" /></div>
        	<div id='result'></div>
        	</div>
        	</form>
		
		<h3 style ="text-align: center;" id="ototaltt">
		상품총액 
		<c:forEach var="cart" items="${cartList}">
			<c:set var="ototal" value="${cart.pcount * cart.pprice}"/>
			<input type="hidden" name="ototal" id="ototal" value="${ototal}" />
			<c:set var="carttotal" value="${carttotal = carttotal + ototal}"/>
		</c:forEach>
		<input type="hidden" name="carttotal" id="carttotal" value="${carttotal}" />${carttotal}	
		</h3>
		<br><br><br>
     	<button class="btn btn-outline-info" id="kakaopay" type="button">결제하기</button>
     	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
<script>
	$("#kakaopay").click(function () {
		
		var ccode = new Array();
		$("input[name='ccode']").each(function() {
			ccode.push($(this).val());
		});
		console.log(ccode);
		
		var pname = new Array();
		$("input[name='pname']").each(function() {
			pname.push($(this).val());
		});
		console.log(pname);
		
		if(pname.length != 1){
			var pnameprint = pname[0].toString() + ' 외 ' + (pname.length-1).toString() + '개';
		} else {
			var pnameprint = pname[0].toString();
		}
		
		var oname2 = new Array();
		$("input[name='oname']").each(function() {
			oname2.push($(this).val());
		});
		
		var onameprint = oname2[0].toString();
		console.log(onameprint);
		
		var oaddrz2 = ${memberInfo.maddrz}; 
		console.log(oaddrz2);
		
		var carttotal = ${carttotal};
		
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
		
		var sidarr = new Array();
		$('input[name=sid]').each(function() {
			sidarr.push($(this).val());
		});
		console.log(sidarr);
		
		var pcodearr = new Array();
		$('input[name=pcode]').each(function() {
			pcodearr.push($(this).val());
		});
		console.log(pcodearr);
		
		var ocountarr = new Array();
		$('input[name=pcount]').each(function() {
			ocountarr.push($(this).val());
		});
		console.log(ocountarr);
		
		var ototalarr = new Array();
		$('input[name=ototal]').each(function() {
			ototalarr.push($(this).val());
		});
		console.log(ototalarr);

		
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
			name: pnameprint , 
			// 결제창에서 보여질 이름	
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: carttotal ,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: onameprint ,
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: oaddrz2 ,
			
			}, function (rsp) {
				console.log("function 호출 " + rsp);
			if (rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url: "/asac/or/cl/is", //cross-domain error가 발생하지 않도록 주의해주세요
					type: 'POST',
					traditional : true,
					data: {
			    		imp_uid : rsp.imp_uid,
			    		sidarr : sidarr,
			    		mid : mid,
			    		pcodearr : pcodearr,
			    		ocountarr : ocountarr,
			    		oname : oname,
			    		oaddrz : oaddrz,
			    		oaddr : oaddr,
			    		oaddrd : oaddrd,
			    		ophone : ophone,
			    		ototalarr : ototalarr,
			    		omessage : omessage
			    		//기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if ( result ) { //여기부터
						
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid; 
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						
						//alert("결제완료" + msg);
						location.href = "/asac/ca/cl/de";
						location.href = "/asac/me/cl/my";
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
<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("check");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='check']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='check']").click(function(){
				if($("input[name='check']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "./ds";    
			var valueArr = new Array();
		    var list = $("input[name='check']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 상품이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");		
				if(chk == true){
					$.ajax({
				    	url : url,                   
				    	type : 'POST',              
				    	traditional : true,
				    	data : {
				    		valueArr : valueArr      
				    	},
	                	success: function(jdata){
	                    	if(jdata = 1) {
	                        	alert("삭제 성공");
	                        	location.replace("./li") //list 로 페이지 새로고침
	                    	}
	                    	else{
	                        	alert("삭제 실패");
	                    	}
	               		}
					});
				} else {
					alert('삭제 실패');	
				}
			}
		}
</script>
<script>
		$(function() {
			$("#btnDelete").click(function() {
				if (confirm("장바구니를 비우시겠습니까?")) {
					location.href = "./de";
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