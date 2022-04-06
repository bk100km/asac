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

	 
	 if(reviseAnswer.style.display == 'none'){
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
  
  
  
  
</head>
<body>
				<div class="contents-menu-list" role="navigation" aria-label="Page">

						<div class="ui_smooth_scroll"
							style="user-select: none; overflow: hidden;">
							<ul class="tab-menu-belt type-btn"
								style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px); width: 431px;">
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
										<th scope="col">조회</th>
									</tr>
								</thead>
								<c:forEach var="review" items="${reviewList}">
									<tr class="what" id="${review.rnum}"
										onclick="btnActive(this.id)">

										<td id="${review.rnum}revisernum">${review.rnum}</td>
  										
										<td  id="${review.rnum}revisertitle" style="text-align: left;">${review.rtitle}
										<c:if test="${mid == review.mid and review.ranswer == null}">
										<button type="button" class="btn" style="line-height: 30px; width: 130px; 
										text-align: center; float: right; font-size: 13px;"  onclick="openRevise(this.id)" id="${review.rnum}revise">수정</button>
										 
										 <input type="hidden" id="${review.rnum}revisercontent" name="${review.rnum}revisercontent" value="${review.rcontent}">
										 <input type="hidden" id="${review.rnum}reviserate" name="${review.rnum}reviserate" value="${review.rrate}" >
										</c:if>
										
										<c:if test="${aid != null and review.ranswer == null}">

												<button type="button" class="btn"
													style="line-height: 30px; width: 130px; text-align: center; float: right; font-size: 13px;"
													id="${review.rnum}w" onclick="openAnswer(this.id)">답글쓰기</button>

											</c:if>

										</td>


										<td>${review.mid}</td>

										<td>${review.rdate}</td>


									</tr>
									<tr style="display: none;" id="${review.rnum}test">

										<td colspan="2"><img
											src="/asac/resources/image/product/${review.rfile}"
											width="100" height="100" alt="${review.rfile}">
											${review.rcontent}</td>


									</tr>




								<form
								action="/asac/re/ad/wr?pcate=${proDetail.pcate}&pcode=${proDetail.pcode}&aid=${aid}"
								method="post" id="updateForm" name="updateform">
							    <input type="hidden" id="sid" name="sid" value="${aid}">
							    <input type="hidden" id="rnum" name="rnum" value="${review.rnum}">
								<c:choose>
									<c:when test="${review.ranswer != null}">
										<tr class="sellerbox"  >
											<th class="seller">판매자</th>
										   <td class="seller_content" style="display:'';"  id="${review.rnum}sellerRanswer" colspan="2">
												${review.ranswer}</td>
												
							
							                    <td class="seller_content" style="display:none;" id="${review.rnum}sellerRevise" colspan="2"><p>
												<textarea id="ranswer" name="ranswer"  cols="100" rows="7" style="resize: none;">${review.ranswer}</textarea>	
											    </p></td>
										    <td id="${review.rnum}sellerButton" style="display:none;" >	<button type="submit" class="btn"
													style="margin-top: 200px; line-height: 20px; text-align: center; float: right; font-size: 13px;"
													>등록</button> </td>
												
												
												
												
									</c:when>

									<c:when test="${review.ranswer == null}">
									<tr class="sellerbox" style="display:none;" id="${review.rnum}write"  >
										<th class="seller">판매자</th>
										<td class="seller_content" colspan="2"><p>
												<textarea id="ranswer" name="ranswer"  cols="100" rows="7" style="resize: none;"></textarea>	
											</p></td>
										<td>	<button type="submit" class="btn"
													style="margin-top: 200px; line-height: 20px; text-align: center; float: right; font-size: 13px;"
													>등록</button> </td>
										</c:when>
										
								</c:choose>

													
										<c:if test="${review.ranswer != null and aid != null}">
											<td style="border-top: none;">
												<button type="button" class="btn" id = "${review.rnum}seller"
													style="margin-top: 20px; line-height: 20px; text-align: center; float: right; font-size: 13px;"
													onclick="openSellerRevise(this.id)">수정</button>
												<button type="button" class="btn"  value="${review.rnum}"
													style="margin-top: 5px; line-height: 20px; text-align: center; float: right; font-size: 13px;"
													onclick="location.href='/asac/re/ad/de?pcate=${proDetail.pcate}&pcode=${proDetail.pcode}&aid=${aid}&rnum=${review.rnum}'">삭제
												 </button>
											</td>
										</c:if>
									</form>
									</tr>
			
								</c:forEach>

							</table>
							<hr /></hr>
							<br />
						<c:if test="${aid == null}">
							<button type="button" class="btn btn-primary"
								style="line-height: 30px; width: 130px; text-align: center; float: right; font-size: 13px;"
								onclick="openTextarea()">
								<span>후기쓰기</span>
							</button>
							</c:if>
							<br />
							<br />

							<div style="display: block; text-align: center;">

								<ul class="pagination">
									<c:if test="${paging.startPage != 1 }">

										<li><a
											href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&aid=${aid}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
										var="p">
										<c:choose>
											<c:when test="${p == paging.reviewNowPage}">
												<li class="active"><span>${p}<span
														class="sr-only">(current)</span></span></li>
											</c:when>
											<c:when test="${p != paging.reviewNowPage }">
												<li><a
													href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${p}&cntPerPage=${paging.cntPerPage}&aid=${aid}">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">

										<li><a
											href="/asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&aid=${aid}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>

									</c:if>
								</ul>

							</div>

						</div>


						<br />
						<br />

						<div class="container py-4" id="myDiv" style="display: none;">

							<br />
							<form
								action="/asac/re/cl/wr?pcate=${proDetail.pcate}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}"
								method="post" id="writeform" name="writeform">

								<label>상품이름</label> <input class="form-control" name="pcode"
									value="${proDetail.pcode} " required="required" readonly />


								<div class="form-group">
									<label>id</label> <input type="text" name="mid"
										class="form-control" value="${mid}" required="required"
										readonly /> <label>평점</label> <select class="form-control" 
										name="rrate">
										<option id="5" value="5">★★★★★</option>
										<option id="4" value="4">★★★★</option>
										<option id="3" value="3">★★★</option>
										<option id="2" value="2">★★</option>
										<option id="1" value="1">★</option>
									</select> <label>제목</label> <input name="rtitle" type="text" id="rtitle"
										class="form-control" required="required" />
								</div>
								<div class="form-group">
									<label>내 용</label>
									<textarea id="rcontent" name="rcontent" rows="7"
										required="required" class="form-control"></textarea>
								</div>

								<div>
									<label for="formFile" class="form-label">사진업로드</label> <input
										class="form-control" type="file" id="rfile" name="rfile"
										onchange="fileUpload()" accept=".gif, .jpg, .png">
								</div>


								<section id="bottomButton" style="text-align: center;">
									<input type="submit" class="btn btn-outline-dark" value="등록">&nbsp;&nbsp;
									<input type="button" class="btn btn-outline-dark" value="취소" onclick="openTextarea()">&nbsp;&nbsp;
									<input type="reset" class="btn btn-outline-dark" value="다시쓰기" />&nbsp;





								</section>

							</form>

						</div>
						
						
					<div class="container py-4" id="reviseForm" style="display: none;">

							<br />
							<form
								action="/asac/re/cl/up?pcate=${proDetail.pcate}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}"
								method="post" id="updateform" name="updateform">

								<label>리뷰번호</label> <input class="form-control"  id="revisenum" name="revisenum"
									value="" required="required" readonly />


								<div class="form-group">
									<label>id</label> <input type="text" name="mid"
										class="form-control" value="${mid}" required="required"    
										readonly /> <label>평점</label> <select class="form-control" id="reviserate"
										name="reviserate">
										<option value="5">★★★★★</option>
										<option value="4">★★★★</option>
										<option value="3">★★★</option>
										<option value="2">★★</option>
										<option value="1">★</option>
									</select> <label>제목</label> <input name="revisetitle" type="text" id="revisetitle"
										class="form-control" required="required" />
								</div>
								<div class="form-group">
									<label>내 용</label>
									<textarea id="revisecontent" name="revisecontent" rows="7"
										required="required" class="form-control"></textarea>
								</div>

								<div>
									<label for="formFile" class="form-label">사진업로드</label> <input
										class="form-control" type="file" id="rfile" name="rfile"
										onchange="fileUpdate()" accept=".gif, .jpg, .png">
								</div>


								<section id="bottomButton" style="text-align: center;">
									<input type="submit" class="btn btn-outline-dark" value="등록">&nbsp;&nbsp;
									<input type="button" class="btn btn-outline-dark" value="취소" onclick="closeSellerRevise()"> &nbsp;&nbsp;
									<input type="reset" class="btn btn-outline-dark" value="다시쓰기" />&nbsp;

								</section>

							</form>

						</div>
									
						
						
					</div>

				</div>
			</div>
	</section>

</body>
</html>