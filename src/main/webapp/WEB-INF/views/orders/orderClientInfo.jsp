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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
	.inline{display:inline; color : white;}
	.color{color:#808080;}
	.center{text-align:center; margin: 0px auto;}
	.right{text-align:right; !important}
	.center{text-align:center; !important}
	.yellow{background-color: #74bf0f; padding:5px; color:white;text-align:center; margin-top:5px; width:50px !important; }  
	.white{background-color: #ffffff; padding:5px; }
	.fontsize{
		font-size:3rem;
	}
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
	 .actbtn{
	 		display: inline-block;
			min-width: 60px;
			padding: 8px 10px;
			font-size: 20px;
			line-height: 20px;
			vertical-align: top;
			border: 2px solid #74bf0f !important;
			border-radius: 15px;
			background-color: #fff !important;
			background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
			color: #74bf0f;
			font-weight: 700;
	 }
	.btn {
			display: inline-block;
			min-width: 112px;
			padding: 11px 31px;
			font-size: 20px;
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
	.bigdiv{
			margin: 0 auto;
	}
	.table {
    min-width: 0px !important; 
    text-align: center;
	}
	
	.orderinfo {
	word-break:keep-all;
	min-width: 100px !important; 
	}
	@media (max-width: 768px) {
	.col-8 {
	    max-width: 100% !important;
	}
	}
	
	.titlediv{
		padding : 10px;
		background-color: #74bf0f;
	}
	
	.reviewButton{
		font-size: 15px !important;
	}

		
</style>
</head> 
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />
<div>
<form:form method="post" action="/or/cl/up/${orderClientInfo[0].ocode}" modelAttribute="orderClientInfo">
	<div class="container-fluid"> 
   		<div class="col-8 bigdiv">
   		<br/>
   		<div class="titlediv">
  		<h5 class="inline">?????? ??????
  			 <fmt:formatDate value="${orderClientInfo[0].oregdate}" pattern="yyyy-MM-dd"/>&nbsp;</h5><br/>
		<h5 class="inline">?????? ?????? ${orderClientInfo[0].ocode}</h5><br/>
		</div>
		<br/>
      		<h4>????????????</h4>
      		<div class="table-responsive">
		    <table class="table table-bordered" style="min-width: 300px !important;">
		      <thead>
		        <tr>
		          <th>????????????</th>
		          <th>??????</th>
		          <th>??????</th>
		          <th>?????????</th>
		        </tr>
		      </thead>
      		<tbody>
      		<c:forEach var="orderClientInfo" items="${orderClientInfo}">
	       		 <tr>
	       		  <td>${orderClientInfo.pname}</td>
		          <td><fmt:formatNumber value="${orderClientInfo.pprice}" pattern="#,###,###???"/></td>
		          <td><fmt:formatNumber value="${orderClientInfo.ocount}" />???</td>
		          <td><fmt:formatNumber value="${orderClientInfo.ototal}" pattern="#,###,###???"/><br>
		          <a class="fontsize actbtn reviewButton" href="/pr/cl/dt/${orderClientInfo.pcode}/1">?????? ??????</a></td>
	     		<c:set var="otototal" value="${orderClientInfo.ototal}"/>
	     		<c:set var="ototototal" value="${ototototal = ototototal + otototal}"/>
	     		</tr>
     		</c:forEach>	
		    </tbody>
		    </table>
     		<br/>
     		<h4 style="text-align:right;">??? ?????? ?????? <fmt:formatNumber value="${ototototal}" pattern="#,###,###???"/></h4>
     		<br/>
		  </div>
      		<h4>????????????</h4>
      		<div class="col-8 orderinfo">
      		<div>
      		<c:choose>
     		<c:when test="${orderClientInfo[0].odelivery eq '?????????'}">
	      		<div class="row">
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text"name="oname" id="oname" value="${orderClientInfo[0].oname}" readonly required/></div>
	        		
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrz" id="oaddrz" value="${orderClientInfo[0].oaddrz}" readonly required/>
	        	&nbsp;<button class="updatebtn" type="button" onclick="sample6_execDaumPostcode()">???????????? ??????</button></div>
	        	
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddr" id="oaddr" value="${orderClientInfo[0].oaddr}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrd" id="oaddrd" value="${orderClientInfo[0].oaddrd}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="ophone" id="ophone" value="${orderClientInfo[0].ophone}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="omessage" id="omessage" value="${orderClientInfo[0].omessage}" readonly/></div>
	        	
	     		</div>
     		</c:when>
     		<c:when test="${orderClientInfo[0].odelivery eq '????????????'}">
	      		<div class="row">
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text"name="oname" id="oname" value="${orderClientInfo[0].oname}" readonly required/></div>
	        		
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrz" id="oaddrz" value="${orderClientInfo[0].oaddrz}" readonly required/>
	        	&nbsp;<button class="updatebtn" type="button" onclick="sample6_execDaumPostcode()">???????????? ??????</button></div>
	        	
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddr" id="oaddr" value="${orderClientInfo[0].oaddr}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrd" id="oaddrd" value="${orderClientInfo[0].oaddrd}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="ophone" id="ophone" value="${orderClientInfo[0].ophone}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="omessage" id="omessage" value="${orderClientInfo[0].omessage}" readonly/></div>
	        	
	     		</div>
     		</c:when>
     		<c:otherwise>
	      		<div class="row">
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text"name="oname" id="oname" value="${orderClientInfo[0].oname}" required/></div>
	        		
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrz" id="oaddrz" value="${orderClientInfo[0].oaddrz}" readonly required/>
	        	&nbsp;<button type="button" class="updatebtn" onclick="sample6_execDaumPostcode()">???????????? ??????</button></div>
	        	
	        	<div class="col-3 yellow">??????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddr" id="oaddr" value="${orderClientInfo[0].oaddr}" readonly required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="oaddrd" id="oaddrd" value="${orderClientInfo[0].oaddrd}" required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="ophone" id="ophone" value="${orderClientInfo[0].ophone}" required/></div>
	        	
	        	<div class="col-3 yellow">????????????  </div>
	        	<div class="col-9 white"><input type="text" name="omessage" id="omessage" value="${orderClientInfo[0].omessage}" /></div>
	     		</div>
	     		<br/>
	     		<div class="center">
	     		<input class="btn " style="color: #fff;" type="submit" value="????????? ??????">
	     		</div>
     		</c:otherwise>
     		</c:choose>
     		</div>
     		<br/><br/>
			</div>
			<br/>
			<div class="right">
				<c:choose>
				<c:when test="${orderClientInfo[0].odelivery eq '?????????'}">
				<p class="inline fontsize">?????? ????????????</p>
				</c:when>
				<c:when test="${orderClientInfo[0].odelivery eq '????????????'}">
				<p class="inline fontsize">?????? ????????????</p>
				</c:when>
				<c:otherwise>
				<a class="inline fontsize actbtn" href="/or/cl/de/${orderClientInfo[0].ocode}" onclick="return confirm('????????? ?????? ???????????????????');">?????? ??????</a>
				</c:otherwise>
				</c:choose>
				&nbsp; <a class="fontsize actbtn" href="/me/cl/my">?????? ??????</a>
			</div>
     	</div> 	
    	</div>	
  	</form:form>
  		<br/>
			
  	
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
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