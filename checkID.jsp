<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.io.*"%>

<%
	request.setCharacterEncoding("euc-kr");
	
	//id pw받고 
	String id = request.getParameter("user_name");
	String pw = request.getParameter("user_password");
	String readFilePath = application.getRealPath("/WEB-INF/members.txt");

	//id는 맞지만 pw가 틀린경우를 대비해서
	boolean bID = false;
	
	//txt파일에 저장되어있는 아이디목록 불러오기
	BufferedReader reader = null;
	
	try{
		reader = new BufferedReader(new FileReader(readFilePath));
		
		while(true){
			String str = reader.readLine();	//한줄씩 읽음
			if(str == null)	//널이면 브레이크
				break;
			
			if( id.equals(str) )	//id가 같으면
			{
				bID = true;			//일단 id 확인
				str = reader.readLine();	//pw확인
			}
			if( bID == true && pw.equals(str))	//pw마저 맞으면
			{
				Cookie cookie = new Cookie("ID", id);	//값들을 넘겨줌
				response.addCookie(cookie);
				cookie.setMaxAge(-1);					//쿠키값은 브라우저가 사라지면
				response.sendRedirect("jimyeolHomepage.jsp");
				break;
			}else {
				bID = false;	//pw가틀리면 false
			}
		}
		if( !bID )		//로그인이 틀리면 메시지박스 출력
		{
			out.println("<script language='javascript'>");
			out.println("alert('Login Fail');");
			out.println("location.href = 'homepage.html';");
			out.println("</script>");
		}
	} catch (FileNotFoundException e) {
		out.println("No File!");
	} catch (IOException ioe) {
		out.println("File Read Error!");
	} finally {
		try {
			reader.close();
		} catch(Exception e) {
		}
	}
%>


<html>
	<head><title>Jimyeol Company</title></head>
	
	<body>
	</body>

	
</html>