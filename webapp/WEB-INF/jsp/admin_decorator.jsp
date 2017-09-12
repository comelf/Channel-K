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
	<link href="/css/lib/sb-admin.css" rel="stylesheet">
	<link href="/css/lib/morris.css" rel="stylesheet">
	<link href="/css/admin_base.css" rel="stylesheet">
	<title><decorator:title default="Channel-K 관리자" /></title><decorator:head />
</head>
<body>

<div id="wrapper">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/admin">Channel-K</a>
		</div>
		
		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> User Name <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li class="divider"></li>
					<li>
						<a href="/user/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log Out</a>
					</li>
				</ul>
			</li>
		</ul>

		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li class="active">
					<a href="/admin"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> Dashboard </a>
				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#main"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>  메인관리 </a>
					<ul id="main" class="collapse">
						<li>
							<a href="/admin/main/topbanner">상단 배너</a>
						</li>
						<li>
							<a href="/admin/main/mainpage">메인 Content</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#content"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span> Content </a>
					<ul id="content" class="collapse">
						<li>
							<a href="/admin/content/list">Content 목록</a>
						</li>
						<li>
							<a href="/admin/content/add">Content 추가</a>
						</li>
						<li>
							<a href="/admin/capcontent/list">Cap Content 목록</a>
						</li>
						<li>
							<a href="/admin/capcontent/add?cap=true">Cap Content 추가</a>
						</li>
						<!-- <li>
							<a href="/admin/capcontent/add?cap=false">Non Cap Content 추가</a>
						</li> -->
						<li>
							<a href="/admin/etccontent/list">기타 Content 목록</a>
						</li>
						<li>
							<a href="/admin/etccontent/add">기타 Content 추가</a>
						</li>
						<li>
							<a href="/admin/content/category">카테고리</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#user"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 회원관리 </a>
					<ul id="user" class="collapse">
						<li>
							<a href="/admin/user/list">회원 목록</a>
						</li>
						<li>
							<a href="/admin/user/add">회원 추가</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>

	<decorator:body />


</div>

<div id="script-wrapper">
	<script src="/js/jquery.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/plugins/handlebars-v3.0.3.js"></script>
	
	<decorator:getProperty property="page.local_script"></decorator:getProperty>
	<script type="text/javascript">
		var tap = "#" + location.pathname.split('/')[1];
		function menuOpen(){
			$(tap).collapse('toggle');
		}
		setTimeout("menuOpen()",1);
		
	</script>
</div>
</body>
</html>