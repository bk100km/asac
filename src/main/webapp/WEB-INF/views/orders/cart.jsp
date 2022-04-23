<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String mid = (String) session.getAttribute("mid");
		if (mid == null) {
			out.println("<script>");
			out.println("location.href='/me/cl/lo';");
			out.println("</script>");
		}
%>

<!DOCTYPE html>
<html>
<head>
<title>asac</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
 
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
	.break{
	word-break:keep-all;
	}
	.rigth{
		text-align:right;
	}
	.yellow{background-color: #74bf0f; padding:5px; color:white;text-align:center; margin-top:5px;}  
	.white{background-color: #ffffff; padding:5px; }
	td{
	    padding: 20px 5px !important;
	}

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />
	<div class="container">
		<h2 style="text-align:center;">장바구니</h2>
		<br/><br/>
		<h3>상품 정보</h3>
		<c:choose>
		<c:when test="${fn:length(cartList) < 1}">
		<br/>
		장바구니에 담긴 상품이 없습니다.
		</c:when>
		<c:when test="${fn:length(cartList) >= 1}">
		<table class="table" style="min-width: 300px !important;">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><input id="allCheck" type="checkbox" name="allCheck" onchange="ototalChange(this.value);"/></th>
  					<th scope="col" class="break">상품이미지</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col" class="break">총가격</th>
				</tr>
			</thead>
			<c:forEach var="cart" items="${cartList}">
				<form id="form" name="form" method="post">
				<tbody>
					<tr>
						<td>
						<input type="checkbox" id="ccode" name="check" value="${cart.ccode}" value1="${cart.pprice * cart.pcount}" onchange="ototalChange(this.value);"/>
						<input name="ccode" type="hidden" value="${cart.ccode}" />
						<input name="sid" type="hidden" value="${cart.sid}" /></td>
						<td><img class="card-img-to " src="/resources/productUpload/${cart.pfile}" style="width:100px; height:100px;" title="${cart.pname}" <%-- alt="${order.pcontent}" --%> /></td>
						<td class="break">
						<input name="pcode" type="hidden" value="${cart.pcode}" />
						<input name="pname" type="hidden" value="${cart.pname}" />${cart.pname}</td>
						<td><fmt:formatNumber value="${cart.pprice}" pattern="#,###,###원" /></td>
						<td>
						<input name="pcount" type="number" min="1" max="20"value="${cart.pcount}" style="max-width: 4rem" />
						<button  class="updatebtn" type="submit" onclick="javascript: form.action='./up'">변경</button></td>
						<td><fmt:formatNumber value="${cart.pprice * cart.pcount}" pattern="#,###,###원" />
						<input type="hidden" name="ototal" value="${cart.pprice * cart.pcount}"/></td>
					</tr>
				</tbody>
				</form>	
			</c:forEach>
		</table>
		</c:when>
		</c:choose>
		<!-- 삭제 -->
<!-- 		<form action="./ds" method="post" id="delAction"> -->
<!-- 		<input type="hidden" name="valueArr" id="cnoArray"/> -->
<!-- 		</form> -->
		<br/>
		<div class="rigth">
		<c:choose>
		<c:when test="${fn:length(cartList) < 1}">
		
		</c:when>
		<c:when test="${fn:length(cartList) >= 1}">
		<input type="button" value="선택삭제" class="btn" onclick="deleteValue();">
		<button type="button" class="btn" id="btnDelete">장바구니 비우기</button>
		</c:when>
		</c:choose>
		</div>
		<br><br><br>	     		
      		<div>
			<br/>
			<br/>
			<div class="rigth">
			<h3>상품총액 <span id="carttotal">0</span> 원<input type="hidden" name="carttotalPrice" id="carttotalPrice"></h3>
	     	<button class="btn" id="order" type="button">주문하기</button>
	     	</div>
	     	</div>
	     	<br/>
	     		</div>
	     		
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
<script>
	$("#order").click(function () {
		
		var ccode = new Array();
		var list = $("input[name='check']");
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	    			ccode.push(list[i].value);
	    		};
	        }
		if (ccode.length == 0){
	    	alert("주문하실 상품을 선택해주세요.");
	    	event.stiplmmediatePropagation();
		}else{
			console.log(ccode);
		}
		
		var pcodecheckedarr = new Array();
		$('input[name=pcode]').each(function() {
			pcodecheckedarr.push($(this).val());
		});
		
		var pcodearr = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	        	pcodearr.push(pcodecheckedarr[i]);
	    		};
	        }
		console.log(pcodearr);
		
		
		var ocountcheckedarr = new Array();
		$('input[name=pcount]').each(function() {
			ocountcheckedarr.push($(this).val());
		});
		console.log(ocountcheckedarr);
		
		var ocountarr = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	        	ocountarr.push(ocountcheckedarr[i]);
	    		};
	        }
		console.log(ocountarr);
		
		
		location.href="/or/cl/or/" + pcodearr + "/" + ocountarr ;
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
<script>
function ototalChange(value) {
	var ototalvalue = value;
	var ototal = new Array();
	var carttotal = Number("0");
	var list = $("input[name='check']");
	
	for(var i=0; i < list.length;i++){
		
		if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
			ototal[i] = $(list[i]).attr('value1');
		}	
		
		console.log(ototal);
			 if(isNaN(ototal[i])){
				ototal[i] = 0;
			} 
			carttotal = carttotal + Number(ototal[i]);
			document.getElementById("carttotal").innerHTML = carttotal.toLocaleString();	
			$('#carttotalPrice').val(carttotal);
	}
	

}
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