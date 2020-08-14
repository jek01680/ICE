<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inc/top.jsp" />

<style>
.table td {
	width: 90px;
}

.table .registerTable {
	width: 90px;
	border: 1px solid white;
}

.register_text {
	width: 110px;
}
.search input{
	width:150px;
}

 </style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function popup(){
	var url="<c:url value='/notice/noticeDelete.do?noticeNo=${param.noticeNo}' />";
	var name="삭제하기";
	var option="width=484, height=84, top=100, left=200, location=no"
	window.open(url,name,option);
}	

$(function(){
	$("input[name=comEditBt]").click(function(){ 
		if($(this).parent().next().css('display','none')){
			$(this).parent().next().css('display','inline-block');
			//$("#comWrite").slideUp(); 
		}
		/* if($("#comEdit").show()){
			$("#comEdit").slideUp();
			$("#comWrite").slideDown();
		}
		 else if($("#comEdit").show()){
			$("#comEdit").slideUp();
			$("#comWrite").slideDown();
		} */
		
	});
	
	$('form[name=writeCommentForm]').submit(function() {
		
		if ($('#writeCon').val() == '') {
			alert('내용을 입력하세요');
			$('#writeCon').focus();
			event.preventDefault();
		}
	});
	
	$('form[name=editCommentForm]').submit(function() {
		
		if ($('#editCon').val() == '') {
			alert('내용을 입력하세요');
			$('#editCon').focus();
			event.preventDefault();
		}
	});
});	

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->
				
					<input type="hidden" name="noticeNo" value="${param.noticeNo }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href="<c:url value='/board/boardList.do'/>">
							<h6 class="m-0 font-weight-bold text-primary">공지사항 </h6>
						</a>
						
					</div>
					<br>
					<div class="card-body"style="text-align:center;">
						<span style="font-size: 25px; display: inline-block; text-align: left; vertical-align: middle;">
									[${vo.category}] ${vo.title }</span>
						<br><br>
						<p>
							<a href="#">
								<span style="font-size:14px; display: inline-block;
									text-align:left; vertical-align:middle;">
									관리자</span>
							</a><br>
							<span style="vertical-algin:middle; opacity:.4;">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd-HH:mm"/>
							</span>
							<span style="vertical-algin:middle; opacity:.4;">
								| ${vo.readcount} 읽음
							</span>
						</p>
						<span class="sp1" style="font-size:12px;">첨부파일</span> 
						<span style="font-size:12px;">
							<a href
				="<c:url value='/notice/download.do?noticeNo=${vo.noticeNo}&fileName=${vo.fileName}'/>">
							${fileInfo} 다운
							</a>
						</span>
						<span style="color:blue; font-size:12px;">${downInfo}</span>
					<br><hr>					
					
					<p class="content">
						<% pageContext.setAttribute("newLine", "\r\n"); %>
						${fn:replace(vo.content, newLine, '<br>')}
					</p>'
						
					</div>
					
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" >
						<a href="<c:url value='/notice/noticeEdit.do?noticeNo=${vo.noticeNo }'/>">
							<input type="button" value="수정" class="btn btn-primary btn-sm">
						</a> 
						<a href="javascript:popup()"> 
							<input type="button" value="삭제" class="btn btn-primary btn-sm">
						</a> 
						<a href="<c:url value='/notice/noticeList.do'/>"> 
							<input type="button" value="목록" class="btn btn-primary btn-sm">
						</a>
						<hr>
					</div>
					
					<div>
						<!-- 댓글 -->
						<div class="card-body"
							style="display: block; font-size: 13px; border: 2px solid #4e73df; border-radius: 10px;">
							<c:forEach var="comment" items="${list }">
								<p>
									<a href="#"> 
										<span style="font-size: 12px; display: inline-block; 
										text-align: left; vertical-align: middle;">
										${comment.name}
										</span>
									</a> 
										
									<span style="vertical-algin: middle; opacity: .4; font-size: 11px;">
									<fmt:formatDate value="${comment.regdate}"
										pattern="yyyy-MM-dd-HH:mm" />
									
										<%-- <c:if test="${sessionScope.identNum} == ${comment.memNo }"> --%>
										<span style="font-size: 13px; display: inline-block; 
											text-align: left; vertical-align: middle;">
											${comment.content}
										</span>
										
										<form name="DeleteCommentForm" method="post" 
											action="<c:url value='/noticeComment/noticeCommentDelete.do?no=${comment.no }'/>">
											<input type="button" name="comEditBt" style="font-size: 9px; width: 38px;" class="btn btn-primary btn-sm" value="수정">
											<button type="submit" id="comDelBt" style="font-size: 9px;" class="btn btn-primary btn-sm">삭제</button>
										</form>
											
											<div id="comEdit" style="display:none;width: 100%;" class="comEdit">
												<form name="editCommentForm" method="post" 
													action="<c:url value='/noticeComment/noticeCommentEdit.do'/>">
													
													<input type="hidden" name="noticeNo" value="${comment.noticeNo }">
													<input type="hidden" name="no" value="${comment.no }">
													<input type="hidden" name="memNo" value="${comment.memNo }">
													<div class="form-group">
														<hr>
														댓글 내용 수정<br>
														<table class="table table-borderless" id="dynamicTable">
															<colgroup>
																<col style="width:80%;"/>
																<col style="width:20%;"/>
															</colgroup>
															<thead/>
															<tbody style="font-size:11px;">
																<tr class="align_center">
																	<td>
																		<input type="text" style="width: 90%; font-size: 12px;"
																			class="form-control" name="content" 
																			id="editCon" value="${comment.content }">
																	</td>
																	<td>
																		<button type="submit" style="font-size: 9px;" id="commentBt" class="btn btn-primary btn-sm">수정</button> 
																	</td> 
																</tr>
															</tbody>
														</table>
													</div>
												</form>
											</div>
										<%-- </c:if> --%>
									</span>
								</p>
							</c:forEach>
							
							<div id="comWrite">
								<form name="writeCommentForm" method="post"
									action="<c:url value='/noticeComment/noticeCommentWrite.do'/>">
									
									<input type="hidden" name="noticeNo" value="${vo.noticeNo }">
									<input type="hidden" name="memNo" value="${vo.memNo }">
									<hr>
									댓글 입력<br>
									<div class="form-group">
										<table class="table table-borderless" id="dynamicTable">
											<colgroup>
												<col style="width:80%;"/>
												<col style="width:20%;"/>
											</colgroup>
											<thead/>
											<tbody style="font-size:11px;">
												<tr class="align_center">
													<td>
														<input type="text" id="writeCon" style="width: 90%; font-size: 12px;"
															class="form-control" name="content" placeholder="내용을 입력하세요">
													</td>
													<td>
														<input type="submit" id="commentBt" class="btn btn-primary btn-sm" value="등록"> 
													</td> 
											</tbody>
										</table>
									
									</div>
								</form>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

