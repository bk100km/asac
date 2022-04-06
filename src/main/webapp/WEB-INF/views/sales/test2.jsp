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
       	  let timeList = [];
    	  let posList = [];
    	  let posList2 = [];
    	  
    	  $.ajax({
    		  url:"${cpath}/sa/se/ch",
    		  type:"get",
    		  data:{sid:"kosmo", pcate:"ns"},
    		  
    		  dataType:"json",
    		  success:function(data){
    			  // console.log(data[0].pos_count);
    			  // 그래프로 나타낼 자료 리스트에 담기
    			  for (let i = 0; i<data.length;i++){    				  
						timeList.push(data[i].pname);    				  
						posList.push(data[i].total);
    			  }
    			   console.log(timeList);
    			   console.log(posList);  	
				  // 그래프
    			  new Chart(document.getElementById("line-chart"), {
    type: 'bar',
    data: {
      labels: timeList, // x축
      datasets: [{
    	  data: posList,
          label: "Europe",
          borderColor: "#0055ff",
          backgroundColor: "#0055ff",
          borderWidth: 2,
          borderRadius: 2,
          borderSkipped: false,
        }
      ]
    },
    options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
        title:{
        	display : true,
        	text: 'World population per region (in millions)'
        }
      }
    }
  }); //그래프
    		  },
    		  error:function(){
    			  alert("실패");
    		  }  
	     		  
    	  }) // ajax	  
      } // getGraph
      
</script>
</body>
</html>