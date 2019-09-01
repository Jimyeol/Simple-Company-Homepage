<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.io.*, java.util.Date"%>
<%
request.setCharacterEncoding("euc-kr");
//String id = request.getParameter("id");
//String password = request.getParameter("password");
String id = (String)session.getAttribute("id");
String password = (String)session.getAttribute("password");

String FilePath = application.getRealPath("/WEB-INF/members.txt");

BufferedWriter bWriter = new BufferedWriter(new FileWriter(FilePath, true));
	PrintWriter writer = new PrintWriter(bWriter, true);

	writer.printf("%s%n", id);
	writer.printf("%s%n", password);
	writer.close();
	

session.invalidate();
response.sendRedirect("homepage.html");
%>


