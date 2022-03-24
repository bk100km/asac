<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>상세페이지</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >






 <script type="text/javascript">   

 function openTextarea()  {
	 	
	 const textarea = document.getElementById("myDiv");
	 if(textarea.style.display == 'none'){
		 textarea.style.display = ''
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


function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
    obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
}



		  
</script>






   </head>
    <body>
<jsp:include page="../common/clientHeader.jsp" flush="false" />
    

        
        <section class="py-5" id ="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img src="/asac/resources/image/product/${proDetail.pfile}"  width="500" height="500"  title="${proDetail.pname}" alt="${proDetail.pcontent}" /></div>
                    <div class="col-md-6">

                        <h1 class="display-5 fw-bolder">${proDetail.pname}</h1>
                             <form name="reser" method="post">
                             <label class="text-center me-2">수량</label><input class="form-control text-center" id="inputQuantity" name="inputQuantity" type="number" min="1" max="30" value="1" style="max-width: 8rem" onclick = "total(this.id)" />
                                     <input name="p_num" type="hidden" value="${proDetail.pcode}">
                            
                        <div class="fs-5 mb-5">
                            <span><fmt:formatNumber value="${proDetail.pprice}" pattern="#,###,###원"/></span>
            
                        </div>
                        
            			<label class="text-center me-2">총가격:</label><input type="text" id ="totalPrice" value="${proDetail.pprice}원" onkeyup="inputNumberFormat(this);"  disabled/><div></div>
            			
                            <button class="btn btn-outline-dark" type="submit" onclick="">바로 구매</button>&nbsp;
                            <button class="btn btn-outline-dark" type="submit" onclick="">장바구니</button>
                                  </form>
      </div>
                
<input type="hidden" name="check" value="check"/>     

                     
                        </div>

                    </div>

                <br/>
                <div>
               <input class="btn btn-outline-dark" type="button" value="상품목록" onclick="location.href='/asac/pr/cl/li?pcate=${proDetail.pcate}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}'">
                </div>
               <br/><br/><br/><br/><br/>
  
        </section>
        
        
       

<nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
  <ul class="nav nav-pills">
    <li class="nav-item">
      <a class="nav-link" href="#scrollspyHeading1">상품설명</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#scrollspyHeading2">리뷰</a>
    </li>
 	 </ul>
	</nav>
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
<col style="width:80px;">
<col style="width:300px;">
<col style="width:51px;">
<col style="width:77px;">
<col style="width:40px;">
<col style="width:80px;">
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
			<tr id="${review.rnum}" onclick= "btnActive(this.id)">
			
				<td>${review.rnum}</td>
				
			    <td   style="text-align: left;" >${review.rtitle}</td>
			  
				<td>${review.mid}</td>
	
				<td>${review.rdate}</td>
			

			</tr>
		<tr style="display: none;" id="${review.rnum}test">

     <th> <img src="/asac/resources/image/product/${proDetail.pfile}" width="100" height="100"   alt="${proDetail.pcontent}" >
          ${review.rcontent}</th>


     <td colspan="3">

     </td>

</tr>

			
   </c:forEach>
		</table>
		
				<hr/></hr><br/>	
				
 <button type="button" class="btn btn-primary" style="line-height:30px; width:130px;  text-align: center; float: right; font-size: 13px;"  onclick="openTextarea()">후기쓰기</button>
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
		<form action="reviewWrite.rv" method="post"
			enctype="multipart/form-data" name="boardform">

			<div class="form-group">
				<label>id</label> <input type="text" name="BOARD_NAME"
					id="BOARD_NAME" class="form-control" disabled
					required="required" />

				<label>평점</label> <select class="form-control" name="rate">
					<option value="5">★★★★★</option>
					<option value="4">★★★★</option>
					<option value="3">★★★</option>
					<option value="2">★★</option>
					<option value="1">★</option>
				</select> <label>제목</label> <input name="BOARD_SUBJECT" type="text"
					id="BOARD_SUBJECT" class="form-control" required="required" />
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea id="BOARD_CONTENT" name="BOARD_CONTENT" rows="7"
					required="required" class="form-control"></textarea>
			</div>

			<div>
				<label for="formFile" class="form-label">사진업로드</label> <input
					class="form-control" type="file" name="BOARD_FILE"
					onchange="check(this)" accept=".gif, .jpg, .png">
			</div>


			<section id="bottomButton" style="text-align: center;">
				<input type="button" class="btn btn-outline-dark" value="등록" onclick="javascript:checkFile()">&nbsp;&nbsp;
				<input type="reset" class="btn btn-outline-dark" value="다시쓰기" />&nbsp;
				
				
<c:if test= "${param.text != null and param.text != null}"> 
    <a href="reviewList.rv?page=${param.page}&items=${param.items}&text=${param.text}"
		class="btn btn-outline-dark">목록</a>
		</c:if>
<c:if test= "${param.text == null and param.text == null}">
		 <a href="reviewList.rv?page=${param.page}"
		class="btn btn-outline-dark">목록</a>
		</c:if>


			</section>

		</form>


	</div>



        <jsp:include page="../common/footer.jsp" flush="false" /> 
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    </body>
    
</html>
