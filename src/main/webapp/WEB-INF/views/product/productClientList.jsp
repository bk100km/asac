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
	width: 4em;
	height:2em;
	font-size: 15px !important;
	text-align: center;
	border-radius: 26px !important;



}
h3 {
	text-align : center;


}
.productlist{
  	margin-top:30px;
  	margin-bottom:30px;


}   

.card-img-top{

    width: 300px; 
    height: 370px;  

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
.selecttext{
		width:15em;
        height:1.5em;
		

}
.searchdiv{
	margin-left:60%;
	margin-bottom:2%;


}

.searchform{
	width:100%;
	height:100%;

}


.txt{
		width:5em;
        height:1.5em;
}
.pagination{
	color:black !important;
}
     </style>
    </head>
    <body>
    <jsp:include page="../common/clientHeader.jsp" flush="false" />
  
        <!-- Section-->	
        <section class="py-5">
            <div class="container">
            
            <form class="searchform" id="searchForm" name="search" method="post">
						<div class="searchdiv"  align="center">&nbsp;&nbsp; 
						<select name="items" id="items" class="txt">
								<option value="sid" <c:if test="${param.items eq 'sid'}"> selected="selected"</c:if>>판매자</option>
								<option value="pname"<c:if test="${param.items eq 'pname'}"> selected="selected"</c:if>>상품이름</option>
						</select>
						<input name="text" id="text" type="text" class="selecttext" <c:if test="${param.text ne null}">value="${param.text}"</c:if>/> 
						<input type="button" id="btnAdd" class="btn btn-outline-dark" value="검색" onclick="searchAction()">
						<input type="hidden" name="nowPage" value="1"/>
						<input type="hidden" id="pcate" name="pcate" value="${param.pcate}"/>
						</div>
		</form>
      
                        	<h3> ${param.pcate}</h3>
	                     <div class="col mb-5 productlist">
	                        <div class="prodiv">
	                        <ul class="rf-pinwheel-tiles">

	                        <c:forEach var="product" items="${proClientListlist}">
	                            <!-- Product image-->
	                            <li class="rf-pinwheel-item column large-4" data-autom="pinwheel15-tile3">
	                           <div class="as-pinwheel15-section">
	                <div class= as-pinwheel-tile>
	                
	                		<c:choose>
		                    <c:when test="${param.items != null}">
	                            <a href="/pr/cl/dt/${product.pcode}/items/${param.items}/text/${param.text}/${paging.nowPage}">
	                            <img class="card-img-top" src="/resources/image/product/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
	                            </a>
	                              </c:when>
	                            <c:otherwise>
	                            <a href="/pr/cl/dt/${product.pcode}/${paging.nowPage}">
	                            <img class="card-img-top" src="/resources/image/product/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
	                            </a>
	                            </c:otherwise>
	                          
	                            </c:choose>
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
	<ul class="pagination justify-content-center">			
		<c:if test="${paging.startPage != 1 }">
		<li >
		<c:choose>
		<c:when test="${param.items != null}">
			<a class="page-link" href="/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
			&laquo;</span></a>
			</c:when>
		<c:otherwise>
			<a class="page-link" href="/pr/cl/li/${pcate}/${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
			&laquo;</span></a>
			</c:otherwise>
			</c:choose>
		</li>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
				<li class="page-item active">	<span class="page-link" >${p}<span class="sr-only">(current)</span></span></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
			<c:choose>		
		        <c:when test="${param.items != null}">
				
					<li><a class="page-link" href="/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${p}">${p}</a></li>
					</c:when>
				<c:otherwise>
					
						<li><a class="page-link" href="/pr/cl/li/${pcate}/${p}">${p}</a></li>
					</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
		<c:choose>
		 <c:when test="${param.items != null}">
		<li class="page-item">
			<a class="page-link" href="/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
    	 </li>
    	 <c:otherwise>
    	 <li class="page-item">
    	 <a class="page-link" href="/pr/cl/li/${pcate}/${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
    	 </li>
    	 </c:otherwise>
    	 
    	 
    	 
    	 	 </c:when>
    	 </c:choose>
		</c:if>
  	</ul>
  	</div>
  	       </section>

        <jsp:include page="../common/footer.jsp" flush="false" /> 

	<script>
	function searchAction() {

	if(document.getElementById("text").value ==""){
		alert("검색어를 입력해 주세요.")}
	else{	
		var form = document.getElementById("searchForm");
	    form.action = "http://localhost:8080/pr/cl/li/${pcate}"+"/items/" + document.getElementById("items").value + "/text/" + document.getElementById("text").value + "/1";
	    form.submit();
	}
	}
	</script>
        
    </body>
</html>