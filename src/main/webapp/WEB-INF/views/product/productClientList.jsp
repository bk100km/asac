<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
     
    </head>
    <body>
    <jsp:include page="../common/clientHeader.jsp" flush="false" />
  
        <!-- Section-->	
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center ">
                
					
					<c:forEach var="product" items="${list}">
	                    <div class="col mb-5 productlist">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <a href="../cl/dt?pcode=${product.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}">
	                            <img class="card-img-top" src="/asac/resources/image/product/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
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
	                            <!-- Product actions-->
	                    
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
            	<form name="search" action="/asac/pr/cl/li?">
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
