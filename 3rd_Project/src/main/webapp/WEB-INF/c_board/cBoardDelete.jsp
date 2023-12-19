<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardDelete.css">

<style>
	#btn{
		font-size: 13pt; 
		width: 130px; 
		color: black; 
		background: white; 
		border: 1px solid #D5D5D5;
		border-radius: 5px;
	}
	#btn:hover {
		background: #D0D6CE;
		color: white;
	}
</style>
	
<br>

<article id="center" style=" text-align:center; font-family: 'RIDIBatang';" >
<br><br><br><br><br>

	<div id="board-list">	
		<form name="deleteForm" action="cDelete.cb" method="post">
		<input type=hidden name="pageNumber" value="${ pageNumber }">
		<input type=hidden name="c_num" value="${bb.c_num}">
		<input type=hidden name="c_password" value="${ c_password }">
		<input type="hidden" name="whatColumn" value="${whatColumn}">
		<input type="hidden" name="keyword" value="${keyword}">
			<table border=1>
				<tr style="background-color: #EDE5D8;">
					<th style="padding:5% 5%; text-align:center;">게시글 작성 시 설정하신 비밀번호를 입력해주세요.</th>
				</tr>
				<tr rowspan=2>
					<td align=center style="border-top: 1px solid #e7e7e7; border-bottom: 1px solid #e7e7e7; padding:5% 5%;">
						<input type="password" name="c_password" class="form-control" maxlength="12" size="12" style="text-align: center;">
					</td>
				</tr>
				
			</table>
			<center>
				<input type="submit" id="btn" value="삭제하기" class="btn btn-dark" style="margin-top:3%; font-size: 13pt; width: 130px;">&nbsp;
				<input type="button" id="btn" value="목록으로" onClick="location.href='cBoardList.cb?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-dark" style="margin-top:3%; font-size: 13pt; width: 130px;">
			</center>		
		</form>
	</div>
</article>
<%@ include file="./../views/footer.jsp" %>