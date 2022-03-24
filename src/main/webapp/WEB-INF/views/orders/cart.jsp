<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<br>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clientHeader.jsp" flush="false" />
     <div class="container">
  <h2>장바구니</h2>
  <br><br><br>
  <table class="table">
    <thead class="thead-dark">
      <tr>
      	<th></th>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>수량</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="cart" items="${cartList}">
      <tr>
      	<td>${cart.cno}</td>
        <td>${cart.pfile}</td>
        <td>${cart.pname}</td>
        <td><input name="pcount" type="number" min="1" max="20" value="${cart.pcount}" style="max-width: 4rem" /></td>
        <td>${cart.pprice}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 	 <br><br><br>
     <h3 style="text-align:center;">상품총액</h3>
     <br><br><br>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>
</html>