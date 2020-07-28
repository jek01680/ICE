<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	$(function(){
		
		$("form[name=memRegisterFrm]").submit(function(){
			var strAll = "";
			
			$.ajax({
				url: "/member/memList.do",
				type:"POST",
				dataType:"json",
				sucess:function(res){
					strAll += "<tr>"
					strAll += "<td></td>"
					strAll += "<td></td>"
					strAll += "<td></td>"
					strAll += "<td></td>"
					strAll += "<td></td>"
					strAll += "</tr>"
					
					$("#dynamicTable").append(strAll);
				},
				error:function(xhr, status, error){
					alert(status +", "+error);
				}
			
			})
			
		});
		
		
	});
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">법인카드 조회</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/member/memList.do?searchKeyWord=all'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">법인카드 조회</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info"
							 >전체조회</button>
						</div>
						
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div class="search" style="margin-left: 10px;">
							<label for="department" style="margin-right: 20px;">부서별 조회</label>
							<select name="department">
								<!-- option 반복 -->
								<option>전체</option>
								<c:forEach var="deptvo" items="${deptList }">
									<option>${deptvo.deptName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="search">
							<label for="position" style="margin-right: 20px;">직급별 조회</label>
							<select name="position">
								<!-- option 반복 -->
								<option>전체</option>
								<c:forEach var="posvo" items="${ posList }">
									<option>${posvo.posName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="search" style="margin-right: 20px;">
							<label for="hiredate1" style="margin-right: 20px;">금액별 조회</label>
							<input type="text" name="hiredate1">
							
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">


							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>비밀번호</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>입사일</th>
										<th>부서명</th>
										<th>직급</th>
										<th>계약연봉</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
										
									<c:forEach var="vo" items="${list }">
										<tr>
											<td>${vo.memNo }</td>
											<td>${vo.name }</td>
											<td>${vo.pwd }</td>
											<td>${vo.hp1 + vo.hp2 + vo.hp3 }</td>
											<td>${vo.email1 + vo.email2 }</td>
											<td>${vo.hiredate }</td>
											<td>${vo.deptName }</td>
											<td>${vo.posName }</td>
											<td>${vo.salary }</td>										
										</tr>
									</c:forEach>
								</tbody>
						</table>
										
						</div>
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

