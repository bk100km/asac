<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
    
     <style>
 ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.rf-pinwheel-tiles .rf-pinwheel-item {
   

    list-style-type: none;

    overflow: hidden;
}
.large-4 {
    flex-basis: 33.33333%;
    max-width: 33.33333%;
}
.column {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    min-width: 0;
}     
     
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.rf-pinwheel-tiles {
    display: flex;
    flex-wrap: wrap;
    margin: 0;
}



.as-pinwheel15-section  {
  

    margin-top: 30px;
    text-align:center;
  
}

.btn {
    display: inline-block;
    min-width: 112px;
    padding: 11px 31px;
    font-size: 16px;
    line-height: 26px;
    text-align: center;
    vertical-align: top;
    border: 1px solid #E1B771 !important;
    border-radius: 26px;
    background-color: #E1B771 !important;
    background-image: linear-gradient(280deg,#fb5a72,#E1B771 !important);
    color: #fff;
    font-weight: 500;
}
h3 {
	text-align : center;


}
.productlist{
  	margin-top:30px;
  	margin-bottom:30px;


}   

.card-img-top{

    width: 330px; 
    height: 400px;  
    max-width: 100%; 
    height:auto;
    margin-left:12px;

}
.group_btn {
          
            opacity: 0.3;
            
          

}

.btn_cart{
    
		color: black;
 		width:40px;
        height:40px;
        font-size: 2rem;
         position:relative;
  
        left:46.7%;
        bottom:20px;
        transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        cursor: pointer;
       
        
  



}


h2{
    display: inline-block;
    color:black !important;
    font-weight : bold !important;
	min-width: 10px;
	padding: 8px 30px;
	font-size: 13px;
	line-height: 20px;
	text-align: center;
	vertical-align: top;
	border-radius: 100px;

	background-color:#dcdcdc !important;
	opacity: 0.3;
	background-image: linear-gradient(280deg, #fb5a72, #E1B771 !important);
	
	font-weight: 500;
	
	margin-left:520px;
	
}

     </style>
    </head>
    <body>
    <jsp:include page="../common/clientHeader.jsp" flush="false" />
  
        <!-- Section-->	
        <section class="py-5">
            <div class="container">
      
                        	<h2>#${param.ptag}</h2>
	                     <div class="col mb-5 productlist">
	                        <div class="card">
	                        <ul class="rf-pinwheel-tiles">
	                             
       
	                        <c:forEach var="product" items="${proClientListlist}">
	                            <!-- Product image-->
	                            <li class="rf-pinwheel-item column large-4" data-autom="pinwheel15-tile3">
	                           <div class="as-pinwheel15-section">
	                <div class= as-pinwheel-tile>
	                            <a href="../cl/dt?pcode=${product.pcode}&ptag=${param.ptag}&nowPage=${param.nowPage}">
	                            <img class="card-img-top" src="/asac/resources/image/product/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
	                            </a>
	                            <div class="group_btn"><button type="button" class="btn_cart"><span class="glyphicon glyphicon-shopping-cart"></span></button> <!----> <!----></div>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${product.pname}</h5>
	                                    <!-- Product price-->
	                                    <fmt:formatNumber value="${product.pprice}" pattern="#,###,###원"/>
	                                </div>
	                                </div>
	                            </div>
	                            </div>
	                            </li>
	                             </c:forEach>
	                            <!-- Product actions-->
	                          </ul>
	                        </div>
	                    </div>
                   
                </div>
        
            	
		<div style="display: block; text-align: center;">
	<ul class="pagination">			
		<c:if test="${paging.startPage != 1 }">
		<li>
			<a href="/asac/pr/cl/li?pctag=${param.ptag}&nowPage=${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
			&laquo;</span></a>
		</li>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
				<li class="active">	<span>${p}<span class="sr-only">(current)</span></span></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li><a href="/asac/pr/cl/li?ptag=${param.ptag}&nowPage=${p}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/asac/pr/cl/li?ptag=${param.ptag}}&nowPage=${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
      </a>
		</c:if>
  	</ul>
  	</div>
  	       </section>
     		
        <jsp:include page="../common/footer.jsp" flush="false" /> 

        
    </body>
</html>
