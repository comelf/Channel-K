<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<link href="/css/lib/bootstrap.min.css" rel="stylesheet">
	<link href="/css/base.css?v=2017042001" rel="stylesheet">
	<title><decorator:title default="TV 보다 살짝 더 재미있는 채널K" /></title>
	<decorator:head />
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	  ga('create', 'UA-91951630-1', 'auto');
	  ga('send', 'pageview');
	</script>
	<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "5a7464c1940f";
		wcs_do();
	</script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="nav-header">
          <a class="navbar-title" href="/"><img class="logo" alt="Channel-K Logo"  src="/img/logo/logo.png"></a>
        </div>
        <div class="navbar-body">
	          <ul class="nav navbar-nav">
	            <li><a href="/cap">캡-콘텐츠 연재중</a></li>
	            <!-- <li><a href="/broadcast">현재 TV 방영중</a></li> -->
	            <!-- <li><a href="/video">영상 컨텐츠</a></li> -->
	            <li><a href="/etc/list">TV 캡 다시 보기</a></li>
	          </ul>
	        </div>
      </div>
    </nav>
	
	<decorator:body />


<div id="script-wrapper">
	<script src="/js/jquery.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/freewall.js"></script>
	<decorator:getProperty property="page.local_script"></decorator:getProperty>
	<script type="text/javascript">
		
	</script>
</div>
</body>
</html>