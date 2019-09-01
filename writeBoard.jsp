<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%
 
	request.setCharacterEncoding("euc-kr");
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
    <h2>글쓰기</h2> 
     <article>
	 <form action=writed.jsp method=get>
	 제목 : <input type=text size="80" max="60" name=title><br>
	 <p><textarea cols="88" rows="8" name=body></textarea></p>
	 <p><input type="submit" value='글쓰기'>
	 <input type="reset" value='다시쓰기'></p>
	 </form>
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