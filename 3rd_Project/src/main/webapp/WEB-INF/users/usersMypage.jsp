<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<div id="center">
<a href="mypage.u">마이페이지</a> | <a href="changepw.u">비밀번호 변경</a>
<h1>반갑습니다, ${id }님!</h1>
<br>
>회원정보<br>
<table border="1">
	<tr>
		<th>아이디</<th>
		<td>${ub.u_id }</td>
		<th>휴대전화번호</<th>
		<td>${ub.u_phone }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${ub.u_address }</td>
		<th>퍼스널컬러</th>
		<td>${ub.u_color }</td>
	</tr>
</table>
<input type="button" value="회원정보 수정하기" onClick="location.href='update.u?u_id=${ub.u_id}'"><br><br>
>작성한 글 <br>
>주문내역 <br>
>회원탈퇴 <br>
</div>
<%@ include file="../views/footer.jsp" %>