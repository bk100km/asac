<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ASAC 비건마켓</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<jsp:include page="common/clientHeader.jsp"></jsp:include>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    	<div>
        	<h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ASAC 비건마켓!! (일반사용자)</h1>
        	<h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인한 Id값 : ${mid} </h1>
    	</div>
    	<div class="col-xs-12 col-md-4">
    		<div id="quickreserve">
    		<h1><span class="submenu">빠른주문</span></h1>
    		<div class="recentlyBox">
           <jsp:include page="./orders/orderFast.jsp" flush="false"></jsp:include>
            </div></div><br/>
		</div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>
