<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
    
    
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
    background-color: #f2f2f2;
    border: 5px solid #fff;
    list-style-type: none;
    border-radius: 20px;
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



.as-pinwheel15-section .as-pinwheel-tile {
    padding: 40px 40px 34px;
    border: 5px solid #fff;
    max-width: 100%;
    background-color: #f5f5f7;
    text-align: center;
    box-sizing: border-box;
}
.as-pinwheel-tile {
    line-height: 17px;
    position: relative;
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

     
     </style>
    </head>
    <body>
    <jsp:include page="../common/clientHeader.jsp" flush="false" />
  
        <!-- Section-->	
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center ">
                
					
					
	                    <div class="col mb-5 productlist">
	                        <div class="card">
	                        <ul class="rf-pinwheel-tiles">
	                        
       
	                        <c:forEach var="product" items="${proClientListlist}">
	                            <!-- Product image-->
	                            <li class="rf-pinwheel-item column large-4" data-autom="pinwheel15-tile3">
	                           <div class="as-pinwheel15-section as-pinwheel15-smalltile as-pinwheel15-smalltileleft as-pinwheel15-tile3 as-util-relatedlink relatedlink">
	                <div class= as-pinwheel-tile>
	                            <a href="../cl/dt?pcode=${product.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}">
	                            <img class="card-img-top" src="/asac/resources/image/product/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" width="266" height="291" />
	                            </a>
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
            </div>
            	<form name="search" action="/asac/pr/cl/li">
						<div  align="center">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="pcode" <c:if test="${param.items eq 'pcode'}"> selected="selected"</c:if>>상품코드</option>
								<option value="pname"<c:if test="${param.items eq 'pname'}"> selected="selected"</c:if>>상품이름</option>
						</select>
						<input name="text" type="text" class="selecttext" <c:if test="${param.text ne null}">value="${param.text}"</c:if>/> 
						<input type="submit" id="btnAdd" class="btn btn-outline-dark"  value="검색 " />
						<input type="hidden" name="nowPage" value="1"/>
						<input type="hidden" name="pcate" value="${param.pcate}"/>
						</div>
		</form>
		<div style="display: block; text-align: center;">
	<ul class="pagination">			
		<c:if test="${paging.startPage != 1 }">
		<li>
			<a href="/asac/pr/cl/li?pcate=${param.pcate}&items=${param.items}&text=${param.text}&nowPage=${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
			&laquo;</span></a>
		</li>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
				<li class="active">	<span>${p}<span class="sr-only">(current)</span></span></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li><a href="/asac/pr/cl/li?pcate=${param.pcate}&items=${param.items}&text=${param.text}&nowPage=${p}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/asac/pr/cl/li?pcate=${param.pcate}&items=${param.items}&text=${param.text}&nowPage=${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
      </a>
		</c:if>
  	</ul>
  	</div>
  	       </section>
     		
        <jsp:include page="../common/footer.jsp" flush="false" /> 

        
    </body>
</html>
