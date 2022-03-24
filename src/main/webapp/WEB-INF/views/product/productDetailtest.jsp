<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" name="cart">
		&nbsp; 
		<input type="hidden" name="cartclick" value="ab" />
		<button type="submit" onclick="javascript: cart.action='http://localhost:8080/asac/ca/cl/li'">
			Cart 
		</button>
</form>
<form method="post" name="reser">
<input name="mid" value="${mid}"/>
<input name="pcode" value="G001"/>
<input name="pcount" type="number" min="1" max="20" value="1" style="max-width: 4rem" />
		<button type="submit" onclick="javascript: reser.action='http://localhost:8080/asac/ca/cl/in'">
                           장바구니에 담기</button>&nbsp;&nbsp;
</form>
</body>
</html>