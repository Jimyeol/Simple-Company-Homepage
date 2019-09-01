<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="board.Bulletin" %>

<%
 
	int count = 1;
    request.setCharacterEncoding("UTF-8");
	
	Cookie[] cookies = request.getCookies();
 
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Jimyeol Company</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style>
h1{
	position:relative;
	top:240px;
	left:1px;
	font-size:2em;		
	color:rgb(0,0,0);	
}
h2{
	color:#00f;
}
.over1{	
    text-overflow:ellipsis;
}
p {
	white-space:nowrap;
    width:400px;
    padding:10px;
	margin-bottom:10px;
	margin-right:10px;
    overflow:hidden;
}

</style>
<!--[if lt IE 9]>
<script src="html5shiv.js"></scirpt>
<![endif]-->
</head>

	<body>
	<div class="container">
	  <header>
			<h1><%= getCookieValue(cookies, "ID") %>님, 안녕하세요! Jimyeol Company입니다.</h1>
	  </header>  
		<nav class="navi">
		  <ul>
			<li><a href="jimyeolHomepage.jsp">직원 소개</a></li>
			<li><a href="board.jsp">자유게시판</a></li>
			<li><a href="employment.jsp">채용 안내</a></li>
			<li><a href="product.jsp">제품 소개</a></li>
		  </ul>
		</nav>  
	  <section class="content">
		<h2>자유게시판</h2> 
		 <article>
	
	 <%
		 BufferedReader reader = null;
		
		//게시판 내용 읽어옴
		String filename = "board.txt";
		String filePath = 
					application.getRealPath("/WEB-INF/" + filename);
					
		//리스트 생성
		ArrayList<Bulletin> items;
		items = new ArrayList<Bulletin>();
		
		try{
			reader = new BufferedReader(new FileReader(filePath));//파일 불러와서
			
			//무한반복돌림
			while(true){
				String title = "";
				String body = "";
				String writer = "";
				String bDate = "";
				String str = reader.readLine();
				String strCheck = "";
				if(str == null)	//비어있으면 브레이크
					break;
				
				title += str;	//제목 넣고
				str = reader.readLine();	//다음읽음
				writer += str; //작성자
				
				str = reader.readLine();	//다음 읽음
				
				//start, end의 문제점은 본문에 start, end라는 단어를 쓰면 뻑남
				if( str.equals("start"))	//strat부터 end까지 본문내용 (엔터까지 포함하기 위해)
				{
					for(;;)
					{
						str = reader.readLine();
						if( str.equals("end"))	//end가 아니라면
							break;
						
						body += str;
						body += "<BR>";	//엔터쳐주고
					}
				}
				str = reader.readLine();
				bDate += str;		//날짜 읽어줌
				
				items.add(new Bulletin(title, body, writer, bDate));	//리스트 add해줌
			}
		
		} catch (FileNotFoundException e) {
		} catch (IOException ioe) {
		} finally {
			try {
				reader.close();
			} catch(Exception e) {
			}
		}
	
		Iterator iterator = items.iterator();	//리스트 전체출력하기 위해
	%>
	
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		  <tr height="5"><td width="5"></td></tr>
		 <tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
		   <td width="5"><img src="images/table_left.gif" width="5" height="30" /></td>
		   <td width="73">번호</td>
		   <td width="379">글</td>
		   <td width="73">작성자</td>
		   <td width="164">작성일</td>
		   <td width="7"><img src="images/table_right.gif" width="5" height="30" /></td>
		  </tr>
		  <%
				
			  while(iterator.hasNext()) {	//리스트가 없어질떄까지
				Bulletin element = (Bulletin) iterator.next();	//리스트 전체출력하기
		  %>
		<tr height="25" align="center">
				<td>&nbsp;</td>
				<td><%=count%></td>
				<td align="left"><p class="over1"><%=element.getBody() %></p></td>
				<td align="center"><%=element.getWriter() %></td>
				<td align="center"><%=element.getDate() %></td>
				<td>&nbsp;</td>
		</tr>
		  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
		  <%
		  count ++;	//글번호 ++
			  }
		  %>

		 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
		 </table>
		 
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		  <tr><td colspan="4" height="5"></td></tr>
		  <tr align="center">
	 <form action=writeBoard.jsp method=post>
		<td><input type=submit value='글쓰기'></td>
	 </form>
	 </tr>
		</table>
  </article></section>
  <footer>
    <p>한국산업기술대학교 컴퓨터공학과 12학번 박경재, 박재환 </p>  
    <address> <strong>학번</strong> 2012152014, 2012154023</address>      
  </footer>
</div>
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