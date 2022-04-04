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
<script>
	function orderclientDelete(ocode) {
		if (confirm('주문을 취소 하시겠습니까?')) {
			location.href = '../../or/cl/de?ocode=' + ocode;
		}
	}
</script>
</head>
<body>
      <h3>주문 내역</h3>
      <br>
      <div class="table-responsive">
      <c:forEach var="order" items="${orderClientList}">
	    <table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>
	          <fmt:formatDate value="${order.oregdate}" pattern="yyyy-MM-dd"/>
	    	   <th><a href="in?ocode=${order.ocode}">주문번호 : ${order.ocode}</a></th>
	          <th>총 결제 금액 : <fmt:formatNumber value="${order.ototal}" pattern="#,###,###원"/></th>
	          <th><a href="javascript:orderclientDelete(${order.ocode})">주문 취소</a></th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	          <td rowspan="2">이미지</td>
	          <td colspan="3">${order.pname}</td>
	        </tr>
	        <tr>
		        <td colspan="3"><fmt:formatNumber value="${order.pprice}" pattern="#,###,###원"/></td>
	        </tr>
	      </tbody>
	    </table>
	    <br>
    </c:forEach>
  </div>

</body>
</html>