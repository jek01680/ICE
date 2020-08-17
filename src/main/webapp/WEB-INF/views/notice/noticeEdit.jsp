<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

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
	
$(function(){
	$('#nList').click(function(){
		location.href
			= "<c:url value='/notice/noticeList.do'/>"
	});
	
	$('form[name=frmEdit]').submit(function(){
		if($('#title').val()==''){
			alert('제목을 입력하세요');
			$('#title').focus();
			event.preventDefault();
		}
	});

});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항 수정</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: fit-content; min-height: 800px; weight: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="frmEdit" method="post"  
					action="<c:url value='/notice/noticeEdit.do'/>"
					enctype="multipart/form-data">
					
					<input type="text" name="noticeNo" value="${param.noticeNo }">
					<input type="text" name="fileName" value="${vo.orFileName }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href="<c:url value='/notice/noticeList.do'/>">
							<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
						</a>
					</div>
					
					<!-- 분류 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
						<tr>
							<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">분류</h6>
							</td>
							<td style="width: 80%; weight: 100px; width: 500px;">
								<select name="category" class="form-control" style="width:400px;">
									<option value="전체">전체</option>
										<option value="영업">영업</option>
										<option value="기획">기획</option>
										<option value="법무">법무</option>
										<option value="마케팅">마케팅</option>
										<option value="전산">전산</option>
								</select> 
								<input type="checkbox" name="main" id="main"
								 	value="Y"> 
								<span>공지사항 메인 등록</span>
							</td>
						</tr>
						</table>
						
					</div>
					
					<!-- 제목 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;">
									<h6 class="m-0 font-weight-bold text-primary">제목</h6>
								</td>
								<td style="width:80%; width: 500px;">
									<input type="text" class="form-control" 
									name="title" id="title" value="${vo.title }"
									style="width: 400px; font-size: 14px;">
								</td>
							</tr>
						</table>
						
					</div>
					
					<!-- 첨부파일 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width: 20%;">
									<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
								</td>
								<td style="width: 80%;">
									<input type="file" id="fileName"
									name="upfile" value="${vo.orFileName}"/> <br>
									<c:if test="${!empty vo.orFileName }">
							            <span class="sp1"></span>
							            <span style="color:green;font-weight: bold">
							            	첨부파일을 새로 지정할 경우 기존 파일 ${fileInfo }는 삭제됩니다.</span>
						            </c:if>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 내용 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;">
									<h6 class="m-0 font-weight-bold text-primary">내용</h6>
								</td>
								<td style="width:80%; text-align:left;">
									<%@ include file="EditSummer.jsp" %>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 등록,취소 버튼 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<input type = "submit" class="form-control" value="등록"
							style="width: 52px; font-size: 13px;"/>
            			<input type="Button" class="form-control btList" id="nList" value="글목록"
							style="width: 60px; font-size: 13px;" onclick="location.href='<c:url value="/notice/noticeList.do"/>'"/>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

