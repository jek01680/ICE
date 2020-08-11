<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../inc/all_css_js.jsp" %>
 <style type="text/css">
 	table, table tr, table th, table td{
 		border: 1px solid black; 
 	}
 	
 	table {
		width: 98%;
		height: 400px;
	}
	
	
	#search_move_msgAddrGroup{
   	 	position: fixed;
   	 	left: 400px;
   		 top: 300px;
	}
 </style> 
 <script type="text/javascript">
 	$(function(){
 		
 		$("#ui_msgAddrGroup ").children().click(function(){
 			var memNo = $("#openAddrMsg_memNo").val();
 			var adgNo = $(this).val();
 			$.ajax({
				url:'<c:url value="/message/msgAddr_group.do" />',
				type:"get",
				data: "memNo="+ memNo+"&adgNo="+ adgNo,
				dataType: 'json',
				success:function(res){
					if(res.length>0){
						var str="";
						$.each(res, function(idx, item){	
							
							str+= "<li class='list-group-item list-group-item-action' style='width:190px;' id='result_MAG"+item.adNo+"' value='"+item.adNo+"'>";
							str+= "<input type='checkbox' style='margin-left:5px;'value='"+item.adNo+"'>"
							str+= item.name;
							if(item.deptName != null ){
								str+= "<"+item.deptName+"></li>";
								
							}else{
								str+="</li>";
							}
							
							
						});	
						
						$("#result_msgAddrGroup").html(str);
					}
				}
			});
 		});
 		
 		
 		$("#goRight").click(function(){
 			//#result_msgAddrGroup > li:nth-child(1) > input[type=checkbox]
 			var people = $("#result_msgAddrGroup input[type=checkbox]:checked");
			var str = "";
			for( var i=0; i<people.length; i++){
				str += $(people[i]).val()+",";
				alert(str);	//8,9,
			}
			
			$.ajax({
				url:'<c:url value="/message/msgAddr_group.do" />',
				type:"get",
				data: "people="+ str,
				dataType: 'json',
				success:function(res){
					
				}
				
			});
			$("#checked_msgAddrPeop").text(str);
 		});
 	});
 </script>
</head>
<body>
	<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-6 " style="margin-top: 30px;">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/member/memWrite.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">쪽지 주소록</h6>
						
					</div>
					
					<!-- Card Body -->
					<input type="hidden" id = "openAddrMsg_memNo" name = "memNo" value="${sessionScope.identNum }">
					<div class="card-body" style="text-align: center">
						<table >
							<tr style="height: 70px;" >
								<th>주소록 그룹</th> 
								<th style="width: 40%">검색</th>
								<th style="width: 40%" rowspan="2">
									<div  id="checked_msgAddrPeop">
										
									</div>
								</th>	 
							
							</tr>
							<tr>
								<td>
									<div id="msgAddrGroup" >
										<ul class="list-group" id="ui_msgAddrGroup" >
											<c:forEach var="addrVo" items="${addrList }">
												<li class="list-group-item list-group-item-action "   
												value="${addrVo.adgNo }"> ${addrVo.groupName }</li>
											</c:forEach>
										</ul>
									</div>
								</td>
								<td>
									<div id="search_msgAddrGroup">
										<ul id="result_msgAddrGroup" style="width: 90%;   height: 320px; padding-left: 0px;">
										
										</ul>
									</div>
									<div id="search_move_msgAddrGroup">
										<input type="button" id="goRight" class="btn btn-success" value=" > " style="margin-bottom: 5px"><br>
										<input type="button" id="goLeft" class="btn btn-success" value=" < ">
									</div>
								
								</td>
							</tr>
							
						
						</table>
					</div>
						
				</form>


			</div>
		</div>
	</div>
</div>
	
</body>
</html>