<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String chat = request.getParameter("chat");

try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection
    ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    Statement stmt = conn.createStatement();
    
	String insert_query = "INSERT INTO CHAT VALUES(USER_CHAT_ID.NEXTVAL, '%s', '%s')";
	stmt.executeQuery(String.format(insert_query, id, chat));
	
	conn.commit();
	
    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}

response.sendRedirect("index.jsp?section=chat");

%>