<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
#editupperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#editupperDiv p{padding-top: 5px;padding-left: 5px;}
#editwholeDiv{padding-left: 20px;padding-right: 20px;height:fit-content;}
#editlabel1 {position: relative;top: 31px;}#editdocNo {position: relative;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}
#editlabel2 {top: -38px;left: 310px;position: relative;}#editkeep {position: relative;top: -69px;left: 400px;width: 200px;}
#editlabel3 {position: relative;top: -58px;}#editdepartment {position: relative;top: -88px;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}
#editlabel4 {position: relative;top: -126px;left: 310px;}#editname {position: relative;top: -157px;left: 390px;width: 200px;margin: 0px 0px 10px 10px;}
#editlabel5 {position: relative;top: -155px;}#editwriteDay {position: relative;top: -187px;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}
#editlabel6 {position: relative;top: -181px;}#edittitle {width: 92%;position: relative;top: -215px;left: 79px;}
#editlabel7 {position: relative;top: -201px;}#editformNo {width: 200px;position: relative;top: -233px;left: 80px;}
#editlabel8 {position: relative;top: -193px;}#editupfile {position: relative;top: -225px;left: 67px;width: 93%;}
#editdocForm {position: relative;top: -209px;}#editsendBt {position: relative;top: -262px;right: -82%;}
#editsaveBt {position: relative;top: -262px;right: -82%;}#edittypeNo {position: relative;top: -228px;right: -60%;width:200px;}.note-editor {position: relative;top: -220px;}
</style>
<script type="text/javascript">
	$(function() {
		$('#editformNo').change(function() {
			$.ajax({
				url : "<c:url value='/payment/getForm.do'/>",
				type : "get",
				data : "formNo=" + $(this).val(),
				success : function(res) {
					$('#summernote').summernote('code', res.content);
				},
				error : function(xhr, status, error) {
					alert(status + ", " + error);
				}
			});
		});
	});
	function imsy() {
		$('form[name=editpayInfoFrm]').attr("action",
				"<c:url value='/payment/write/imsyEdit.do?imsy=Y'/>")
	}
</script>
</head>
<body style="overflow-x: hidden">
	<!-- Content Row -->
	<div class="row" style="padding-left: 15px;">
		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4"
				style="height: fit-content; width: 99%; padding: 10px 0px 10px 0px;">
				<div id="editwholeDiv">
					<div id="editupperDiv">
						<p>기안 작성하기</p>
					</div>
					<form name="editpayInfoFrm" method="post" style="color: black;"
						enctype="multipart/form-data" action="<c:url value='/payment/write/editPaydoc.do'/>" >
						<label for="docNo" id="editlabel1">문서 번호</label> 
						<input type="text" class="form-control" id="editdocNo"
							value="${payVo.docNo}" readonly="readonly"> 
						<input type="hidden" name="docNo" value="${payVo.docNo}">
						<input type="hidden" id="fileName" name="fileName" value="${fileVo.fileName }">
						<input type="hidden" id="fileSize" name="fileSize" value="${fileVo.fileSize }">
						<input type="hidden" id="originalFileName" name="originalFileName" value="${fileVo.originalFileName }">
						<label for="keep" id="editlabel2">보존 기간</label> 
						<select class="form-control" id="editkeep" name="keep">
							<option value="12"
								<c:if test="${payVo.keep=='12' }">
									selected="selected"
								</c:if>
							>1년</option>
							<option value="24"
								<c:if test="${payVo.keep=='24' }">
									selected="selected"
								</c:if>
							>2년</option>
							<option value="36"
								<c:if test="${payVo.keep=='36' }">
									selected="selected"
								</c:if>
							>3년</option>
							<option value="48"
								<c:if test="${payVo.keep=='48' }">
									selected="selected"
								</c:if>
							>4년</option>
							<option value="60"
								<c:if test="${payVo.keep=='60' }">
									selected="selected"
								</c:if>
							>5년</option>
						</select> 
						<label for="department" id="editlabel3">기안 부서</label> 
						<input type="text" class="form-control" id="editdepartment"
							value="${memVo.deptName }" readonly="readonly"> 
						<label for="name" id="editlabel4">기안자</label> 
						<input type="text" class="form-control" id="editname" value="${memVo.name }" readonly="readonly"> 
							<input type="hidden" id="editmemNo" name="memNo" value="${memVo.memNo }"> 
							<label for="writeDay" id="editlabel5">작성 일자</label> 
							<input type="text" class="form-control" id="editwriteDay" value="${payVo.writedate }"
							readonly="readonly"> 
							<label for="title" id="editlabel6">제목</label>
						<input type="text" class="form-control" id="edittitle" value="${payVo.title }"
							name="title"> 
							<label for="formNo" id="editlabel7">기안
							양식</label> 
							<select class="form-control" id="editformNo" name="formNo">
							<option value="0"></option>
							<!-- 반복시작 -->
							<c:forEach var="docformVo" items="${formlist }">
								<option value="${docformVo.formNo }">${docformVo.formName }</option>
							</c:forEach>
							<!-- 반복끝 -->
						</select>
						<c:import url="/payment/summer.do"></c:import>
						<label for="upfile" id="editlabel8">첨부파일</label> 
							<input type="file" class="form-control" id="editupfile">
							<span style="position: relative;top: -200px;">
								새 파일을 등록하면 기존 <bold style="color:#4e73df;">${fileVo.originalFileName}</bold> 은(는) 삭제됩니다
							</span>
						<select class="form-control" id="edittypeNo" name="typeNo"
							style="width: 200px;">
							<!-- 반복 시작 -->
							<c:forEach var="doctypeVo" items="${doctypelist }">
								<option value="${doctypeVo.typeNo}"
									<c:if test="${payVo.typeNo==doctypeVo.typeNo }">
										selected="selected"
									</c:if>
								>${doctypeVo.typeName}</option>
							</c:forEach>
							<!-- 반복 끝 -->
						</select>
						<button type="submit" class="btn btn-primary" id="editsaveBt"
							onclick="imsy()">임시저장</button>
						<button type="submit" class="btn btn-primary" id="editsendBt">결재상신</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>