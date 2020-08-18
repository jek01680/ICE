<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.search input {
	width: 150px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript">
	$(function(){
		$("#BtnUpload").click(function(){
			$("form[name=cardUplodFrm]").attr("action", "<c:url value='/companyCard/comCardUpload.do' />").submit();				
		});
		
	});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">파일 업로드</h1>

		
	</div>

	<!-- Content Row -->
	<!-- https://shinsunyoung.tistory.com/71 -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height:fit-content; min-height:650px;  width: 99%;padding: 0px 0px 10px 0px;">
				<!-- Card Header - Dropdown -->
				<form name="cardUplodFrm" action="<c:url value="/excel.do"/>"
					method="POST" enctype="multipart/form-data">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">법인카드</h6>
						<div style="float: right">
							<input type="file" name="file" value="파일 선택" > 
							
						</div>
					</div>

					<!-- Card Body -->
					<div class="card-body">
						<div  style="overflow: scroll; overflow-x: scroll; height: 630px;">
							<table class="table table-bordered table-hover" id="dynamicTable" style="width: 1770px; " >
								<thead>
									<tr>
										<th style="width: 7%">카드사</th>
										<th style="width: 15%">카드번호</th>
										<th style="width: 8%">사원번호</th>	
										<th style="width: 10%">사용금액</th>
										<th style="width: 13%">사용처</th>
										<th style="width: 10%">사용일</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
									<c:set var="i" value="1" />
									<c:forEach var="data" items="${datas }">

										<tr>
											<td>${data.company }
												<input type="hidden" name="comCardItmes[${i }].company" value="${data.company }"> 
											</td>
											<td>${data.cardNo }
												<input type="hidden" name="comCardItmes[${i }].cardNo" value="${data.cardNo }"> 
											</td>
											<td>${data.memNo }
												<input type="hidden" name="comCardItmes[${i }].memNo" value="${data.memNo }"> 
											</td>
											<td>${data.price }
												<input type="hidden" name="comCardItmes[${i }].price" value="${data.price }"> 
											</td>
											<td>${data.usePlace }
												<input type="hidden" name="comCardItmes[${i }].usePlace" value="${data.usePlace }"> 
											</td>
											<td>${data.useDate }
												<input type="hidden" name="comCardItmes[${i }].useDate" value=" ${data.useDate }">
											</td>
										</tr>
										<c:set var="i" value="${i+1 }" />
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
					<div style="float: right; margin-right: 20px;">
						<input type="submit"value="파일 내역 보기" class="btn btn-success"/> 
						<input type="button" id="BtnUpload" class="btn btn-info" value="사용내역  DB 업로드">
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

