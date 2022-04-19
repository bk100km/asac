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
<title>Insert title here</title>
<style>
	.subtitle{display:inline;}
	.center{text-align:center;}
	.yellow{background-color: #C0FA6C; padding:20px;}  
	.white{background-color: #ffffff; padding:20px;}
	.rightalign{text-align:right;}
</style>
</head> 
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />

	<div class="container-fluid">
	<div>
  		<h2 style="text-align:center;">주문이 완료되었습니다!</h2>
  		<br>
  		<h4>주문 날짜 <fmt:formatDate value="${orderClientInfo[0].oregdate}" pattern="yyyy-MM-dd"/> &nbsp;</h4>
		<h4>주문 번호 ${orderClientInfo[0].ocode}<br></h4>
		<br/>
	</div>
	<br/>
		<div>
      		<h4>배송정보</h4>
      		<hr/>
      		<table>
	      		<tr>
		      		<th>이름 &nbsp;&nbsp; </th>
		      		<td>${orderClientInfo[0].oname}</td>
	      		</tr>
	      		<tr>
		        	<th>주소 &nbsp;&nbsp;</th>
		        	<td>${orderClientInfo[0].oaddrz}</td>
	        	</tr>
	        	<tr>
		        	<th>우편번호 &nbsp;&nbsp;</th>
		        	<td>${orderClientInfo[0].oaddr}</td>
	        	</tr>
	        	<tr>
		        	<th>상세주소 &nbsp;&nbsp; </th>
		        	<td>${orderClientInfo[0].oaddrd}</td>
	        	</tr>
	        	<tr>
		        	<th>전화번호 &nbsp;&nbsp; </th>
		        	<td>${orderClientInfo[0].ophone}</td>
	        	</tr>
	        	<tr>
		        	<th>요청사항 &nbsp;&nbsp; </th>
		        	<td>${orderClientInfo[0].omessage}</td>
	        	</tr>
        	</table>
     	</div>
	<br/><br/><br/>
		<div>
      		<h4>결제정보</h4>
      		<hr/>
      		<c:forEach var="orderClientInfo" items="${orderClientInfo}">
      		<table>
	      		<tr>
		      		<th>상품 이름 &nbsp;&nbsp; </th>
		      		<td>${orderClientInfo.pname}</td>
	      		</tr>
	      		<tr>
		        	<th>상품 가격 &nbsp;&nbsp;</th>
		        	<td><fmt:formatNumber value="${orderClientInfo.pprice}" pattern="#,###,###원"/></td>
	        	</tr>
	        	<tr>
		        	<th>상품 수량   &nbsp;&nbsp;</th>
		        	<td><fmt:formatNumber value="${orderClientInfo.ocount}" /></td>
	        	</tr>
	        	<tr>
		        	<th>상품 번호  &nbsp;&nbsp; </th>
		        	<td>${orderClientInfo.pcode}</td>
	        	</tr>
	        	<tr>
		        	<th>총 가격  &nbsp;&nbsp; </th>
		        	<td><fmt:formatNumber value="${orderClientInfo.ototal}" pattern="#,###,###원"/></td>
	        	</tr>
	        
        	</table>
      		
     		<hr/>
     		<c:set var="otototal" value="${orderClientInfo.ototal}"/>
     		<c:set var="ototototal" value="${ototototal = ototototal + otototal}"/>
     		</c:forEach>
     		<h4 class="rightalign">총 결제 가격: ${ototototal}</h4>
     		<div class="rightalign"><a href="/me/cl/in/${orderClientInfo[0].ocode}">배송정보수정</a> &nbsp; &nbsp; || &nbsp; &nbsp;
			<a href="<%= request.getContextPath() %>/me/cl/my">주문 목록으로</a></div>
    	</div>
  		</div>
<br/>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

</body>
</html>