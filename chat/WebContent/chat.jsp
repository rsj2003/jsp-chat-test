<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection
    ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    Statement stmt = conn.createStatement();
    %>
<table border="1">
	<tr>
		<td>유저명</td>
		<td>채팅</td>
	</tr>
	<%
	String query_chat = "SELECT USER_ID, MESSAGE FROM chat ORDER BY CID ASC";
	ResultSet rs_chat= stmt.executeQuery(query_chat);
	while (rs_chat.next()) {
		%><tr>
			<td><%=rs_chat.getString(1)%></td>
			<td><%=rs_chat.getString(2)%></td>
		</tr><%
	}
	%>
</table>

<form action="insert_chat.jsp" method="post" name="form">
	<table border="1">
		<tr>
			<td><select name="id">
				<%
				String query_user = "SELECT USER_ID, USER_NAME FROM chat_user";
				ResultSet rs_user= stmt.executeQuery(query_user);
				while (rs_user.next()) {
					%><option value="<%=rs_user.getString(1)%>">[<%=rs_user.getString(1)%>] <%=rs_user.getString(2)%></option><%
				}
				%>
			</select></td>
			<td><input type="text" name="chat" placeholder="채팅을 입력하세요."></td>
			<td><input type="submit" value="보내기"></td>
		</tr>
	</table>
</form>

<%        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>