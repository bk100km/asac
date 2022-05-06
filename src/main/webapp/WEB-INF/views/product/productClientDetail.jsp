<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>상세페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>   

function btnActive(clicked_id)  {
	
	
	 const content = document.getElementById(clicked_id+"test");
	 if(content.style.display == 'none'){
		 content.style.display = '';
		 }
		  
		  else{
			  content.style.display = 'none';
		  }
		  }
		  
		  
function total(clicked_id)	{

	var sum = document.getElementById(clicked_id).value;
	var sum = sum * ${proDetail.pprice};
	document.getElementById("totalPrice").value = sum.toLocaleString('ko-KR')+"원";
	
	
}





function check(input) {
		if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
			alert("파일 사이즈가 10mb 를 넘습니다.");
			input.value = null;
		}
	}





function fileUpload(){
	var rfileform = new FormData($("#writeform")[0]);
    var sfileZoneText = "";
	
     $.ajax({
         url : "/re/cl/sF"
       , type : "POST"
       , data: rfileform
       , async: false
       , cache: false
       , processData : false
       , contentType : false
       , success:function(rfile) {
     
          
       }
       ,error: function (jqXHR) 
       { 
           alert("실패하셨습니다."); 
       }
   });
}

function fileUpdate(){
	var rfileform = new FormData($("#updateform")[0]);
    var sfileZoneText = "";
	alert(rfileform);
     $.ajax({
         url : "/re/cl/sF"
       , type : "POST"
       , data: rfileform
       , async: false
       , cache: false
       , processData : false
       , contentType : false
       , success:function(rfile) {
           alert("성공하였습니다.");
          
       }
       ,error: function (jqXHR) 
       { 
           alert("실패하셨습니다."); 
       }
   });
}
function cartAction() {

	 if("${mid}"== "" ){
			alert("로그인하세요.");
			window.location.href = "/me/cl/lo";
			event.stiplmmediatePropagation();
	
			}
		

 var cart = $("form[name=productDetail]").serialize();
    $.ajax({
        type: 'POST',
        url: '/ca/cl/in',
   		data: cart,
        success: function() {   
      		
    
        	cartincheck();
	    }
        ,
        error: function(request, status, error) {
            console.log("code:" + request.status + 
            		"\n"+"message:" + request.responseText + 
            		"\n"+"error:"+error);
        }
    });
}


function cartincheck() {

	history.go(0);
	if("${isContainsPcode}" == "true"){ 
	  
		alert('장바구니에 담겨져있는 상품입니다!');
	
	}else{
		alert('상품이 장바구니에 담겼습니다!');
 }
}


$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});

function directAction() {
	
	 if("${mid}"== ""){
			alert("로그인하세요.");
			window.location.href = "/me/cl/lo";
			$("#mid").focus();
			event.stiplmmediatePropagation();
			}
		
	var cart = $("form[name=productDetail]").serialize();
   
   $.ajax({
       type: 'POST',
       url: '/ca/cl/in',
  		data: cart,
       success: function() {   
     		
    	   window.location.href = "/ca/cl/lf";
	    }
       ,
       error: function(request, status, error) {
           console.log("code:" + request.status + 
           		"\n"+"message:" + request.responseText + 
           		"\n"+"error:"+error);
       }
   });
}






</script>
<style>
.container {
	margin-left: auto;
	margin-right: auto;
	width: 980px;
}

.column {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	min-width: 0;
	
}

.large-4 {
	
}

.name {
	font-size: 32px;
	font-weight: 600;
	letter-spacing: .004em;
}

.rc-prices, .rc-prices-inline {
	padding-bottom: 10px;
}

.rc-prices, .rc-prices-inline, .rf-pdp-acmiprice {
	margin-top: 14px;
}

.rc-prices {
	font-size: 20px;
	line-height: 1.47059;
	font-weight: 400;
	letter-spacing: .009em;
	font-family: SF Pro Display, SF Pro Icons, AOS Icons, Helvetica Neue,
		Helvetica, Arial, sans-serif;
}

.column {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	min-width: 0;
}

.content {
	float: right;
	text-align: right;
	color: black !important;
}

.btn {
	display: inline-block;
	min-width: 112px;
	padding: 11px 31px;
	font-size: 16px;
	line-height: 26px;
	text-align: center;
	vertical-align: top;
	border: 1px solid #74bf0f !important;
	border-radius: 26px;
	background-color: #74bf0f !important;
	background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
	color: #fff;
	font-weight: 500;
}

.colum-10 {
	margin-top: 60px;
}

.contents-menu-list:after {
	content: ' ';
	display: block;
	clear: both;
}

.contents-menu-list .tab-menu-belt {
	display: table;
	table-layout: fixed;
	width: 100%;
	margin: 0 auto;
	height: auto;
	font-size: 0;
	text-align: center;
	background: #fff;
}

.contents-menu-list .tab-menu-belt .tab-menu {
	display: table-cell;
	max-width: 160px;
	vertical-align: middle;
	font-size: 0;
}

.contents-menu-list .tab-menu-belt .tab-menu .linker {
	display: block;
	height: 72px;
	color: #111;
	font-size: 16px;
	line-height: 72px;
	font-weight: 500;
	text-align: center;
}

.seller_content {
	position: relative;
	display: inline-block;
	max-width: 797px;
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 8px 10px;
	background-color: #f1f3f5;
	border-radius: 4px;
	vertical-align: top;
}
.NFNlCQC2mv {
    position:relative;
	left: 5%
   	
}
.NFNlCQC2mv ._2Q0vrZJNK1 {
    display: inline-block;
    line-height: 24px;
    vertical-align: top;
}
.NFNlCQC2mv ._2lJgrD1cyO {
    display: inline-block;
    margin-right: 4px;
    font-size: 12px;
    color: #555;
    vertical-align: top;
}
.NFNlCQC2mv ._2pgHN-ntx6 {
    display: inline-block;
    font-size: 20px;
    color: #000;
    letter-spacing: -1px;

}
.atag{
    display: inline-block;
    color:black !important;
    font-weight : bold !important;
	min-width: 10px;
	padding: 8px 30px;
	font-size: 13px;
	line-height: 20px;
	text-align: center;
	vertical-align: top;
	border-radius: 100px;

	background-color:#dcdcdc !important;
	opacity: 0.3;
	background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
	
	font-weight: 500;
}
.tbox{
	margin:10px;



}
.imgbox{

}
.img-fluid{
	max-width:100% !important;
    margin:20px;
	

}


.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px; 
	right:30px; / 
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
.psu{
	max-width: 4rem

}

.form-control{

}
@media (max-width: 768px){
.img-fluid{
	width:93% !important;
}




}

</style>


</head>
<body>

<a href="#" class="btn_gotop">
  <span class="glyphicon glyphicon-chevron-up">top
  </span>
</a>

			<jsp:include page="../common/clientHeader.jsp" flush="false" />


		<div class="container">
					<div  class="row" >
					<div class="col-md-12 col-lg-6">
						<div class="imgbox">
						
							<img src="/resources/productUpload/${proDetail.pfile}"
								class="img-fluid" title="${proDetail.pname}"
								alt="${proDetail.pcontent}" />
						
							
								<div class="NFNlCQC2mv">
						<c:choose>	
							<c:when test="${totalreview != ''}">
											<div class="_2Q0vrZJNK1"><span class="_2lJgrD1cyO">리뷰수</span>
				<a href="#scrollspyHeading2" role="button"><strong class="_2pgHN-ntx6">${totalreview}&nbsp;&nbsp;&nbsp;</strong></a></div><div class="_2Q0vrZJNK1">
				<span class="_2lJgrD1cyO"> 사용자 총 평점 </span><strong class="_2pgHN-ntx6">${average}<span class="_1RFxMQxpZW"><span class="blind"> /</span></span>5.0 </strong></div>
						</c:when>
						<c:otherwise>
						
						<span>아직 작성된 리뷰가 없습니다.</span>
						</c:otherwise>
						
						</c:choose>
						</div>	
								
						</div>
						</div>

					
					<div class="col-md-12 col-lg-6">
					<div class="tbox">
						<span class="name">${proDetail.pname}</span>
						<form name="productDetail" method="post">
							<input name="mid" type="hidden" value="${mid}">
							<div class="rc-prices rc-prices-default">
								<span><fmt:formatNumber value="${proDetail.pprice}"
										pattern="#,###,###원" /></span>
								<hr /></hr>
							</div>
						<label class="text-center me-2">판매자:</label><label
								class="content" >${proDetail.sid}</label>	
								<hr /></hr>	
								
								
				
							<span class="text-center me-2">구매 수량</span><input type="number"
								class="content text-center psu" id="pcount"
								name="pcount" type="number" min="1" max="30" value="1"
								 onclick="total(this.id)" /> <input
								name="pcode" type="hidden" value="${proDetail.pcode}">
							<hr /></hr>
							<label class="text-center me-2">총 금액:</label><input type="text"
								class="content" id="totalPrice" value="${proDetail.pprice}원"
								onkeyup="inputNumberFormat(this);" disabled />
							<hr /></hr>
						
								<a class="atag btn-default" href="<%= request.getContextPath() %>/pr/cl/li/ptag/${proDetail.ptag}/1" role="button" ><span>#${proDetail.ptag}</span></a>
					
							<div class="colum-10">
								<button class="btn" type="button" onclick="directAction()">바로 구매</button>
								&nbsp;
								<button class="btn" type="button"
									onclick="cartAction()">장바구니</button>
									<input name="url" type="hidden" >
    					
								<div>
						
									<c:choose>
										<c:when test="${!empty ptag}">
												<input class="btn content" type="button" value="상품목록"
												onclick="location.href='<%= request.getContextPath() %>/pr/cl/li/ptag/${ptag}/${nowPage}'">
										</c:when>
								
										<c:when test="${items != null}">
											<input class="btn content" type="button" value="상품목록"
												onclick="location.href='<%= request.getContextPath() %>/pr/cl/li/${proDetail.pcate}/items/${items}/text/${text}/${nowPage}'">
										</c:when>
										<c:when test="${nowPage == null}">
											<input class="btn content" type="button" value="상품목록"
												onclick="location.href='<%= request.getContextPath() %>/'">
										</c:when>
								
										<c:otherwise>
											<input class="btn content" type="button" value="상품목록"
												onclick="location.href='<%= request.getContextPath() %>/pr/cl/li/${proDetail.pcate}/${nowPage}'">

										</c:otherwise>
									</c:choose>
									
								</div>
				
							</div>
							</div>
							
						</form>
					
					</div>      
					</div>


					<br /> <br />
					<br />
					<br />
					<br />
					<br />

					








   <jsp:include page="./reviewList.jsp" flush="false" />


      	</div>

	
	<jsp:include page="../common/footer.jsp" flush="false" />
	




</body>

</html>
