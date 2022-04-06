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
<jsp:include page="common/sellerHeader.jsp"></jsp:include>

<script type="text/javascript">
new Chart(document.getElementById("myAreaChart"), {
    type: "bar",
    data: {
       labels : labelList,
       datasets : [ {
          label : "총주문수",
          data : valueList,
          borderColor: "#0055ff",
          backgroundColor: "#0055ff",
          borderWidth: 2,
          borderRadius: 2,
          borderSkipped: false
       }]
    },
    options: {
   	 scales: {
          xAxes: [{
             reverse: true,
             gridLines: {
                color: "rgba(0,0,0,0.0)"
             }
          }],
          yAxes: [{
             ticks: {
                stepSize: 5,
                min:0
             },
             display: true,
             borderDash: [3, 3],
             gridLines: {
                color: "rgba(0,0,0,0.0)"
             }
          }]
       },
           legend: {
             position: 'bottom',
           },
         title:{
         	display : true,
         	text: '상품별 매출관리'
         }
       
    }
 });

	</script>
 <div>
	 	<h1>  &nbsp;&nbsp;&nbsp;  등록상품수 : ${pcount} &nbsp; 주문수 : ${ocount } 리뷰수 : ${rcount}</h1>
	 	
	 </div>
	 <div>
  		<canvas id="myAreaChart">chart</canvas>
	 </div>
	 
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    	<div>
        	<h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ASAC 비건마켓!! (중간관리자)</h1>
        	<h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인한 Id값 : ${sid} </h1>
    	</div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>
