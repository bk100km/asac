<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

      $(document).ready(function(){ 
    		getGraph();
    	});
      
      function getGraph(){
    	  var jsonData = ${weekbook}
    	  var jsonData2 = ${list2}
          var jsonObject = JSON.stringify(jsonData);
          var jsonObject2 = JSON.stringify(jsonData2);
          var jData = JSON.parse(jsonObject);
          var jData2 = JSON.parse(jsonObject2);

          console.log(jData);
          console.log(jData2);
          var labelList = new Array();
          var valueList = new Array();
          var valueList2 = new Array();

          for (var i = 0; i < jData.length; i++) {
             var d = jData[i];
             labelList.push(d.pname);
             valueList.push(d.count);
          }
          for (var i = 0; i < jData2.length; i++) {
              var t = jData2[i];
              valueList2.push(t.count);
           }
          
          new Chart(document.getElementById("weekbook"), {
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
                }, {
                    label : "구매완료수",
                    data : valueList2,
                    borderColor: "#005500",
                    backgroundColor: "#005500",
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
                         stepSize: 1,
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
      }
      
</script>
</body>
<canvas id="weekbook"></canvas>
</html>