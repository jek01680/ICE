<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<style type="text/css">
#imsydatefrm{padding-top: 10px;text-align: center;height:120px;}
#imsydatefrm label, 
#imsydatefrm input[type=submit]{margin-left: 10px;margin-right: 10px;}
#imsysearchDateDiv,#imsypaylist{background-color: white;}
#imsypaylist{margin-top: 20px;}
#imsypayTable{width:100%;text-align: center;}
#imsypayTable thead tr{background-color: gray;color:white;}
#imsyupperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#imsyupperDiv p{padding-top: 5px;padding-left: 5px;}
#imsywholeDiv{padding-left: 20px;padding-right: 20px;}
#imsypaylist{overflow-y:auto; overflow-x:hidden;height: 500px;}
.imsydocNoInfo{cursor: pointer;}
</style>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
        });
		$('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD',
        });
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
	});
</script>
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:800px;width: 99%;padding: 10px 0px 10px 0px;">
	<div id="imsywholeDiv">
		<div id="imsyupperDiv">
		<p>임시 보관함</p>
	</div>
	<div class="form-group" id="imsysearchDateDiv">
		<form name="searchDateFrm" method="post" class="form-inline"
				id="imsydatefrm" action="<c:url value='/payment/write/sentpayList.do' />">
				<div class="form-group">
					<label for="startDay">작성일</label>
					<div class="input-group date" id="datetimepicker1"
						data-target-input="nearest">
						<input type="text" class="form-control datetimepicker-input"
							data-target="datetimepicker1" id="datetimepicker1" name="startDay" value="${paysearchVo.startDay }">
						<div class="input-group-append" data-target="#datetimepicker1"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group date" id="datetimepicker2"
						data-target-input="nearest">
						<input type="text" class="form-control datetimepicker-input"
							data-target="datetimepicker2" id="datetimepicker2" name="endDay" value="${paysearchVo.endDay }">
						<div class="input-group-append" data-target="#datetimepicker2"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="docType">문서종류</label> 
					<select class="form-control" id="docType" name="searchCondition">
						<!-- 반복 시작 -->
						<c:forEach var="doctypeVo" items="${doctypelist }">
							<option value="${doctypeVo.typeNo }"
								<c:if test="${paysearchVo.searchCondition==doctypeVo.typeNo }">
									selected="selected"
								</c:if>
							>${doctypeVo.typeName}</option>
						</c:forEach>
						<!-- 반복 끝 -->
					</select> 
					<label for="title">제목</label> 
					<input type="text" class="form-control" id="title" name="searchKeyword" value="${paysearchVo.searchKeyword }"> 
					<input class="btn btn-primary" type="submit" value="검색">
				</div>
			</form>
	</div>

	<div class="form-group" id="imsypaylist">
	<table id="imsypayTable" class="table table-hover">
		<thead>
			<tr>
				<th width="15%;">문서번호</th>
				<th width="10%;">문서종류</th>
				<th width="15%;">신청일</th>
				<th width="10%;">작성자</th>
				<th>제목</th>
				<th width="10%;">첨부</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>
							<a class="imsydocNoInfo" onclick="window.open('../checkDocView.do?docNo=${vo.docNo}&flag=imsy','Docviewer','width=1000,height=900,left=0,top=0,location=no,resizable=no,scroll=no');">
								${vo.docNo }
							</a>
						</td>
						<td>${vo.typeName }</td>
						<td>${vo.writedate }</td>
						<td>${vo.name }</td>
						<td>${vo.title }</td>
						<td>${vo.hasFile }</td>
					</tr>
				</c:forEach>
			<!-- 반복 끝 -->
		</tbody>
	</table>
</div>
</div><br>
</div>
</div>
</div>

<%@include file="../../inc/bottom.jsp"%>