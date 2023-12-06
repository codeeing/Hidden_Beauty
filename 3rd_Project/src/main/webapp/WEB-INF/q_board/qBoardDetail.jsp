<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	
</style>  
<script type="text/javascript">

	function goList(pageNumber){
		location.href="qBoardList.qb?pageNumber="+pageNumber;
	}
	
	function goUpdate(q_num,pageNumber){
		location.href="qUpdate.qb?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
	function goDelete(q_num,pageNumber){
		location.href="qDelete.qb?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
	function goReply(q_num,q_ref,q_re_step,q_re_level,pageNumber){
		location.href="qReply.qb?q_ref="+q_ref+"&q_re_step="+q_re_step+"&q_re_level="+q_re_level+"&pageNumber="+pageNumber+"&q_num="+q_num;
	}
	 
</script>
<%
	application.setAttribute("flag",false);
%>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >


<div class="page-title">
    <div class="container">
        <br><br>
        <h3>의견 게시판</h3>
    </div>
</div>
 <div id="board-list">
			
		<form:form commandName="bb" action="write.qb" method="post">
		      <table class="board-table">
				<tr>
					<th align="left" bgcolor="#f9f7f9" width="15%">제목</th>
					<td align="left" colspan="3">
						${ bb.q_subject }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">작성자</th>
					<td align="left">
						${ bb.q_writer }
					</td>
					<th align="left" bgcolor="#f9f7f9" width="15%">이메일</th>
					<td align="left">
						${ bb.q_email }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">내용</th>
					<td align="left" colspan="3" height="300px">
						${ bb.q_content }
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 <center>
				<input type="button" value="수정하기" onClick="goUpdate(${ bb.q_num },${pageNumber})" class="btn btn-dark">
			<input type="button" value="삭제하기" onClick="goDelete(${ bb.q_num },${pageNumber})" class="btn btn-dark">
			<input type="button" value="답글달기" onClick="goReply(${ bb.q_num },${ bb.q_ref },${ bb.q_re_step },${ bb.q_re_level },${pageNumber})" class="btn btn-dark">
			<input type="button" value="목록" onClick="goList(${pageNumber})" class="btn btn-dark">
			</center>
		</form:form>
</article>

</div>


<%@ include file="./../views/footer.jsp" %>