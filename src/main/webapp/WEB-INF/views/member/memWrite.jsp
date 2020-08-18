<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

<style>
.table td {
	width: 90px;
}
.table .registerTable {
	width: 110px;
	border: 1px solid white;
	
}

.register_text{
	width:120px;
	float: left;
}
.search input{
	width:120px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("form[name=memRegisterFrm]").submit(function(){
			if ($('#dynamicTable tr').length == 1) {
				alert("사원 정보를 입력해주세요");
				event.preventDefault();
			}
			
			
			
		});
		
	
		$( "#memHiredate" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
		
	});
	
	var idx = 1;
	function memberTableCreate(){
		var str = '';
		
		
		var NmemNo = $("#memNo").val();
		var NmemName = $("#memName").val();
		var NmemSsn1 = $("#memSsn1").val();
		var NmemSsn2 = $("#memSsn2").val();
		var NmemHiredate = $("#memHiredate").val();
		var NmemDepart = $("#memDepart").val();
		var NmemPosi = $("#memPosi").val();
		var NmemSalary = $("#memSalary").val();
		
		var NmemDepartName = $("#memDepart option:selected").html();
		var NmemPosiName = $("#memPosi option:selected").html();
		
		var NmemSalary = $("#memSalary").val();
		var String_NmemSalary = numberFormat(NmemSalary);
		
		if(NmemNo.length == 0 || NmemName.length == 0 || NmemSsn1.length == 0 || NmemSsn2.length == 0 ||
				NmemHiredate.length == 0|| NmemDepart.length == 0 || NmemPosi.length == 0 || NmemSalary.length == 0){
			alert("모든 정보를 입력해주세요");
			return false;
		}		
		
		
		if(NmemNo.length !=6){
			alert("사원번호는 부서코드+직급코드 6자리 입니다")
			return false;
		}
		if(NmemSsn1.length !=6){
			alert("주민번호 앞은 6자리 입니다")
			return false;
		}
		if(NmemSsn2.length !=7){
			alert("주민번호 뒤는 7자리 입니다")
			return false;
		}
	
	
		str += '<tr>';
		str += '<td><input type="text" name="memItems['+idx+'].memNo" class="registerTable" value="' +NmemNo+ '"/></td>';
		str += '<td><input type="text" name="memItems['+idx+'].name" class="registerTable" value="' +NmemName+ '"/></td>';
		str += '<td><input type="text" name="memItems['+idx+'].ssn1" class="registerTable" value="' +NmemSsn1+ '"/></td>';
		str += '<td><input type="text" name="memItems['+idx+'].hiredate" class="registerTable" value="' +NmemHiredate+ '"/></td>';
		str += '<td><input type="text" class="registerTable" value="' +NmemDepartName+ '"/></td>';
		str += '<td><input type="text" class="registerTable" value="' +NmemPosiName+ '"/></td>';
		str += '<td><input type="text" class="registerTable" value="' +String_NmemSalary+ '만원"/></td>';
		
		str += '<input type="hidden" name="memItems['+idx+'].pwd" class="registerTable" value="' +NmemSsn1+ '"/>';
		str += '<input type="hidden" name="memItems['+idx+'].ssn2" class="registerTable" value="' +NmemSsn2+ '"/>';
		str += '<input type="hidden" name="memItems['+idx+'].deptCode" class="registerTable" value="' +NmemDepart+ '"/>';
		str += '<input type="hidden" name="memItems['+idx+'].posCode" class="registerTable" value="' +NmemPosi+ '"/>';
		str += '<input type="hidden" name="memItems['+idx+'].salary" class="registerTable" value="' +NmemSalary+ '"/>';
		str += '</tr>';
					
		 
		
		$("#dynamicTable").append(str);
					
		$("#memNo").val('');
		$("#memName").val('');
		$("#memPwd").val('');
		$("#memSsn1").val('');
		$("#memSsn2").val('');
		$("#memHiredate").val('');
		
		$("#memDepart option:eq(0)").prop("selected", true);
		$("#memPosi option:eq(0)").prop("selected", true);
		
		$("#memSalary").val('');
		
		idx = idx + 1;
		}
	
	function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
		
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원등록</h1>

		
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/member/memWrite.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">사원등록</h6>
						<button type="submit" class="btn btn-info"
							 style="float: right">사원정보 반영하기</button>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div  style="overflow: scroll; overflow-x: scroll; height: 630px;">


							<table class="table table-bordered" id="dynamicTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>주민번호</th>
										<th>입사일</th>
										<th>부서명</th>
										<th>직급</th>
										<th>계약연봉</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">

								</tbody>
						</table>
						
						
						<span style="font-weight: bold; font-size: 1.1em;" class="register_text form-control">정보입력</span> 
						<input type="text" placeholder="사원번호 " id="memNo" class="register_text form-control">
						<input type="text" placeholder="이름" id="memName" class="register_text form-control"> 
						<input type="text" placeholder="주민번호 앞" id="memSsn1" class="register_text form-control"> 
						<input type="text" placeholder="주민번호 뒤" id="memSsn2" class="register_text form-control"> 
						<!-- <input type="text" placeholder="비밀번호" id="memPwd" class="register_text form-control">  -->
						<input type="text" placeholder="입사일" id="memHiredate" class="register_text form-control"> 
						<select id="memDepart" class="register_text form-control" >
							<option>부서명</option>
							<c:forEach var = "deptVo" items="${deptList }" >
								<option value="${deptVo.deptCode }">${deptVo.deptName } </option>
							</c:forEach>
						</select>
						
						
						<select id="memPosi" class="register_text form-control" >
							<option>직급</option>
							<c:forEach var = "posVo" items="${posList }" >
								<option value="${posVo.posCode }">${posVo.posName } </option>
							</c:forEach>
						</select>
						
						<input type="text" placeholder="계약연봉" id="memSalary" class="register_text form-control">
						<input type="button" id="insertAdminRegister" class="btn btn-info" onclick="memberTableCreate()"
						class="register_text" value="입력">
						
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


