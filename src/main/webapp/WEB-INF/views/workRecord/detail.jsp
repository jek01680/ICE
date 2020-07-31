<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0;
	}

	#modal{
		background: white;
	    margin-bottom: 2%;
	    font-size: 1.3em;
	}
	
	#modal div{
		margin-left: 5%;
		margin-top: 3%;
	}
	
	button#btClose {
	    float: right;
	    margin-right: 5%;
	    margin-top: 16%;
	    width: 17%;
	    cursor: pointer;
		background-color: #4e73df;
    	border-color: #4e73df;
    	border-radius: 9px;
    	color: white;
	}
	
	 #h2{
	 	margin: 0;
	    height: 70px;
	    background: #4e73df;
	    color: white;
	    padding-left: 5%;
	    padding-top: 5%;
	    font-size: 1.8em;
	 }
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$("#btClose").click(function() {
			self.close();
		});
	});
</script>
</head>
<body>
	<h2 id="h2">근태관리 상세보기</h2>
	<div id="modal" class="" >
		<div>
			<label>출근시간 : </label>
			<span id="modal_Start"> ${Dvo.cmpIn}</span>
		</div>
		<div>			
			<label>퇴근시간 : </label>
			<span id="modal_End"> ${Dvo.cmpOut}</span>
		</div>
		<div>			
			<label>출근상태 :</label>
			<span id="model_status">${Dvo.cmpStatus}</span>
		</div>
		<c:if test="${Dvo.cmpStatus eq'결근'}">
			<div>			
				<a href="#">결근 사유서 작성하기</a>
			</div>
		</c:if>
		<button id="btClose">닫기</button>
	</div>
</body>
</html>