<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 제이쿼리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<script>
	$(document).ready(function(){ 
		getRandomColor();
		getGraph();
		getGraph2();
		getGraph3();
		getGraph4();
	});
			
	function getRandomColor() {
	    var letters = '0123456789ABCDEF'.split('');
	    var color = '#';
	    for (var i = 0; i < 6; i++ ) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}
	 
  function getGraph(){
	  var jsonData = ${list};
      var jsonObject = JSON.stringify(jsonData);
      var jData = JSON.parse(jsonObject);

      console.log(jData);
      var labelList = new Array();
      var valueList = new Array();

      for (var i = 0; i < jData.length; i++) {
         var d = jData[i];
         labelList.push(d.month);
         valueList.push(d.count);
      }
      
      new Chart(document.getElementById("myAreaChart"), {
         type: "bar",
         data: {
            labels : labelList,
            datasets : [ {
               label : "총 회원수",
               data : valueList,
               backgroundColor: [
            	   'rgba(255, 99, 132, 0.5)', 
	               	'rgba(54, 162, 235, 0.5)', 
	               	'rgba(255, 206, 86, 0.5)', 
	               	'rgba(75, 192, 192, 0.5)', 
	               	'rgba(153, 102, 255, 0.5)', 
	               	'rgba(255, 159, 64, 0.5)',
	               	'rgba(255, 99, 132, 0.5)', 
	               	'rgba(54, 162, 235, 0.5)', 
	               	'rgba(255, 206, 86, 0.5)', 
	               	'rgba(75, 192, 192, 0.5)', 
	               	'rgba(153, 102, 255, 0.5)', 
	               	'rgba(255, 159, 64, 0.5)',
	               	'rgba(255, 99, 132, 0.5)', 
	               	'rgba(54, 162, 235, 0.5)', 
	               	'rgba(255, 206, 86, 0.5)', 
	               	'rgba(75, 192, 192, 0.5)', 
	               	'rgba(153, 102, 255, 0.5)', 
	               	'rgba(255, 159, 64, 0.5)',
	               	'rgba(255, 99, 132, 0.5)', 
	               	'rgba(54, 162, 235, 0.5)', 
	               	'rgba(255, 206, 86, 0.5)', 
	               	'rgba(75, 192, 192, 0.5)', 
	               	'rgba(153, 102, 255, 0.5)', 
	               	'rgba(255, 159, 64, 0.5)'
               ],
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
              	text: '월별 총 회원관리'
              }
            
         }
      });
      
      
  }
  
  function getGraph2(){
	  var jsonData2 = ${list2};
      var jsonObject2 = JSON.stringify(jsonData2);
      var jData2 = JSON.parse(jsonObject2);

      console.log(jData2);
      var labelList = new Array();
      var valueList = new Array();
      
      for (var i = 0; i < jData2.length; i++) {
          var d = jData2[i];
          labelList.push(d.month);
          valueList.push(d.count);
       }
      
      new Chart(document.getElementById("myAreaChart2"), {
          type: "pie",
          data: {
             labels : labelList,
             datasets : [ {
                label : "총 상품수",
                data : valueList,
                backgroundColor: [
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)'
                ],
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
               	text: '월별 총 상품관리'
               }
             
          }
       });
  }
  
  function getGraph3(){
	  var jsonData3 = ${list3};
      var jsonObject3 = JSON.stringify(jsonData3);
      var jData3 = JSON.parse(jsonObject3);

      console.log(jData3);
      var labelList = new Array();
      var valueList = new Array();
      
      for (var i = 0; i < jData3.length; i++) {
          var d = jData3[i];
          labelList.push(d.month);
          valueList.push(d.count);
       }
      
      new Chart(document.getElementById("myAreaChart3"), {
          type: "line",
          data: {
             labels : labelList,
             datasets : [ {
                label : "총 구매수",
                data : valueList,
                backgroundColor: [
                	'rgba(249, 232, 235, 0.5)'
                ],
                borderColor:[
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)'
                	
                ],
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
               	text: '월별 총 구매관리'
               }
             
          }
       });
  }
  
  function getGraph4(){
	  var jsonData4 = ${list4};
      var jsonObject4 = JSON.stringify(jsonData4);
      var jData4 = JSON.parse(jsonObject4);

      console.log(jData4);
      var labelList = new Array();
      var valueList = new Array();
      
      for (var i = 0; i < jData4.length; i++) {
          var d = jData4[i];
          labelList.push(d.month);
          valueList.push(d.count);
       }
      
      new Chart(document.getElementById("myAreaChart4"), {
          type: "bar",
          data: {
             labels : labelList,
             datasets : [ {
                label : "총 매출수",
                data : valueList,
                backgroundColor: [
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)',
                	'rgba(255, 99, 132, 0.5)', 
                	'rgba(54, 162, 235, 0.5)', 
                	'rgba(255, 206, 86, 0.5)', 
                	'rgba(75, 192, 192, 0.5)', 
                	'rgba(153, 102, 255, 0.5)', 
                	'rgba(255, 159, 64, 0.5)'
                ],
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
                      stepSize: 50000,
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
               	text: '월별 총 매출관리'
               }
             
          }
       });
  }
	</script>
<style>
	table{
		table-layout: fixed;
	}
	
	td{
		overflow: hidden;
		text-overflow: ellipsis; 
		white-space: nowrap;
	}
	
	@media only screen and (max-width:768px) {
		#wrapper {width:100%; overflow: hidden; font-size:1em;}
		.col1 {
		    display: none;
		    visibility: hidden;
		    width: 0%;
		}
	}
</style>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="./common/adminHeader.jsp" />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="./common/toolbarHeader.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    
                    <div class="row">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-6 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">
												최근 주문 내역
                                            </div>
                                            <div class="h8 mb-0 font-weight-bold text-gray-800">
	                                            <table class="table table-hover">
	                                           		<tr>
	                                            		<td>고객명</td>
	                                            		<td>상품명</td>
	                                            		<td class="col1">주문 날짜</td>
	                                           		</tr>
                                            		<c:forEach items="${recentOrder }" var="orders">
                                            		<tr>
                                            			<td>${orders.mid }</td>
                                            			<td>${orders.pname }</td>
                                            			<td class="col1"><fmt:formatDate value="${orders.oregdate }" pattern="yyyy-MM-dd"/></td>
                                            		</tr>
                                            		
                                            		</c:forEach>
                                            	</table>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">
												TOP3 주문 내역
                                            </div>
                                            <div class="h8 mb-0 font-weight-bold text-gray-800">
	                                            <table class="table table-hover">
	                                           		<tr>
	                                            		<td class="col1">Top3</td>
	                                            		<td>판매수</td>
	                                            		<td>상품명</td>
	                                            		<td class="col1">카테고리</td>
	                                            		<td class="col1">상품 태그</td>
	                                           		</tr>
                                            		<c:forEach items="${topThreeOrder}" var="top" varStatus="status">
                                            		<tr>
                                            			<td class="col1">${status.count}</td>
                                            			<td>${top.cnt }</td>
                                            			<td>${top.pname }</td>
                                            			<td class="col1">${top.pcate }</td>
                                            			<td class="col1">${top.ptag }</td>
                                            		</tr>
                                            		</c:forEach>
                                            	</table>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                        <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">총 회원수(월별)</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                	<canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                        
                       <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">총 상품수(월별)</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                	<canvas id="myAreaChart2"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                    	<div class="col-lg-6 mb-4">
                            
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">총 구매수(월별)</h6>
                                </div>
                                <div class="card-body">
                                	<canvas id="myAreaChart3"></canvas>
                                </div>
                            </div>
                        </div>

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">총 매출수(월별)</h6>
                                </div>
                                <div class="card-body">
                                	<canvas id="myAreaChart4"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="./common/footer.jsp" />
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</body>

</html>