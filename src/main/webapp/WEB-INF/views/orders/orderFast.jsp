<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.asac.orders.bean.OrderBean"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>빠른 주문</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">

#optionBox {display: none;}
#hprice {display: none;}
#rcountbox {display: inline;}

.pbutton {
	font-size: 10px;
	color: #FFFFFF;
	display: inline-block;
}

#result {
	font-size: 20px;
	color: #2B2B2B;
	display: inline-block;
	margin: 0 10px;
	vertical-align: baseline;
}

.mbutton {
	font-size: 10px;
	color: #FFFFFF;
	display: inline-block;
}
#pricesum {
display: none;
}

</style>
<script type="text/javascript">
function pcateChange(value) {
	var pcate = value;
	$('#selectPnameInfo option').each(function() {
		var pname = $(this).attr('class');
		if (pcate == pname) {
			$(this).removeAttr('hidden');
			$('#selectPnameInfo option.gibon').prop("selected", true);
			$('#selectPnameInfo').val("");
			$('#selectPnameInfo option.gibon').attr('hidden', 'hidden');
			$('#potx').prop("checked", true);
			pageInit();
		}
		if (pcate != pname) {
			$(this).attr('hidden', 'hidden');
			$('#selectPnameInfo option.gibon').attr('hidden', 'hidden');
		}
		if (pcate == "") {
			$('#selectPnameInfo option.gibon').prop("selected", true);
			$('#selectPnameInfo option.gibon').removeAttr('hidden');
			$('#selectPnameInfo').val("");
			$('#potx').prop("checked", true);
			pageInit();
		}
	});
}
function pnameChange(value) {
	var pname = value;
	var pcode = $('#selectPnameInfo option.' + pname + '.pcode').val();
	var pcate = $('#selectPnameInfo option.' + pname + '.pcate').val();
	var price = $('#selectPnameInfo option.' + pname + '.price').val();
	if (pname != "") {
		$('#rcount').val("1");
		$('#result').text("1");
		$('#rcountbox').css('display', '-webkit-inline-box');
		$('#price').text(price);
		$('#hprice').text(price);
		$('#onePrice').val(price);
		$('#pricesum').text(price);
		$('#totalprice').val(price);
		$('#pcode').val(pcode);
		$('#potx').prop("checked", true);
		if (pcate == 'Cac' || pcate == 'Etc' || pcate == 'Pur'
				|| pcate == 'Hub' || pcate == 'Nan') {
			$('#optionBox').css('display', 'block');
		} else {
			$('#optionBox').css('display', 'none');
			$('#totalprice').val(price);
		}
	} else {
	}
}
function pageInit() {
	$('#optionBox').css('display', 'none');
	$('#price').text("");
	$('#pricesum').text("");
	$('#onePrice').val("");
	$('#result').text("1");
	$('#rcount').val("1");
	$('#totalprice').text("");
	$('#totalprice').val("");
}
function optionCheck(value) {
	$('#rcount').val("1");
	$('#result').text("1");

	var option = value == 0 ? 0 : 5000;
	var price = parseInt($('#price').text().replace(/[^0-9]/g, ''));
	var hprice = parseInt($('#hprice').text().replace(/[^0-9]/g, ''));
	if (option == 0) {
		$('#price').text(hprice);
		$('#pricesum').text(hprice);
		$('#onePrice').val(hprice);
		$('#totalprice').val(hprice);
	}
	if (price > hprice + 5000) {
		$('#price').text(price - 5000);
		$('#pricesum').text(price - 5000);
		$('#onePrice').val(price - 5000);
	}
	if (option == 5000) {
		if (price < hprice + option)
			
	    $('#price').text(price + option);
		$('#pricesum').text(price + option);
		$('#onePrice').val(price + option);
		$('#totalprice').val(price + option);
	}
}

function count(type) {

	const resultElement = document.getElementById('result');
	const priceElement = document.getElementById('price');
	const resultpriceElement = document.getElementById('pricesum');

	let number = resultElement.innerText.replace(/,/g, '');
	let price = priceElement.innerText.replace(/,/g, '');
	let totalprice = resultpriceElement.innerText.replace(/,/g, '');

	if (type === 'plus') {
		if (number < 5)
			number = parseInt(number) + 1;
		if (totalprice < (price * 5))
			totalprice = parseInt(totalprice) + parseInt(price);
	}
	if (type === 'minus') {
		if (number > 1)
			number = parseInt(number) - 1;
		if (parseInt(totalprice) > parseInt(price))
			totalprice = totalprice - parseInt(price);
	}

	resultElement.innerText = number;
	document.getElementById('rcount').setAttribute('value', number);
	resultpriceElement.innerText = totalprice;
	document.getElementById('totalprice').setAttribute('value', totalprice);
}
</script>
</head>
<body>
	<form action="./or/cl/qu">
		<div class="container table-responsive">
			<table class="table table-bordered  tdiv">

				<tr>
					<th>상품 분류</th>
					<td class="tdde"><select id="selectCateInfo" name="pcate"
						class="custom-select" required="required"
						onchange="pcateChange(this.value);">
							<option value="" selected>상품 분류 선택</option>
							<option value="Cac">농산물</option>
							<option value="Etc">간편식</option>
							<option value="Pur">대체육·콩</option>
							<option value="Hub">양념·소스</option>
							<option value="Tre">음료</option>
							<option value="Flo">생활·뷰티</option>
						</select></td>
				</tr>

				<tr>
					<th>상 품 명</th>
					<td class="tdde">
					<select id="selectPnameInfo" name="pname" class="custom-select" required="required"
						onchange="pnameChange(this.value);">
							<option value="" class="gibon" selected>상품 선택</option>
							<c:forEach var="product" items="${productList}">
								<option value="${product.pcode}" class="${product.pname} pcode"
									hidden>
								<option value="${product.pname}" class="${product.pcate }"
									hidden>${product.pname }</option>
								<option value="${product.pcate}" class="${product.pname} pcate"
									hidden>
								<option value="${product.price}" class="${product.pname} price"
									hidden>
									
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<th>수량</th>
					<td class="tdde" id="buttonArea">
						<div id="rcountbox">
							<button id="omb" class="btn mbutton" type="button"
								onclick='count("minus")'>-</button>
							<div id='result'>1</div>
							<button id="opb" class="btn pbutton" type="button"
								onclick='count("plus")'>+</button>
						<input type="hidden" name="rcount" value="1" id="rcount">
						<span id="pricesum" style="display:none"></span>
						<span id="price" style="display:none"></span><span id="hprice"></span>
						 <input type="hidden" id="onePrice" name="price" value="">
						<input type="hidden" name="totalprice" value="" id="totalprice">
						<input type="hidden" name="pcode" value="" id="pcode">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn">
					<span class="btde">주문</span>
				</button>
			</div> 
						
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>