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
	<link href="/css/base.css" rel="stylesheet">
	<title><decorator:title default="TV 보다 살짝 더 재미있는 채널K" /></title><decorator:head />
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
	            <li><a href="/broadcast">현재 TV 방영중</a></li>
	            <!-- <li><a href="/video">영상 컨텐츠</a></li> -->
	            <li><a href="/etc">TV 캡 다시 보기</a></li>
	          </ul>
	        </div>
      </div>
    </nav>
	
        <div class="container deco-body">
			<decorator:body />
		</div>


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