<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : ""; 
%>
</head>
<body>
	<ul>
		<li><a href="index.jsp">register</a></li>
		<li><a href="index.jsp?section=chat">chat</a></li>
	</ul>
	<%
    switch(section) {
    case "chat":
        %><%@include file="chat.jsp" %><%
        break;
    default:
        %><%@include file="register.jsp" %><%
    }
    %>
</body>
</html>