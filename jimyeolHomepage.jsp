<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>

<%
 
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
	left:center;
	font-size:2em;		
	color:rgb(0,0,0);	
}
h2{
	color:#00f;
}
#para3{	text-align:center;}

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
    <nav class="navi">		//위에 navi 디자인 
      <ul>
        <li><a href="jimyeolHomepage.jsp">직원 소개</a></li>
        <li><a href="board.jsp">자유게시판</a></li>
        <li><a href="employment.jsp">채용 안내</a></li>
        <li><a href="product.jsp">제품 소개</a></li>
      </ul>
    </nav>  
  <section class="content">
    <h2>직원 소개</h2>    
     <article>
	 <p id="para3"><strong>박경재, 박재환</strong><br>
			한국산업기술대학교 컴퓨터 공학과<br><br>
			지멸컴퍼니는 온라인 세상에서 창출할 수 있는 가치에 대해 늘 고민하고 제시해 왔습니다.<BR>
또한 온라인을 넘어서 새로운 즐거움을 연결해 나가기 위해 끊임없이 도전하고 있습니다.<BR>
<BR>
진지함, 헌신적인 열정, 감동을 주고자 하는 지멸컴퍼니의 문화를 통해<BR>
우리가 만든 게임이 세계적인 브랜드의 게임으로 자리매김 했습니다.<BR>
<BR>
더 나아가 지구촌 한 사람이라도 더 즐겁게 연결하고<BR>
세상 사람들의 서로의 삶에 즐거움을 엮어 나갈 수 있도록 노력하고 있습니다.<BR>
<BR>
옳은 일, 즐거운 일로 세상에 변화를 이끌고<BR>
위대한 도약을 해나가는 지멸컴퍼니의 도전을 지켜봐 주십시오.<BR>
			</p><br><Br>
		<p id="para3"><img src="images/company.jpg"><br><br>
		지멸 컴퍼니를 위해 열심히 일하겠습니다.</p><br>
		
  </article></section>
  <footer>
    <p>한국산업기술대학교 컴퓨터공학과 12학번 박경재, 박재환 </p>  
    <address> <strong>학번</strong> 2012152014, 2012154023</address>      
  </footer>
</div>
</body>
</html>


<%!
	//쿠키목록 받아오는 함수
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
