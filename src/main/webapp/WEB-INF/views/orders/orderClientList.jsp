<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<title>마이페이지-내 주문 내역</title>

</head>
<body>
      <br>
      <div class="table-responsive">
     
      <c:forEach var="order" items="${orderClientOrderList}">
	    <table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>
	          <fmt:formatDate value="${order.oregdate}" pattern="yyyy-MM-dd"/>

	    	   <th><a href="in?ocode=${order.ocode}">주문번호 : ${order.ocode}</a></th>
	          <th>총 결제 금액 : <fmt:formatNumber value="${order.total}" pattern="#,###,###원"/> </th>
	          <th><a href="../../or/cl/de?ocode=${order.ocode}" onclick="return confirm('주문을 취소 하시겠습니까?');">주문 취소</a></th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	          <td>${order.pfile}</td>
	          <c:choose>
	          <c:when test="${order.count eq 1}">
	          	<td colspan="3"><strong>${order.pname}</strong></td>
	          </c:when>
	          <c:when test="${order.count ne 1}">
	          	<td colspan="3"><strong>${order.pname}</strong> 외 ${order.count -1}개 </td>
	          </c:when>
	          </c:choose>
	        </tr>
	        
	      </tbody>
	    </table>
	    <br>
    </c:forEach>
  </div>

</body>
</html>