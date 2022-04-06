<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="line-chart" width="300" height="250"></canvas>
<script>
  new Chart(document.getElementById("line-chart"), {
    type: 'bar',
    data: {
      labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
      datasets: [{ 
          data: [86,114,106,106,107,111,133,221,783,2478],
          label: "Africa",
          borderColor: "#0055ff",
          backgroundColor: "#0055ff",
          borderWidth: 2,
          borderRadius: 2,
          borderSkipped: false,
        }, { 
          data: [282,350,411,502,635,809,947,1402,3700,5267],
          label: "Asia",
          borderColor: "#005500",
          backgroundColor: "#005500",
          borderWidth: 2,
          borderRadius: 2,
          borderSkipped: false,
        }, { 
          data: [168,170,178,190,203,276,408,547,675,734],
          label: "Europe",
          borderColor: "#0055ff",
          backgroundColor: "#0055ff",
          borderWidth: 2,
          borderRadius: 2,
          borderSkipped: false,
        }, { 
          data: [40,20,10,16,24,38,74,167,508,784],
          label: "Latin America",
          borderColor: "#005500",
          backgroundColor: "#005500",
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
  });
</script>
</body>
</html>