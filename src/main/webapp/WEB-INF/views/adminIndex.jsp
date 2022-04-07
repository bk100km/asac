<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		getGraph();
		getGraph2();
		getGraph3();
		getGraph4();
	});
  
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
          type: "polarArea",
          data: {
             labels : labelList,
             datasets : [ {
                label : "총 상품수",
                data : valueList,
                borderColor: "#0055ff",
                backgroundColor: "#3e95cd",
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
                borderColor: "#0055ff",
                backgroundColor: "#ffffff",
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
               	text: '상품별 구매관리'
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
                label : "총 구매수",
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
               	text: '상품별 구매관리'
               }
             
          }
       });
  }
	</script>
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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 통계</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Earnings (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Earnings (Annual)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
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
                                    <h6 class="m-0 font-weight-bold text-primary">총 상품수(월별)</h6>
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