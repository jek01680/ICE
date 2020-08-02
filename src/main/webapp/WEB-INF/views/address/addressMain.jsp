<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function() {
		var selected = $(this).hasClass("highlight");

		/* highlight */
		$("#addressTable tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
		/* 수정 */
		$('#btEdit').click(function(){
			location.href="<c:url value='/address/editAddress.do'/>";
		});
		
		/* 추가 */
		$('#btAdd').click(function(){
			location.href="<c:url value='/address/addAddress.do'/>";
		});
		
		/* 삭제 여러개(휴지통으로 이동) */
		$('#btDel').click(function(){
			var len=$('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 주소를 먼저 체크하세요');
				return;
			}
			$('form[name=addressList]')
				.prop("action","<c:url value='/address/trashMulti.do'/>");
			$('form[name=addressList]').submit();
		});	 

		/* 휴지통으로 이동 */
		$('#btTrash').click(function(){
			location.href="<c:url value='/address/trashAddress.do'/>";
		});

		$('.star').click(function(){
			$(this).text();
			var star_id=$(this).attr('id');
			$(this).text('★');
			$(this).addClass('star_color');
			
			$(function(){
				$.ajax({
					url:"<c:url value='/address/isFavorite.do'/>",
					type:"get",
					data:{
						adNo:star_id
					}
				});
			});
		});
		
		
		
	});
</script>

<style type="text/css">

/* 주소 테이블  */
#addressTableDiv {
	width: 95%;
	margin: 0 auto;
	padding: 5px;
	background-color: white;
} 

#addressTable {
	background-color: white;
	text-align: center;
}

.star_color {
	color: orange;
}

.addressCB {
	width: 0.8em;
	margin-top: 5px;
}

#addressTable th, td {
	border-bottom: 2px solid #f8f9fc;
}

#addressTable tr:last-child { 
	border-bottom:3px solid white;
}

#addressTable {
	width: 100%;
	font-size: 0.9em;
}

/* 2번쨰 버튼들 위치  */
#buttonsDiv {
	width:100%;
}

#buttonsDiv>* {
	text-align: left;
	font-size: 0.9em;
	margin-right: 5px;
}

#buttonsDiv input[type=button] {
	border: 1px solid lightgray;
	margin-right: 5px;
}

#buttonsDiv a {
	color:#858796;
	/* font-size: 0.9em; */
	margin-left:5px;
	text-decoration: none;
}

#spanFir{
	float:left;
}

#spanSec{
	display:inline-block;
	margin-left: 180px;
	text-align:center;
}

#spanThd{
	float:right;
}

/* 테이블에 마우스 올리면 효과 */
.highlight {
	background-color: #d1d3e2;
}

 
.highlight a {
	text-decoration: none;
	color:#858796;
} 
 
.addOption_hidden{
	visibility:hidden;
}

.addressName{
	color:#858796;
	text-decoration: none;
}
</style>

<section id="addressMain_section">
	<header>
		<h3>
			주소록<span> > 내 주소록 </span>
		</h3>
	</header>
	<article>
		<div class="col-xl-12 ">
			<div class="card shadow mb-4">
				<form name="addressList" method="post" action="">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">주소록</h6>
						<div style="float: right">
							<button type="button" class="btn btn-info"
							 >주소 불러오기</button>
							<button type="button" class="btn btn-info"
							 >주소 내보내기</button>
						</div>
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div id="buttonsDiv">
							<div id="spanFir">
								<input type="button" id="btAdd" value="추가">
								<input type="button" id="btDel" value="삭제">
								<div id="spanSec">
									<a>전체</a>
									<a>가</a>
									<a>나</a>
									<a>다</a>
									<a>라</a>
									<a>마</a>
									<a>바</a>
									<a>사</a>
									<a>아</a>
									<a>자</a>
									<a>차</a>
									<a>카</a>
									<a>타</a>
									<a>파</a>
									<a>하</a>
									<a>즐겨찾기</a>
								</div>
							</div>
							<div id="spanThd">
								<input type="button" id="btEdit" value="설정">
								<input type="button" id="btTrash" value="휴지통">
							</div>
						</div>
					</div>
					<div id="addressTableDiv">
						<table id="addressTable">
							<tr class="card-header">
								<th><input type="checkbox" id="CheckAll" class="addressCB"></th>
								<th class="star_color">★</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>그룹</th>
								<th>회사명</th>
								<th>부서</th>
								<th>직책</th>
							</tr>
	
							<!-- 반복 시작 -->
							<c:set var="idx" value="0"/>
							<c:forEach var="address" items="${adList }">
								<tr>
									<td><input name="adItems[${idx }].adNo" value="${address.adNo }" type="checkbox" class="addressCB"></td>
									<td class="star" id="${address.adNo }" style="cursor:pointer">☆</td>
									<td><a href="<c:url value='/address/detailAddress.do?adNo=${address.adNo }'/>" class="addressName">${address.name}</a></td>
									<c:set var="idx" value="${idx +1 }"/>
	
									<c:if test="${empty address.hp1 }">
										<td></td>
									</c:if>
									<c:if test="${!empty address.hp1 }">
										<td>${address.hp1}-${address.hp2} - ${address.hp3}</td>
									</c:if>
									
									<c:if test="${empty address.email1 }">
										<td></td>
									</c:if>
									<c:if test="${!empty address.email1 }">
										<td>${address.email1 }@${address.email2 }</td>
									</c:if>
									<c:if test="${empty address.groupName }">
										<td class="groupName"></td>
									</c:if>
									<c:if test="${!empty address.groupName }">
										<td class="groupName">${address.groupName}</td>
									</c:if>
									<c:if test="${empty address.company }">
										<td class="company"></td>
									</c:if>
									<c:if test="${!empty address.company }">
										<td class="company">${address.company}</td>
									</c:if>
									
									<c:if test="${empty address.deptName }">
										<td class="deptName"></td>
									</c:if>
									<c:if test="${!empty address.deptName }">
										<td class="deptName">${address.deptName}</td>
									</c:if>
									<c:if test="${empty address.posName }">
										<td class="posName"></td>
									</c:if>
									<c:if test="${!empty address.posName }">
										<td class="posName">${address.posName}</td>
									</c:if>
								</tr>
							</c:forEach>
							<!-- 반복 끝 -->
						</table>
					</div>
				</form>
			</div>
		</div>
	</article>
</section>
	<%@include file="../inc/bottom.jsp"%>
