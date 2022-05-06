<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>

 $(window).scroll(function(){
 	if ($(this).scrollTop() > 500){
 		$('.btn_gotop').show();
 	} else{
 		$('.btn_gotop').hide();
 	}
 });
 $('.btn_gotop').click(function(){
 	$('html, body').animate({scrollTop:0},400);
 	return false;
 });
 
 
 </script> 
<style>     
ul{
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



.container {
  

    margin-top: 10px;
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
	margin-top:18px !important;
	text-align : center;


}
.productlist{
  	margin-top:30px;
  	margin-bottom:30px;


}   

.card-img-top{

    width: 100px; 
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


	margin-bottom:5%;


}

.searchform{
	magin-left:60%;


}


.txt{
		width:6em;
        height:1.5em;
}
.pagination{
	color:black !important;
}


.text {
    width: 100%;
}
@media (max-width: 768px){

.row{
 margin-bottom:20px;
 width:340px !important;

}
 .searchform{
 width:110%;
 margin-left:-20px;
 }
 .selecttext{
 width:40%;
 }
.productlist{
	
	margin-left:60px !important;
}
.container{
	 width:420px !important;


}

}
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px; 
	right:10px; / 
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}


     </style>
    </head>
    <body>
    
               <a href="#" class="btn_gotop">
  <span class="glyphicon glyphicon-chevron-up">top
  </span></a>

    <jsp:include page="../common/clientHeader.jsp" flush="false" />
  
  
  
  
        <!-- Section-->	
        
       <h3>${pcate}</h3>

        <section class="py-5">
            <div class="container">
            
            <form class="searchform" id="searchForm" name="search" method="post">
						<div class="searchdiv"  align="center">&nbsp;&nbsp; 
						<select name="items" id="items" class="txt">
								<option value="pname"<c:if test="${param.items eq 'pname'}"> selected="selected"</c:if>>상품이름</option>
								<option value="sid" <c:if test="${param.items eq 'sid'}"> selected="selected"</c:if>>판매자</option>		
						</select>
						<input name="text" id="text" type="text" class="selecttext" <c:if test="${param.text ne null}">value="${param.text}"</c:if>/> 
						<input type="button" id="btnAdd" class="btn btn-outline-dark" value="검색" onclick="searchAction()">
						<input type="hidden" name="nowPage" value="1"/>
						<input type="hidden" id="pcate" name="pcate" value="${param.pcate}"/>
						</div>
		</form>
      			
                        	
	                   
	                        </div>
	                        

	                      
	                            <!-- Product image-->
	                             
	                           <div class="container productlist">
	                <div class="row" >
	                <c:forEach var="product" items="${proClientListlist}">
	                	<div class="col-md-6 col-lg-4">
	                		<c:choose>
		                    <c:when test="${param.items != null}">
	                            <a class="img-prod" href="<%= request.getContextPath() %>/pr/cl/dt/${product.pcode}/items/${param.items}/text/${param.text}/${paging.nowPage}">
	                            <img class="card-img-top img-fluid" src="/resources/productUpload/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
	                            </a>
	                              </c:when>
	                            <c:otherwise>
	                            <a class="img-prod" href="<%= request.getContextPath() %>/pr/cl/dt/${product.pcode}/${paging.nowPage}">
	                            <img class="card-img-top img-fluid" src="/resources/productUpload/${product.pfile}" title="${product.pname}" alt="${product.pcontent}" />
	                            </a>
	                            </c:otherwise>
	                          
	                            </c:choose>
	               
	                            
	                            <!-- Product details-->
	                            <div class="card-body">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${product.pname}</h5>
	                                    <!-- Product price-->
	                                    <fmt:formatNumber value="${product.pprice}" pattern="#,###,###원"/>
	                                </div>
	                                </div>
	                                </div>
	                                    </c:forEach>
	                            </div>
	                            </div>
	                        
	                       
	                         
	                            <!-- Product actions-->
	                         
	         
        
            	
		<div style="display: block; text-align: center;">
	<ul class="pagination justify-content-center">			
		<c:if test="${paging.startPage != 1 }">
		<li >
		<c:choose>
		<c:when test="${param.items != null}">
			<a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
			&laquo;</span></a>
			</c:when>
		<c:otherwise>
			<a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/${paging.startPage - 1}" aria-label="Previous"> <span aria-hidden="true">
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
				
					<li><a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${p}">${p}</a></li>
					</c:when>
				<c:otherwise>
					
						<li><a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/${p}">${p}</a></li>
					</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
		<c:choose>
		 <c:when test="${param.items != null}">
		<li class="page-item">
			<a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/items/${param.items}/text/${param.text}/${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
    	 </li>
    	 <c:otherwise>
    	 <li class="page-item">
    	 <a class="page-link" href="<%= request.getContextPath() %>/pr/cl/li/${pcate}/${paging.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
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
	    form.action = <%= request.getContextPath() %>"/pr/cl/li/${pcate}"+"/items/" + document.getElementById("items").value + "/text/" + document.getElementById("text").value + "/1";
	    form.submit();
	}
	}
	</script>
        
    </body>
</html>