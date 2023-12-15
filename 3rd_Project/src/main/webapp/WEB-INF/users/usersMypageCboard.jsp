<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#c_board{
		text-align: center;
		width: 95%;
		vertical-align: middle;
		font-size: 11pt;
	}
	#title{
		font-weight: bold;
	}
	#c_board td{
		padding-right: 20px; 
	}
	
</style>

<script>
	var allBtn = document.getElementsByName("all");
	var checkBtns = document.getElementsByName("check");
	
	function allCheck(){
		if(allBtn[0].checked == true){
			for(var i=0; i<checkBtns.length; i++){
				checkBtns[i].checked = true;
			}
		} else {
			for(var i=0; i<checkBtns.length; i++){
				checkBtns[i].checked = false;
			}
		}
	}
	
	function delCheck(){
		var flag = false;
		
		for(var i=0; i<checkBtns.length; i++){
			if(checkBtns[i].checked == true){
				flag = true;
			}
		}
		
		if(flag == false){
			alert("반드시 한 개 이상 체크 하신 후 요청 바랍니다.");
			return false;
		}
		
		if(confirm("삭제 시 복구가 불가능합니다. 삭제 진행하시겠습니까?")){
			return true;
		}
		return false;
	}
	
</script>

<%@ include file="usersMypageMenuTop.jsp" %>

<div style="margin: 0px 0px 28px 5px; font-size: 10pt;">
	<a href="mypage.u" id="none_under">마이페이지</a> > 게시물 관리 > <a href="c_board.u" id="none_under">후기 게시판</a>
</div>
<hr style="margin-bottom: 50px;">

<ul>
	<li><big><b>후기 게시판</b></big></li>
	
	<div style="font-size: 11pt; line-height: 180%; margin: 20px 0px 15px 0px;">
		사이트 내 '퍼스널 컬러 진단 후기 게시판' 에 작성하신 글을 조회할 수 있습니다.<br>
		삭제 시 글 내용 복구가 어려우니 신중하게 진행하시길 바랍니다.<br>
		${loginInfo.u_name}님이 작성하신 글은 총 <b>${pageInfo.totalCount}</b>개 입니다.
		
	</div>
	
	<div>
		<form action="c_boardChkDel.u" name="myForm" onSubmit="return delCheck()">
			<div style="width:95%; margin-bottom: 10px; text-align: right;">
				<input type="hidden" name="u_id" value="${loginInfo.u_id}">
				<input type="hidden" name="pageNumber" value="${pageIngo.pageNumber}">
				<input type="submit" value="체크 삭제" class="btn btn-outline-secondary" style="font-size: 10pt;">
			</div>
			<table class="table" id="c_board">
				<tr id="title">
					<td width="3%" style="background:#F7F3ED;"><input type="checkbox" name="all" onClick="allCheck()"></td>
					<td width="9%" style="background:#F7F3ED;">번호</td>
					<td style="background:#F7F3ED;">제목</td>
					<td width="15%" style="background:#F7F3ED;">작성일</td>
					<td width="10%" style="background:#F7F3ED;">조회수</td>
					<td width="12%" style="background:#F7F3ED;">비밀번호</td>
					<td width="9%" style="background:#F7F3ED;">수정</td>
					<td width="9%" style="background:#F7F3ED;">삭제</td>
				</tr>
				<c:set var="num" value="${pageInfo.totalCount - pageInfo.beginRow + 1}" />
				
				<c:if test="${fn:length(c_boardLists) > 0}">
					<c:forEach var="cb" items="${c_boardLists}">
						<tr>
							<td style="border-right: 1px dotted #D5D5D5;"><input type="checkbox" name="check" value="${cb.c_num}"></td>
							<td style="border-right: 1px dotted #D5D5D5;">
								${num}
								<c:set var="num" value="${num -1}" />
							</td>
							<td style="border-right: 1px dotted #D5D5D5;">
								<a href="c_boardDetail.u?c_num=${cb.c_num}&pageNumber=${pageInfo.pageNumber}" id="none_under">
									${cb.c_subject}&nbsp;
								</a>
								<c:if test="${cb.c_readcount >= 10 }">
									<img src="<%= request.getContextPath() %>/resources/image/hot.png" width="2%">
								</c:if>
							</td>
							<td style="border-right: 1px dotted #D5D5D5;"><fmt:formatDate value="${cb.c_regdate}" pattern="yyyy-MM-dd"/></td>
							<td style="border-right: 1px dotted #D5D5D5;">${cb.c_readcount}</td>
							<td style="border-right: 1px dotted #D5D5D5;">${cb.c_password}</td>
							<td style="border-right: 1px dotted #D5D5D5;"><input type="button" value="수정" class="btn btn-outline-secondary" style="font-size: 10pt; height: 30px;" onClick="location.href='c_boardUpdate.u?c_num=${cb.c_num}&pageNumber=${pageInfo.pageNumber}'"></td>
							<td><input type="button" value="삭제" class="btn btn-outline-secondary" style="font-size: 10pt; height: 30px;" onClick="location.href='c_boardDel.u?c_num=${cb.c_num}&pageNumber=${pageInfo.pageNumber}'"></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(c_boardLists) == 0}">
					<td colspan="8">작성한 게시글이 없습니다.</td>
				</c:if>
			</table>
			<div style="width: 95%; text-align: center; margin-top: 50px;">
				${pageInfo.pagingHtml}
			</div>
		</form>
	</div>
</ul>
<br>

<%@ include file="usersMypageMenuBottom.jsp" %>