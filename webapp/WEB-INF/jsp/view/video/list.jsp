<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<div class="container deco-body">
	<div class="video-content">
		<div class="col-md-8 col-sm-12">
			<div class="row">
			<div class="col-md-12">
				<div class="top-banner">
					<div class="size2"><img src="/img/sample/banner/69f56a982c7131195e66ff303327865f.jpg" width="100%" height="100%"></div>
				</div>
			</div>
		</div>

		<div class="etc-list">
			<div class="row">
				<% for(int i =0; i < 8; i++){
					out.println("<div class='col-md-3  col-xs-6'><div class='thumbnail'><img src='/img/sample/cap/skqlgyrhk.jpg' alt='...'><div class='caption'><p>blabla</p><p>blabla</p></div></div></div>");	
				}
				%>
				
				
				<!-- <div class="col-md-3">
					<div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <p>blabla</p>
				      </div>
				    </div>
				</div> -->
			</div>
		</div>
		
		</div>
		<div class="col-md-4 col-sm-12">
			<div class="row">
				<div class="best-section">
					<div class="best-title">BEST</div>
					<ol class="best-list" >
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
						<li><a href="#">d</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- 	
	
	
	<img alt="" src="/img/sample/main/gkdlzlr.jpg">
	 -->
	<content tag="local_script">
	<!-- 
	<script type="text/javascript">
	$( document ).ready(function() {
		$(function() {
			var banners = [{image:"rhdgkdrksmsrlf.jpg",title:"공항가는길"}, 
									{image:"ekrxjtm.jpg",title:"닥터스"},
									{image:"skdls.jpg",title:"나인"},
									{image:"ekfdmldusdls.jpg",title:"달의연인"},
									{image:"qbxldlstkdlem.jpg",title:"뷰티 인사이드"},
									{image:"gkdlzlr.jpg",title:"지붕뚫고 하이킥"},
									{image:"W1.jpg",title:"W(더블유)"}];

			var temp = "<div class='brick' style='width:{width}px; height: {height}px; background-Image: {image}'><div class='cover'>{title}</div></div>";
			var w = 1, h = 1, html = '', color = '', limitItem = banners.length;
			for (var i = 0; i < limitItem; ++i) {
				h = 1 + 3 * Math.random() << 0;
				w = 1 + 3 * Math.random() << 0;
				var image 	= "url(/img/sample/main/" + banners[i]["image"] + ")";
				var title 	= banners[i]["title"]
				html += temp.replace(/\{height\}/g, h*120).replace(/\{width\}/g, w*150).replace("{image}", image).replace("{title}", title);
			}
			$("#top-banner").html(html);
		
			var wall = new Freewall("#top-banner");
			wall.reset({
					selector: '.brick',
					cellW: 160,
					cellH: 160,
					gutterY: 0,
        			gutterX: 0,
					onResize: function() {
					    var topBanner = $("#top-banner");
						var pWidth = topBanner.width();
						var pHeight = pWidth * 0.45;
						topBanner.height(pHeight + 10);
						wall.refresh(pWidth, pHeight);
					}
				});	
				var topBanner = $("#top-banner");
				var pWidth = topBanner.width();
				var pHeight = pWidth * 0.45;
				topBanner.height(pHeight + 10);	
				 wall.fitZone(pWidth , pHeight);
		});    
    });
	</script>
	-->
	</content>
</body>
</html>