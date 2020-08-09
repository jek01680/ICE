<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<script type="text/javascript" src="<c:url value='/resources/js/address/inputCheck.js'/>"></script>
<script type="text/javascript">
$(function(){
	$('input[type=reset]').click(function(){
		location.href="<c:url value='/address/addressMain.do'/>";
	});
	
		/* 조직도에서 추가 */
	$('#addFromOrgan').click(function(){
		window.open('<c:url value="/address/organizeChart.do"/>', 'organ', 
				'width=420, height=320, left=800, top=200, location=yes, resizable=yes');
	});
		
});
</script>

<style type="text/css">

.divForm div {
	margin-left: 60px;
}

.email3 {
	width: 150px;
}

.hp {
	width: 71px;
}

.email{
	width: 110px;
}

#addFromOrgan_span{
	float:right;
	display:inline-block;
}

#addFromOrgan{
	margin-right: 20px;
	font-size: 15px;
	background-color: #fdfdfd;
	border-radius: 3px 3px 3px 3px;
	border: 2px solid lightgray;
}

#addFromOrgan_span{
	float:right;
	display:inline-block;
}
</style>
<section>
	<article>
		<div class="col-xl-12 ">
			<header>
				<h3>
					주소록<span> > 추가하기 </span>
					<span id="addFromOrgan_span"><input type="button" id="addFromOrgan" value="조직도에서 추가하기"></span>
				</h3>
			</header>
			<div class="card shadow mb-4" style="height: 500px">
				<div class="divForm">
					<form method="post" action="<c:url value='/address/addAddress.do'/>">
						<fieldset>
							<legend>기본 정보</legend>
							<div>
								<label class="la_left">이름</label> 
								<input class="etc borderStyle" type="text" name="name"> 
								<label class="la_right">전화번호</label>
								<select class="borderStyle" name="hp1">
									<c:forEach var="hp" items="${phList }">
										<option value="${hp }" >${hp }</option>
									</c:forEach>
								</select> 
								- <input class="hp borderStyle" type="text" name="hp2">  
								- <input class="hp borderStyle" type="text" name="hp3">
							</div>
							<div>
								<label class="la_left">이메일</label> 
								<input class="email borderStyle" type="text" name="email1"> @ 
								<select class="borderStyle" name="email2" id="email2">
									<c:forEach var="em" items="${emList }">
										<option value="${em }" >${em }</option>
									</c:forEach>
								</select>
								  <input class="email3 borderStyle" type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        							style="visibility:hidden">
							</div>
							<div>
								<label class="la_left">회사명</label> 
								<input class="etc borderStyle" type="text" name="company">
								<label class="la_right">부서</label> 
								<input class="etc borderStyle" type="text" name="deptName">
							</div>
							<div>
								<label class="la_left">직책</label> 
								<input class="etc borderStyle" type="text" name="posName">
								<label class="la_right">그룹 선택</label> 
								<select class="borderStyle" name="adgNo">
									<option value="">전체</option>
									<c:forEach var="adg" items="${adgList }">
										<option value="${adg.adgNo }" 
											<c:if test="${adg.adgNo==1 }">
											selected="selected"
											</c:if>
										>${adg.groupName }</option>
									</c:forEach>
								</select>
							</div>
							<legend>추가 정보</legend>
							<div>
								<label class="la_left">주소</label> 
								<input class="etc borderStyle" type="text" name="homeAddress">
								<label class="la_right">홈페이지</label> 
								<input class="etc borderStyle" type="text" name="homePage">
							</div>
							<div>
								<label class="la_left">메신저</label> 
								<input class="etc borderStyle" type="text" name="messenger"> 
								<label class="la_right">SNS</label> 
								<input class="etc borderStyle" type="text" name="SNS">
							</div>
							<div>
								<label class="la_left">메모</label><br>
								<textarea class="borderStyle" rows="3" cols="109" name="memo"></textarea>
							</div>
							<div id="add_inputs">
								<input type="submit" value="등록"> 
								<input type="reset"	value="돌아가기">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<%@include file="../inc/bottom.jsp"%>