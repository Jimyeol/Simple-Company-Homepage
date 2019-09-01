<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.Date, java.text.*"%>

<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<%
	Cookie[] cookies = request.getCookies();

	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	request.setCharacterEncoding("euc-kr");
	String name = getCookieValue(cookies, "ID");
	String title = request.getParameter("title");
	title = new String(title.getBytes("8859_1"), "UTF-8");	//jsp -> jsp간의 한글 처리
	String body = request.getParameter("body");
	body = new String(body.getBytes("8859_1"), "UTF-8");
	Date date = new Date();
	
	Date dt = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, a hh:mm:ss"); 
	//심플데이터포멧으로 날짜 포멧
	
	Long time = date.getTime();
	
	String filename = "board.txt";	//보드 txt파일 읽어옴
	String result;
	PrintWriter writer = null;
	
	try {
		String filePath = 
					application.getRealPath("/WEB-INF/" + filename);	//읽어옴
					
		writer = new PrintWriter(new FileWriter(filePath, true));
		writer.printf("%s %n", title);
		writer.printf("%s님 %n", getCookieValue(cookies, "ID"));
		writer.printf("start%n");
		writer.printf("%s %n", body);
		writer.printf("end%n");
		writer.printf("%s %n", sdf.format(dt).toString());
		//저장해주고 
		result = "SUCCESS";	//SUCCESS를 보내줌
	} catch (IOException ioe) {
		result = "FAIL";
	} finally {
		try {
			writer.close();
		}
		catch(Exception e) {
		}
	}
	response.sendRedirect("boardResult.jsp?RESULT=" + result);
%>


<html>
	<head><title>Jimyeol Company</title></head>
	
	<body>
	</body>

	
</html>

<%!
	private String getCookieValue(Cookie[] cookies, String name) {
		if(cookies == null)
			return null;
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(name))
				return cookie.getValue();
		}
		return null;
	}
%>