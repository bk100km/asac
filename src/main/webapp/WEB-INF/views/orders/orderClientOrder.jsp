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
		<h2 style="text-align:center;">??????</h2>
		<br/><br/>
		<h3>?????? ??????</h3>
		<table class="table" style="min-width: 300px !important;">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><input id="allCheck" type="checkbox" name="allCheck" onchange="ototalChange(this.value);"/></th>
  					<th scope="col" class="break">???????????????</th>
					<th scope="col">?????????</th>
					<th scope="col">??????</th>
					<th scope="col" class="break">??????</th>
					<th scope="col" class="break">?????????</th>
				</tr>
			</thead>
			<c:forEach var="cart" items="${cartlist}">
			<c:forEach var="pcodearrr" items="${pcodearr}">
			<c:if test="${pcodearrr eq cart.pcode}"> 
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
						<td><fmt:formatNumber value="${cart.pprice}" pattern="#,###,###???" /></td>
						<td>
						<input name="pcount" value="${cart.pcount}" style="max-width: 2rem" readonly/>
						</td>
						<td><fmt:formatNumber value="${cart.pprice * cart.pcount}" pattern="#,###,###???" />
						<input type="hidden" name="ototal" value="${cart.pprice * cart.pcount}"/></td>
					</tr>
				</tbody>
				</form>	
 			</c:if>
			</c:forEach>
			</c:forEach>
		</table>

		<!-- ?????? -->
<!-- 		<form action="./ds" method="post" id="delAction"> -->
<!-- 		<input type="hidden" name="valueArr" id="cnoArray"/> -->
<!-- 		</form> -->
		<br/>
		<div class="rigth">
		<c:choose>
		<c:when test="${fn:length(cartList) < 1}">
		
		</c:when>
		<c:when test="${fn:length(cartList) >= 1}">
		<input type="button" value="????????????" class="btn" onclick="deleteValue();">
		<button type="button" class="btn" id="btnDelete">???????????? ?????????</button>
		</c:when>
		</c:choose>
		</div>
		<br><br><br>
      		<h3>????????????</h3>
      		<hr/>
      		<form id="ordera" name="ordera" method="post">
      		<div class="row">
      			<input type="hidden"name="mid" id="mid" value="${memberInfo.mid}" />
	        	<div class="col-2 yellow break">??????  </div>
	        	<div class="col-10 white"><input type="text"name="oname" id="oname" value="${memberInfo.mname}" required/></div>
	        		
	        	<div class="col-2 yellow break">????????????  </div>
	        	<div class="col-10 white"><input type="text" name="oaddrz" id="oaddrz" value="${memberInfo.maddrz}" readonly required/> &nbsp;
	        	&nbsp;<button type="button" class="updatebtn" onclick="sample6_execDaumPostcode()">???????????? ??????</button></div>
	        	
	        	<div class="col-2 yellow break">??????  </div>
	        	<div class="col-10 white"><input type="text" name="oaddr" id="oaddr" value="${memberInfo.maddr}" readonly required/></div>
	        	
	        	<div class="col-2 yellow break">????????????  </div>
	        	<div class="col-10 white"><input type="text" name="oaddrd" id="oaddrd" value="${memberInfo.maddrd}" required/></div>
	        	
	        	<div class="col-2 yellow break">????????????  </div>
	        	<div class="col-10 white">
	        	<input type="text" name="ophone" id="ophone" value="${memberInfo.mphone}" placeholder="ex)01012341234" maxlength="11" required/></div>
	        	
	        	<div class="col-2 yellow break">?????? ????????????  </div>
	        	<div class="col-10 white"><input type="text" name="omessage" id="omessage" /></div>
	        	<div id='result'></div>
	        </div>
	        </form>
	        	<br/>
	     		
      		<div>
			<br/>
			<br/>
			<div class="rigth">
			<h3>???????????? <span id="carttotal">0</span> ???<input type="hidden" name="carttotalPrice" id="carttotalPrice"></h3>
	     	<button class="btn" id="kakaopay" type="button">????????????</button>
	     	</div>
	     	</div>
	     	<br/>
	     		</div>
	     		
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

<script>
	window.onload = function() {
			console.log("${pcodearr}");
			console.log("${ocountarr}");
			
			var pcodearrstring = "${pcodearr}";
			var pcodearr = pcodearrstring.split(",");
			console.log(pcodearr);
			
			var ocountarrstring = "${ocountarr}";
			var ocountarr = ocountarrstring.split(",");
			console.log(ocountarr);
		};
	
</script>
<script>
	$("#kakaopay").click(function () {
		
		/* var valueArr = new Array();
	    var list = $("input[name='check']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	            valueArr.push(list[i].value);
	        }
	    } */
		var ccode = new Array();
		var list = $("input[name='check']");
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	    			ccode.push(list[i].value);
	    		};
	        }
		if (ccode.length == 0){
	    	alert("???????????? ????????? ??????????????????.");
	    }
		console.log(ccode);		
		
		var pnamecheckedarr = new Array();
		$("input[name='pname']").each(function() {
			pnamecheckedarr.push($(this).val());
		});
		
		var pname = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	        	pname.push(pnamecheckedarr[i]);
	    		};
	        }
		console.log(pname);
		
		if(pname.length != 1){
			var pnameprint = pname[0].toString() + ' ??? ' + (pname.length-1).toString() + '???';
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
		
		

		var mid = $("#mid").val();
		console.log(mid);
		var oname = $("#oname").val();
		if(oname == ""){
			alert("????????? ??????????????????");
			event.stiplmmediatePropagation();
		}
		console.log(oname);
		var oaddrz = $("#oaddrz").val();
		if(oaddrz == ""){
			alert("????????? ??????????????????.");
			event.stiplmmediatePropagation();
		}
		console.log(oaddrz);
		var oaddr = $("#oaddr").val();
		console.log(oaddr);
		var oaddrd = $("#oaddrd").val();
		if(oaddrd == ""){
			alert("??????????????? ??????????????????");
			event.stiplmmediatePropagation();
		}
		console.log(oaddrd);
		var ophone = $("#ophone").val();
		if(ophone == ""){
			alert("??????????????? ??????????????????");
			event.stiplmmediatePropagation();
		}
		console.log(ophone);
		var omessage = $("#omessage").val();
		console.log(omessage);
		
		var sidcheckedarr = new Array();
		$('input[name=sid]').each(function() {
			sidcheckedarr.push($(this).val());
		});

		var sidarr = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	        	sidarr.push(sidcheckedarr[i]);
	    		};
	        }
		console.log(sidarr);
		
		var pcodecheckedarr = new Array();
		$('input[name=pcode]').each(function() {
			pcodecheckedarr.push($(this).val());
		});
		console.log(pcodecheckedarr);
		
		var pcodearr = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
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
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	        	ocountarr.push(ocountcheckedarr[i]);
	    		};
	        }
		console.log(ocountarr);
		
		var ototalcheckedarr = new Array();
		$('input[name=ototal]').each(function() {
			ototalcheckedarr.push($(this).val());
		});
		console.log(ototalcheckedarr);
		
		var ototalarr = new Array();
		for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
	        	ototalarr.push(ototalcheckedarr[i]);
	    		};
	        }
		console.log(ototalarr);
		var carttotall = carttotal.innerHTML;
		//${ototototal = ototototal + otototal} ?????? ?????? ????????? ???

		
	    
		var IMP = window.IMP; // ????????????
		IMP.init('imp21297747'); 
		// i'mport ????????? ????????? -> ????????? -> ?????????????????????
		// ''?????? ???????????? ?????? ????????? ??????????????? ?????????????????????. ???????????? ???????????? ????????????.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid??? ?????? 
			 *  https://docs.iamport.kr/implementation/payment
			 *  ?????? url??? ??????????????? ?????? ??? ?????? ????????? ????????????.
			 */
			name: pnameprint , 
			// ??????????????? ????????? ??????	
			// name: '????????? : ${auction.a_title}',
			// ???????????? model??? ?????? ????????? ?????? ????????? ????????????.
			amount: carttotall ,
			// amount: ${bid.b_bid},
			// ?????? 
			buyer_name: onameprint ,
			// ????????? ??????, ????????? ????????? model????????? ?????? ??? ????????????.
			// ????????? ????????? ??????????????? ????????????, ????????? ????????? ??? ??? ????????? ??????????????????.
			buyer_postcode: oaddrz2 ,
			
			}, function (rsp) {
				console.log("function ?????? " + rsp);
			if (rsp.success) {
				//[1] ??????????????? ???????????? ????????? ?????? jQuery ajax??? imp_uid ????????????
				jQuery.ajax({
					url: "/or/cl/is", //cross-domain error??? ???????????? ????????? ??????????????????
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
			    		//?????? ????????? ???????????? ????????? ?????? ??????
					}
				}).done(function(data) {
					//[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
					var ocode = data;
					if (ocode != null) { //????????????
						
						var msg = '????????? ?????????????????????.';
						msg += '\n??????ID : ' + rsp.imp_uid;
						msg += '\n?????? ??????ID : ' + rsp.merchant_uid; 
						msg += '\?????? ?????? : ' + rsp.paid_amount;
						msg += '?????? ???????????? : ' + rsp.apply_num;
						
						//alert("????????????" + msg);
						
						location.href = "/or/cl/su/"+ocode+"/"+ccode;
					} else {
						alert("????????????" + msg);
					}
				});
			} else {
				var msg = '????????? ?????????????????????.';
				msg += '???????????? : ' + rsp.error_msg;
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
		        if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("????????? ????????? ????????????.");
		    }
		    else{
				var chk = confirm("?????? ?????????????????????????");		
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
	                        	alert("?????? ??????");
	                        	location.replace("./li") //list ??? ????????? ????????????
	                    	}
	                    	else{
	                        	alert("?????? ??????");
	                    	}
	               		}
					});
				} else {
					alert('?????? ??????');	
				}
			}
		}
</script>
<script>
		$(function() {
			$("#btnDelete").click(function() {
				if (confirm("??????????????? ??????????????????????")) {
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
		
		if(list[i].checked){ //???????????? ????????? ????????? ?????? ?????????
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
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('oaddrz').value = data.zonecode;
                document.getElementById("oaddr").value = addr;
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("oaddrd").value = null;
                document.getElementById("oaddrd").focus();
            }
        }).open();
    }
</script>
</body>
</html>