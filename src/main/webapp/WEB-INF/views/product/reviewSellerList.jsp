<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>


function openTextarea()  {

	 const textarea = document.getElementById("myDiv");
	 const reviseForm = document.getElementById("reviseForm");
	 reviseForm.style.display = 'none';
	 if(textarea.style.display == 'none'){
		
	    if("${mid}"== ""){
				alert("로그인하세요.");
				$("#mid").focus();
				return;
		 
		 
	    }else{ 
	    
	    
		textarea.style.display = '';
		
				}
		 
		 
	 }else{
		 textarea.style.display = 'none';
	 }
	 document.getElementById("myDiv").scrollIntoView(true);
}




function openRevise(id)  {
	 

	      const reviseForm = document.getElementById("reviseForm");
	      const textarea = document.getElementById("myDiv");
	      textarea.style.display = 'none';
		
	      if(reviseForm.style.display == 'none'){
	    	  
	    	 
	    	 
	 
	     	 reviseForm.style.display = '';
	     	 const rnum = document.getElementById(id+"rnum").innerText;
	    	 const rtitles = document.getElementById(id+"rtitle").innerText;
	    	 const rtitle = rtitles.substring(0, rtitles.length - 2);
	    
	    	 const rrate =  document.getElementById(id+"rate").value
	    	 
	    	 const rcontent = document.getElementById(id+"rcontent").value;
	 
  		
	    	 
	    	 $('#revisenum').val(rnum);
	    	 $('#revisetitle').val(rtitle);
	    	 $('#revisecontent').val(rcontent);
	    	 $('#reviserate').val(rrate).prop("selected", true);
	   
	    	

	    
		
	      }else{
	    	  
	    	  reviseForm.style.display = 'none';
	    	  
	      }
		 
	      document.getElementById("reviseForm").scrollIntoView(true);
		 
		 
				}
				
				
				
function openAnswer(clicked_id)  {
		

	 const content = document.getElementById(clicked_id+"rite");

	 if(content.style.display == 'none'){
		 content.style.display = '';
		 }
		  
		  else{
			  content.style.display = 'none';
		  }
		  }
		  
		  
function openSellerRevise(clicked_id)  {
	

	 const reviseAnswer = document.getElementById(clicked_id+"Revise");
	 const reviseButton = document.getElementById(clicked_id+"Button");

	 const answerContent = document.getElementById(clicked_id+"Ranswer");
	 alert(clicked_id);
	 
	 if(reviseAnswer.style.display == 'none'){
			alert(clicked_id);
		 answerContent.style.display = 'none';
		 reviseAnswer.style.display = '';
		 reviseButton.style.display = '';
		 }
		  
		  else{
			  reviseAnswer.style.display = 'none';
			  reviseButton.style.display = 'none';
		  }
		  }
		  
function closeSellerRevise(){

		 const reviseForm = document.getElementById("reviseForm");
		 reviseForm.style.display = 'none';


}




</script>
<style>

.rebtn{
	line-height: 30px; 
	width: 130px;	
	text-align: center; 
	float: right; 
	font-size: 13px;
}


.hiddenButton{
	margin-top: 200px;
 	line-height: 20px;
  	text-align: center; 
  	float: right; 
  	font-size: 13px;


}
.answerbtn{
	line-height: 30px; 
	width: 130px; 
	text-align: center; 
	float: right; 
	font-size: 13px;
}
.ranswer{

 resize: none;

}

@media (max-width: 1024px) {
  .tabletras {
 width: 60%;
 
  
}
  .sellerbox{
   display: none;
  
  }
  .date{
 display: none;
}
.rnumber{
 display: none;

}

}


@media (max-width: 768px){
.rtitle{
width:33% !important;
}

.rwiter{

width:17% !important;


}
.answerbtn{
 display: none;
 
}
}

.bottomButton{
 	text-align: center;
 	margin-top:20px;
}

.ui_smooth_scroll{
	user-select: none; 
	overflow: hidden;
	margin-bottom:50px;
}

.tab-menu-belt {
	display: flex;
    flex-direction: row;
    width: 1010px;
    margin: 0 auto;
    }
.tab-menu{
	flex: 1;
    position: relative;
    top: 1px;
    height: 60px;
    line-height: 59px;
    text-align: center;
    display: block;
    color: #666;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.3px;
    font-family: noto sans;
    background-color: #fafafa;
    border: 1px solid #eee;
}

.titlerevise{
	text-align: left;	
}
.none1 .none2 .none6{
	display:none !important;


}   
.titlerevise{

 	text-align: left !important;	

}

.none3 .none4 {

	resize:none !important;
	resize:none !important;


}


.none5{
	border-top:none !important;

}
.div501{
	display: block !important; 
	text-align: center !important;

}
</style>    
  
  
  
</head>
<body>
				<div class="contents-menu-list" role="navigation" aria-label="Page">

						<div class="ui_smooth_scroll">
							<ul class="tab-menu-belt type-btn">

								<li class="tab-menu"><a href="#scrollspyHeading1"
									class="linker" aria-selected="false"
									data-link-area="pdp_tab_anchor-tab">상세 설명</a></li>
								<li class="tab-menu"><a href="#scrollspyHeading2"
									class="linker" aria-selected="false"
									data-link-area="pdp_tab_anchor-tab">리뷰</a></li>

							</ul>
						</div>



						<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
							data-bs-offset="0" class="scrollspy-example" tabindex="0">
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

							<hr /></hr>
							<br />
							<br />
							<h4 id="scrollspyHeading2">리뷰</h4>
							<table id="example-table-1" class="table table-hover">

								<colgroup>
									<col style="width: 100px;">
									<col style="width: 300px;">
									<col style="width: 51px;">
									<col style="width: 77px;">
									<col style="width: 40px;">

								</colgroup>


								<thead>
									<tr id="tr_top">
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
						
									</tr>
								</thead>
								<c:forEach var="review" items="${reviewList}">
									<tr class="what" id="${review.rnum}"
										onclick="btnActive(this.id)">

										<td id="${review.rnum}revisernum">${review.rnum}</td>
  										
										<td class="titlerevise"  id="${review.rnum}revisertitle" >${review.rtitle}
										
										<c:if test="${review.ranswer == null}">

												<button type="button" class="btn btn506"
													
													id="${review.rnum}w" onclick="openAnswer(this.id)">답글쓰기</button>

											</c:if>

										</td>


										<td>${review.mid}</td>

										<td class="date"><fmt:formatDate value="${review.rdate}" pattern="yyyy-MM-dd"/></td>


									</tr>
									<tr style="display: none;"  id="${review.rnum}test">

										<c:choose>
									<c:when test="${review.rfile != ''}">
										<td colspan="2"><img
											src="/resources/image/product/${review.rfile}"
											width="100" height="100" alt="${review.rfile}">
											${review.rcontent}</td>
										</c:when>
										<c:otherwise>
										
											<td colspan="2">
											${review.rcontent}</td>

										</c:otherwise>
										
										
										</c:choose>

									</tr>


								<form
								action="/re/ad/wr/${proDetail.pcode}/"
								method="post" id="updateForm" name="updateform">
								
								
							    <input type="hidden" id="sid" name="sid" value="${aid}">
							    <input type="hidden" id="rnum" name="rnum" value="${review.rnum}">
								<c:choose>
								<c:when test="${review.ranswer != null}">
										<tr class="sellerbox"  >
											<th class="seller">판매자</th>
										   <td class="seller_content" style="display:'';"  id="${review.rnum}sellerRanswer" colspan="2">
												${review.ranswer}</td>
										     <td class="hiddenContent" style="display:none;"  id="${review.rnum}sellerRevise" colspan="2"><p>
												<textarea id="ranswer" name="ranswer" class="ranswer"  cols="100" rows="7">${review.ranswer}</textarea>	
											    </p></td>
										    <td id="${review.rnum}sellerButton" style="display: none;" class="hiddenContent">	<button type="submit" class="btn hiddenButton">등록</button> </td>
									</c:when>
									<c:when test="${review.ranswer == null}">
									<tr class="sellerbox" style="display:none;"  id="${review.rnum}write"  >
										<th class="seller">판매자</th>
										<td class="seller_content"  colspan="2"><p>
												<textarea id="ranswer" name="ranswer" class="none4"  cols="100" rows="7" ></textarea>	
											</p></td>
										<td>	<button type="submit" class="btn">등록</button> </td>
										</c:when>
										
								</c:choose>

													
										<c:if test="${review.ranswer != null and aid != null}">
											<td class="none5" >
												<button type="button" class="btn" id = "${review.rnum}seller"
													onclick="openSellerRevise(this.id)">수정</button>
													
												<button type="button" class="btn"  value="${review.rnum}"onclick="location.href='/re/ad/de/${proDetail.pcode}/${review.rnum}'">삭제
												 </button>
											</td>
										</c:if>
									</form>
									</tr>
			
								</c:forEach>

							</table>
							<hr /></hr>
							<br />
						
							<br />
							<br />

							<div 	style="display: block !important; text-align: center !important;" >

								<ul class="pagination justify-content-center">
									<c:if test="${paging.startPage != 1 }">
										<li><a class="page-link"
											href="/pr/se/dt/${pcode}/${paging.startPage - 1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									
							
										
									</c:if>
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
										var="p">
										<c:choose>
											<c:when test="${p == paging.reviewNowPage}">
											<li class="page-item active">	<span class="page-link" >${p}<span class="sr-only">(current)</span></span></li>
											</c:when>
											<c:when test="${p != paging.reviewNowPage}">
												<li><a class="page-link"
													href="/pr/se/dt/${pcode}/${p}">${p}</a></li>	
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<li><a class="page-link"
											href="/pr/se/dt/${pcode}/${paging.endPage+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									
									</c:if>
								</ul>

							</div>

						</div>


						<br />
						<br />


				</div>
			</div>
	</section>

</body>
</html>