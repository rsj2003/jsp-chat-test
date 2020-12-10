<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h3>유저 등록</h3>
<form action="insert_user.jsp" method="post" name="form">
	<table border="1">
	<tr>
		<td>유저ID</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>유저명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등록"></td>
	</tr>
	</table>
</form>