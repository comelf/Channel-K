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
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-6506232884322856",
	    enable_page_level_ads: true
	  });
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
	
	<div class="footer">
		<div class="container-fluid footer-content-1">
			<div class="container">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
						<div style="margin-bottom: 20px;">
							<p class="channelk-info">와이디어타임즈 채널K의 모든 캡-콘텐츠들은 와이디어타임즈에서 제작 및 채널K를 통해서 공급하고 있습니다. </p>
							<p class="channelk-info">와이디어타임즈의 승인없이 캡-콘텐츠의 일부 또는 전체를 복사하여 다른 매체 (개인 미디어 포함)에 게재하는 행위는 법적 조치에 처해질 수 있습니다.</p>
						</div>
						<div>
							<p class="channelk-address">사업자 등록번호 : 617-37-46891 | 업태 : 서비스업 | 종목 : 온라인디지털콘텐츠 제공업</p>
							<p class="channelk-address">주소 : 경기도 성남시 대왕판교로645번길 12, 9층 (삼평동, 경기창조혁신센터) </p>
							<p class="channelk-address">12, Daewangpangyo-ro 645beon-gil, Bundang-gu, Seongnam-si, Gyeonggi-do, Republic of Korea</p>
							<p class="channelk-info">고객문의 : info.ydeatimes@gmail.com | 제작사 제휴 문의 contact.ydeatimes@gmail.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<div class="container-fluid footer-content-2">
			<div class="container">		
				<div class="row">
					<div class="col-md-4 text-center channelk-record">2015 부산대학교 LINC사업단 지원기업 선정</div>
					<div class="col-md-4 text-center channelk-record">2015 경기창조혁신센터 SMART2030 사업자 선정</div>
					<div class="col-md-4 text-center channelk-record">2016 창업진흥원 창업맞춤형 사업화 지원사업 창업기업 선정</div>
				</div>
			</div>
		</div>
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