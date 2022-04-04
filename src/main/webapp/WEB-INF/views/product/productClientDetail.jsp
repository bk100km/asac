<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>상세페이지</title>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

 <script>   

 function openTextarea()  {
	 	
	 const textarea = document.getElementById("myDiv");
	 if(textarea.style.display == 'none'){
		
	    if("${mid}"== ""){
				alert("로그인하세요.");
				$("#mid").focus();
				return;
		 
		 
	    }else{ 
		 textarea.style.display = '';
		 document.getElementById("myDiv").scrollIntoView(true);
				}
		 
		 
	 }
 
		
		  
		  else{
			  textarea.style.display = 'none'
		  }
		  }
 
 
 
function btnActive(clicked_id)  {
	
	
	 const content = document.getElementById(clicked_id+"test");
	 if(content.style.display == 'none'){
		 content.style.display = '';
		 }
		  
		  else{
			  content.style.display = 'none';
		  }
		  }
		  
		  
function total(clicked_id)	{

	var sum = document.getElementById(clicked_id).value;
	var sum = sum * ${proDetail.pprice};
	document.getElementById("totalPrice").value = sum.toLocaleString('ko-KR')+"원";
	
	
}





function check(input) {
		if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
			alert("파일 사이즈가 10mb 를 넘습니다.");
			input.value = null;
		}
	}





function fileUpload(){
	var rfile = new FormData($("#reviewform")[0]);
    var sfileZoneText = "";
	alert("나온다!");
     $.ajax({
         url : "/asac/re/cl/sF"
       , type : "POST"
       , data: rfile
       , async: false
       , cache: false
       , processData : false
       , contentType : false
       , success:function(rfile) {
           alert("성공하였습니다.");
          
       }
       ,error: function (jqXHR) 
       { 
           alert("실패하셨습니다."); 
       }
   });
}













		  
</script>
<style>





.container {
    margin-left: auto;
    margin-right: auto;
    width: 980px;
}


.column {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    min-width: 0;
}

.large-4 {
}

.name{
    font-size: 32px;
    font-weight: 600;
    letter-spacing: .004em;


}

.rc-prices, .rc-prices-inline {
    padding-bottom: 10px;
}
.rc-prices, .rc-prices-inline, .rf-pdp-acmiprice {
    margin-top: 14px;
}
.rc-prices {
    font-size: 20px;
    line-height: 1.47059;
    font-weight: 400;
    letter-spacing: .009em;
    font-family: SF Pro Display,SF Pro Icons,AOS Icons,Helvetica Neue,Helvetica,Arial,sans-serif;
}



.column {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    min-width: 0;
}


.content{
    float: right;
    text-align: right;
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
.colum-10 {

	margin-top: 190px;

}

.contents-menu-list:after {
    content: ' ';
    display: block;
    clear: both;
}



.contents-menu-list .tab-menu-belt {
    display: table;
    table-layout: fixed;
    width: 100%;
    margin: 0 auto;
    height: auto;
    font-size: 0;
    text-align: center;
    background: #fff;
}
.contents-menu-list .tab-menu-belt .tab-menu {
    display: table-cell;
    max-width: 160px;
    vertical-align: middle;
    font-size: 0;
}




.contents-menu-list .tab-menu-belt .tab-menu .linker {
    display: block;
    height: 72px;
    color: #111;
    font-size: 16px;
    line-height: 72px;
    font-weight: 500;
    text-align: center;
}



.seller_content{
    position: relative;
    display: inline-block;
    max-width: 797px;
    margin-top: 30px;
    margin-bottom: 30px;
    padding: 8px 10px;
    background-color: #f1f3f5;
    border-radius: 4px;
    vertical-align: top;
}






</style>




   </head>
 <body>
     
     
      <c:set var = "id"  value = "${aid}"/>
	<c:choose>
		<c:when test="${id != null}">
<%-- 			<jsp:include page="../common/adminheader.jsp" flush="false" /> --%>

		
			</c:when>
	    <c:otherwise>
			<jsp:include page="../common/clientHeader.jsp" flush="false" />
		     
		</c:otherwise>
	</c:choose>





        <section class="py-5" id ="py-5">
            <div class="container">
            <div class="column large-4 small-12">
                <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="column large-7 large-offset-1">
                    <div class="col-md-6"><img src="/asac/resources/image/product/${proDetail.pfile}"  width="500" height="500"  title="${proDetail.pname}" alt="${proDetail.pcontent}" /></div>
                    <div class="col-md-6">
                 </div>
                 </div>
                 <div class="column large-4 small-12">
                        <span class="name">${proDetail.pname}</span>
                             <form name="reser" method="post">
                             <input name="mid" type="hidden" value="${mid}">
                             <div class="rc-prices rc-prices-default">
                            <span><fmt:formatNumber value="${proDetail.pprice}" pattern="#,###,###원"/></span>
                     <hr/></hr>
                        </div>
                            
                             
                           
                             <span class="text-center me-2">구매 수량</span><input type="number" class="content form-control text-center" id="inputQuantity" name="inputQuantity" type="number" min="1" max="30" value="1" style="max-width: 8rem" onclick = "total(this.id)" />
                                     <input name="pcode" type="hidden" value="${proDetail.pcode}">
                             <hr/></hr>
                        
            
                        
                        
            			<label class="text-center me-2">총 금액:</label><input type="text" class="content" id ="totalPrice" value="${proDetail.pprice}원" onkeyup="inputNumberFormat(this);"  disabled/>
            		   <div class="colum-10">
                            <button class="btn" type="submit" onclick="">바로 구매</button>&nbsp;
                            <button class="btn" type="submit" onclick="javascript: reser.action='http://localhost:8080/asac/ca/cl/in'">장바구니</button>
                  
                            
                              <div>             
				<c:choose>
					<c:when test="${aid == mid}">
      					 <input class="btn content" type="button" value="상품목록" onclick="history.back()">   
					</c:when>
					<c:otherwise>
						 <input class="btn content" type="button" value="상품목록" onclick="location.href='/asac/pr/cl/li?pcate=${proDetail.pcate}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}'">

   					</c:otherwise>
				</c:choose>
                </div>
                            </div>
                                  </form>
      </div>
              


                <br/>
              
                
               <br/><br/><br/><br/><br/>
  
       
        
  
	
<div class="contents-menu-list" role="navigation" aria-label="Page">
	                                                                                                                                                                            
             <div class="ui_smooth_scroll"  style="user-select: none; overflow: hidden;">                                                     
                  <ul class="tab-menu-belt type-btn"  style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px); width: 431px;">
                           <li class="tab-menu"><a href="#scrollspyHeading1" class="linker" aria-selected="false" data-link-area="pdp_tab_anchor-tab" >상세 설명</a></li>
                           <li class="tab-menu"><a href="#scrollspyHeading2" class="linker" aria-selected="false" data-link-area="pdp_tab_anchor-tab" >리뷰</a></li>

                        </ul>
                    </div>    	
                    
                    
                  
                    
                    
                    
                    
                    

<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
  <h4 id="scrollspyHeading1">상품설명</h4>

<p>${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}
${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent}${proDetail.pcontent} 
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest
testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest</p>
			
<hr/></hr><br/><br/>	
		<h4 id="scrollspyHeading2">리뷰</h4>
		<table  id="example-table-1" class="table table-hover" >
		
		<colgroup>
<col style="width:100px;">
<col style="width:300px;">
<col style="width:51px;">
<col style="width:77px;">
<col style="width:40px;">

			</colgroup>
		
		
	<thead>
			<tr id="tr_top">
			    <th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
			</tr>
	</thead>
	<c:forEach var="review" items="${reviewList}">
			<tr class="what" id="${review.rnum}" onclick= "btnActive(this.id)">
			
				<td>${review.rnum}</td>
				
			    <td style="text-align: left;" >${review.rtitle}
			    
			    
			    
	           <c:if test="${aid != null}"> 
			
		 	  <button type="button" class="btn"  style="line-height:30px; width:130px;  text-align: center; float: right; font-size: 13px;" onclick="">답글쓰기</button>
      
			   </c:if>
			 
			   </td>
                 
                
				<td>${review.mid}    </td>
	
				<td>${review.rdate}</td>
			

			</tr>
		<tr style="display: none;" id="${review.rnum}test">

     <td colspan="2"> <img src="/asac/resources/image/product/${review.rfile}" width="100" height="100"   alt="${review.rfile}" >
          ${review.rcontent}</td>


		</tr>



<c:choose>
				
<c:when test="${review.ranswer != null}">
  <tr class= "sellerbox"><th class="seller">판매자</th> 
   <td class="seller_content" colspan="2"> 
    ${review.ranswer}
</td>
</c:when>
</c:choose>

 <c:if test="${aid != null}">
<td style="border-top:none;" >  <button type="button" class="btn"  style="margin-top: 20px; line-height:20px;   text-align: center; float: right; font-size: 13px;" onclick="">수정</button>
 <button type="button" class="btn"  style="margin-top: 5px;  line-height:20px;  text-align: center; float: right; font-size: 13px;" onclick="">삭제</button>
</td>
</c:if>
   </tr>
    </c:forEach>

		</table>
		    <hr/></hr>
				<br/>	
				
 <button type="button" class="btn btn-primary"  style="line-height:30px; width:130px;  text-align: center; float: right; font-size: 13px;"  onclick="openTextarea()"><span >후기쓰기</span></button>
<br/><br/>	

		<div style="display: block; text-align: center;">
		
		<ul class="pagination">		
		<c:if test="${paging.startPage != 1 }">
			
			<li>
      <a href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.reviewNowPage}">
				<li class="active">	<span>${p}<span class="sr-only">(current)</span></span></li>
				</c:when>
				<c:when test="${p != paging.reviewNowPage }">
					<li><a href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
		
		 <li>
      <a href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>

		</c:if>
		</ul>
	
  	</div>
  	
		</div>

		
		<br/><br/>	

<div class="container py-4"  id="myDiv" style="display:none;" >
	
		<br />
		<form action="/asac/re/cl/wr?pcate=${proDetail.pcate}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}" method="post"
			id="reviewform" name="reviewform">
			 
			 <label>상품이름</label>
				<input class="form-control" name="pcode" value="${proDetail.pcode} " 
					required="required"  readonly />
			 

			<div class="form-group">
				<label>id</label> <input type="text" name="mid" class="form-control"    value="${mid}" 
					required="required" readonly/>

				<label>평점</label> <select class="form-control" name="rrate">
					<option value="5">★★★★★</option>
					<option value="4">★★★★</option>
					<option value="3">★★★</option>
					<option value="2">★★</option>
					<option value="1">★</option>
				</select> <label>제목</label> <input name="rtitle" type="text"
					id="rtitle" class="form-control" required="required" />
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea id="rcontent" name="rcontent" rows="7"
					required="required" class="form-control"></textarea>
			</div>

			<div>
				<label for="formFile" class="form-label">사진업로드</label> <input
					class="form-control" type="file" name="rfile"
					onchange="fileUpload()" accept=".gif, .jpg, .png">
			</div>


			<section id="bottomButton" style="text-align: center;">
				<input type="submit" class="btn btn-outline-dark" value="등록" >&nbsp;&nbsp;
				<input type="reset" class="btn btn-outline-dark" value="다시쓰기" />&nbsp;
				
				



			</section>

		</form>

	</div>
	       </div>

                    </div>
                 </div>
                 </section>



        <jsp:include page="../common/footer.jsp" flush="false" /> 
        
    </body>
    
</html>
