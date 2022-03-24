<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String sid = (String)session.getAttribute("sid");
	// System.out.println(id);
	
	if(sid != null){
		if(!sid.equals("admin")){
		session.invalidate();
		out.println("<script>");
		out.println("alert('접근 권한이 없습니다.');");
		out.println("location.href='/asac/';");
		out.println("</script>");	
		}
	}
%>    

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
  
<style>
.navbar-header {
	height: 120px;
	padding: 1em;
	padding-top: 0.5em;
	margin-left: 3% !important;
}

.navbar-inverse {
    background-color: #E1B771 !important;
    border-color: #E1B771 !important;
}
.navbar-inverse .navbar-nav>li>a {
    color: #4a2104 !important;
	font-family: Pretendard;
    line-height: 2.5em !important;
    font-size: 2.4em;
    margin-left: 40px;
}

.navbar-inverse .navbar-nav>li>a:hover {
    color: white !important;
}

.navbar-inverse .navbar-brand {
    color: #5c2200 !important;
	font-family: Pretendard;
	font-size: 5em !important;
	line-height: 70px;
}

.navbar-inverse .navbar-brand:hover {
    color: white !important;
}

.nav>li {
margin: auto;
padding: 0;
}

.navbar-nav>li>a {
    line-height: 2.5em !important;
}
.navbar-right>li>a {
    line-height: 3.6em !important;
}
.navbar-right li {
font-size: 0.7em;
}

</style>

</head>
<body>

<header>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/asac/me/ad/in"><strong id="Logo">&nbsp;ASAC&nbsp;&nbsp;&nbsp;</strong>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" id="mainNav2">
        <li><a href="/asac/or/ad/li">주문관리</a></li>
        <li><a href="http://localhost:8080/asac/pr/ad/li">상품관리</a></li>
        <li><a href="">정산관리</a></li>
        <li><a href="http://localhost:8080/asac/me/ad/li">회원관리</a></li>
        <li><a href="">판매자 정보</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="http://localhost:8080/asac/me/ad/lO" title="로그아웃 링크로 이동"><span class="glyphicon glyphicon-log-out"></span> 로그아웃&nbsp;</a></li>
      </ul>
    </div>
  </div>
</nav>
</header>

</body>