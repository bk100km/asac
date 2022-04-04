<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String sid = (String)session.getAttribute("sid");
	// System.out.println(id);
	
	if(sid != null){
		if(sid.equals("admin")){
		session.invalidate();
		out.println("<script>");
		out.println("alert('관리자 계정으로 접속하였습니다.');");
		out.println("location.href='http://localhost:8080/asac/me/ad/lo';");
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
      <a class="navbar-brand" href="http://localhost:8080/asac/me/se/in"><strong id="Logo">&nbsp;ASAC&nbsp;&nbsp;&nbsp;</strong>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" id="mainNav2">
        <li><a href="http://localhost:8080/asac/or/se/li">주문관리</a></li>
        <li><a href="http://localhost:8080/asac/pr/se/la">상품관리</a></li>
        <li><a href="http://localhost:8080/asac/sa/se/sd">매출관리</a></li>
        <li><a href="http://localhost:8080/asac/me/se/iF">판매자 정보</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <%
    	if(sid == null){
		%>
		<li><a href="http://localhost:8080/asac/me/se/lo" title="판매자 로그인 링크로 이동"><span class="glyphicon glyphicon-log-in"></span> 판매자 로그인&nbsp;</a></li>
   	 	<li><a href="http://localhost:8080/asac/me/se/jo" title="판매자 회원가입 링크로 이동"><span class="glyphicon glyphicon-user"></span> 판매자 회원가입&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <%
		} else {
		%>   	 	
        <li><a href="http://localhost:8080/asac/me/se/lO" title="로그아웃 링크로 이동"><span class="glyphicon glyphicon-log-out"></span> 로그아웃&nbsp;</a></li>
	    <%
		}
		%>        
      </ul>
    </div>
  </div>
</nav>
</header>

</body>