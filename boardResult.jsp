<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*"%>

<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<html>
	<head><title>Jimyeol Company</title></head>
	
	<body>
	<%
		String str = request.getParameter("RESULT");	//파일이 여러번 저장되기 위한 방지
		if( str.equals("SUCCESS"))
			response.sendRedirect("board.jsp");
		else
			out.println("놉");
	%>
	</body>

	
</html>