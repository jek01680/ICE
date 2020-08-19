<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

$(function(){
	$('#addResource').click(function(){
		window.open('<c:url value="/resource/addResource.do"/>', 'addRes', 
				'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
	});
	
	/* highlight */
	$("#tableForm tr:gt(0)").hover(function(event) {
		$(this).addClass("highlight");
	}, function(event) {
		$(this).removeClass("highlight");
	});
	
	var resNo=0;
	
	/* 자원명 누르면 수정화면 ajax 처리해서 보여주기 */
	$(".goDetail").click(function(){
		//1. 번호를 받는다
		var res_no=$(this).attr('id');
		
		//2. controller 처리를 한다
		var resName;
		var resImageVar;
		var resSize;
		var resOriginalImage;
		var resLocation;
		var resSubdesc;
		var resRegdate;
		/* var resState; */
		var resIsDel;
		var rkNo;
		var rkKind;
		
		$(function(){
			$.ajax({
				url:"<c:url value='/resource/detailResource.do'/>",
				type:"get",
				data:{
					resNo:res_no
				},
				success:function(res){
					resNo=res.resNo;
					resName=res.resName;
					if(res.resImage!=null && res.resImage.length!=0) {
						resImage=res.resImage;
					}
					if(res.resSize!=0) {
						resSize=res.resSize;
					}
					if(res.resOriginalImage!=null && res.resOriginalImage.length!=0) {
						resOriginalImage=res.resOriginalImage;
					}
					if(res.resLocation!=null && res.resLocation.length!=0) {
						resLocation=res.resLocation;
					}
					if(res.resSubdesc!=null && res.resSubdesc.length!=0) {
						resSubdesc=res.resSubdesc;
						resSubdesc=resSubdesc.replace(/(?:\r\n|\r|\n)/g, '<br>');
					}
					if(res.resImage!=null && res.resImage.length!=0) {
						resImageVar="<c:url value='/resource_file/"+resImage+"'/>";
					}
					if(res.resRegdate!=null && res.resRegdate.length!=0) {
						resRegdate=res.resRegdate;
					}
					if(res.resState!=null && res.resState.length!=0) {
						resState=res.resState;
					}
					if(res.resIsDel!=null && res.resIsDel.length!=0) {
						resIsDel=res.resIsDel;
					}
					if(res.rkNo!=null && res.rkNo.length!=0) {
						rkNo=res.rkNo;
						rkKind=res.rkKind;
					}
					
					
				/* 	var str="";
						str+="번호 : " + res.resNo+"<br>";
						str+="이름 : " + res.resName+"<br>";
					alert(str); */
					
					$('#loadDetailResource').css('visibility', 'visible');
					
					$('#btEdit').attr('name', '');
					$('#spanResName').html('');
					$('#divImage').html('');
					$('#spanResLocation').html('');
					/* $('#spanResState').html(''); */
					$('#spanResSubdesc').html('');
					$('#spanRkKind').html('');

					$('#btEdit').attr('name', resNo);
					$('#spanResName').html(resName);
					if(res.resImage!=null && res.resImage.length!=0) {
						$('#divImage').html('<img width="250" height="250" id="spanResImage" style="border: 1px solid lightgray" src="'+resImageVar+'">');
					}
					$('#spanResLocation').html(resLocation);
					/* $('#spanResState').html(resState); */
					$('#spanResSubdesc').html(resSubdesc);
					$('#spanRkKind').html(rkKind);
					
				},
				error:function(xhr, status, error) {
					alert(status+", "+error);
				}
			});
		});
		
	}); //자원명 누르면 수정화면 ajax 처리해서 보여주기
	
	$('#btReserve').click(function(){
		location.href='<c:url value="/resourceUser/addReservation.do?resNo='+resNo+'"/>'
	});
		
	
	
}); //전체 function()

/* 예약신청 */
function resReserve(resNo) {
	location.href='<c:url value="/resourceUser/addReservation.do?resNo='+resNo+'"/>'
	/* window.open('<c:url value="/resourceUser/reserveResource.do?resNo='+resNo+'"/>', 'addRes', 
	'width=600, height=500, left=800, top=200, location=yes, resizable=yes'); */
	
}

</script>

<style type="text/css">

/* 자원목록 */
#tableDivForm{
	
}

#searchLoc{
	text-align: right;
} 

article > div {
	float:left;
}

#RESbottom{
	/* clear:both; */
	position:absolute;
	width:100%;
    bottom:0;
}

#mainDiv button{
	border: 1px solid lightgray;
	
	
}


#mainDiv a {
	color:#858796;
	
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

#mainDiv a:hover{
	text-decoration: underline;
}

article{
	font-size: 1.25em;
}

/* 자원 상세보기 */
	.divSection{
		margin:10px;
	}
	
	#divContent{
		margin: 0 auto;
		
	}
	
	#divDesc{
		text-align: left;
	}
	
	#divResName{
		font-weight: bold;
		text-align: center;
		
	}
	
	#divButton{
		text-align: center;
		clear:both;
		margin: 10px;
		
	}
	
	#divButton > button{
		border-radius: 5px 5px 5px 5px;
		border: 1px solid #DCDDE3;
		margin-right: 5px;
	}
	
	#divImage{
		margin: 0 auto;
	}
	
	#longestHeight{
		margin-bottom: 70px;	
	}

</style>

<section>
	<article>
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/resourceUser/resourceMain.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">	
	</form>
		<header>
				<h3 style="margin-left: 30px;">자원관리</h3>
			</header>
	
		<div id="mainDiv" class="col-xl-7 " style="margin: 30px;">
			<div class="card shadow mb-4" style="height: 500px; ">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">예약 신청</h6>
				</div>
				<div id="tableDivForm">
					<table id="tableForm">
						<tr id="tableTrForm" class="card-header">
							<th>자원명</th>
							<th>종류</th>
							<th>장소</th>
							<th>
							</th>
						</tr>
						<c:forEach var="rm" items="${manageList }">
							<tr class="goDetail" id="${rm.resNo }">
								<td>${rm.resName }
									<c:if test="${!empty rm.resImage }">
										<img src="<c:url value='/resources/img/file.gif'/>" alt="파일유무표시 이미지"> 
									</c:if>
								</td>
								<td>${rm.rkKind }</td>
								<td>${rm.resLocation }</td>
								<%-- <td>${rm.resState }</td> --%>
								<td><button onclick="resReserve(${rm.resNo})">예약</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="divPage">
				
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 ◀ -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
						<%-- 	<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로 이동"> --%>
						◀
						</a>
					</c:if> 
					
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }" 
						end="${pagingInfo.lastPage }">		
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageProc(${i})">[${i}]</a>			
						</c:if>
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color:blue; font-weight:bold">${i}</span>			
						</c:if>		
					</c:forEach>
						
					<!-- 다음 블럭으로 이동 ▶ -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
							<%-- <img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동"> --%>
							▶
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>
			</div>
		</div>
		
		<div id="longestHeight" class="col-xl-4 ">
			<div class="card shadow mb-4" style=" margin-top: 30px; ">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">상세보기</h6>
				</div>
				<div id="loadDetailResource" style="visibility:hidden" class="card-body">
					<div id="divAll" style="font-size: 0.8em;">
							<div class="divSection" id="divResName">
								<span id="spanResName"></span>
							</div>
							<div id="divContent">
								<div class="divSection" id="divImage">
								<!-- 이미지 -->
								</div>
								<div class="divSection" id="divDesc">
									<div>
										<span>종류: </span>
										<span id="spanRkKind">
										</span>
									</div>
									<div>
										<span>장소: </span>
										<span id="spanResLocation">
										</span>
									</div>
								<!-- 	<div>
										<span>상태: </span>
										<span id="spanResState"></span>
									</div> -->
									<div>
										<span>자원설명: </span>
										<p id="spanResSubdesc">
											
										</p>
									</div>
								</div>
							</div>
							<div id="divButton">
								<button id="btReserve" name="">예약</button> 
								<!-- <button id="btDel">삭제</button> -->
							</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</section>

<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>