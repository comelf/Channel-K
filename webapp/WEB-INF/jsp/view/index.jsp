<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<body>
	<div class="main-content">
		<div class="row">
			<div class="col-md-12">
				<div id="top-banner" style="display: block;" >
					
				</div>
			</div>
		</div>
		
		<%-- <div class="today-cap content-list">
			<div class="row section-head">
				<div class="col-md-12">
					<div>캡-콘텐츠 연재중</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${ capList}"  var="cap" end="8">
					<div class='col-md-3  col-xs-6'>
						<a href="/cap/content/page?number=${cap.id}">
						<div class='thumbnail'>
							<img src='${cap.thumbnail.getUrlPathWithQuality(0)}' height="100px" style="width: 100%;height: 180px;">
							<div class='caption'>
								<p>${cap.title}</p>
								<p>캐스터 : 와이군</p>
							</div>
						</div>
						</a>
					</div>
				</c:forEach>
				
				<c:forEach items="${ capList}"  var="cap" begin="8">
					<div class='col-md-2  col-xs-4'>
						<div class='thumbnail'>
							<img src='${cap.thumbnail.getUrlPathWithQuality(0)}' height="100px" style="width: 100%;height: 130px;">
							<div class='caption'>
								<p>${cap.title}</p>
								<p>캐스터 : 와이군</p>
							</div>
						</div>
					</div>
				</c:forEach>
			
				
				<!-- <div class="col-md-3">
					<div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <p>blabla</p>
				      </div>
				    </div>
				</div> -->
			</div>
		</div> --%>
		
		<!-- <div class="today-broadcast content-list">
			<div class="row section-head">
				<div class="col-md-12">
					<div>방송 섹션</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-xs-6">
					<div class="size1 program-table" style="background-color:rgb(2,3,80);color:#fff;padding:10px;">
						<div>수목드라마</div><hr>
						<div>MBC <strong>W</strong></div>
						<div>KBS <strong>함부러 애뜻하게</strong></div>
						<div>SBS <strong>원티드</strong></div>
						</div>
				</div>
				<div class="col-md-4 col-xs-6">
					<div class="size2"><img src="/img/sample/today/ekfdmldudls.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-4">
					<div class="size1"><img src="/img/sample/today/dnflwlqdp.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/dlawlsdhofks.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-4">
					<div class="size1"><img src="/img/sample/today/tyvlddhkd.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/wlfxndmlghktls.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-4">
					<div class="size1"><img src="/img/sample/today/mbcw.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/ghstnfskasu.jpg" width="100%" height="100%"></div>				
				</div>
			</div>
		</div> -->
		
		
		<div class="today-cap content-list">
			<div class="row section-head">
				<div class="col-md-12">
					<div>TV 캡 다시보기</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${etcList}"  var="etc" end="7">
					<div class='col-md-3  col-xs-6'>
						<a href="/etc/content/${etc.id}">
							<div class="thumbnail">
								<div class="thumbnail-wrapper">
									<div class="thumbnail-img" style="background-image: url(${etc.thumbnail.getUrlPathWithQuality(0)});"></div>
								</div>
								<div class='caption'>
									<p class="title">${etc.title}</p>
									<p>캐스터 : ${etc.user.user_name}</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				
				<c:forEach items="${etcList}"  var="etc" begin="8" end="12">
					<div class='col-md-2  col-xs-4'>
						<a href="/etc/content/${etc.id}">
						<div class='thumbnail'>
							<div class="thumbnail-wrapper">
								<div class="thumbnail-img" style="background-image: url(${etc.thumbnail.getUrlPathWithQuality(0)});"></div>
							</div>
							<div class='caption'>
								<p class="title">${etc.title}</p>
								<p>캐스터 : ${etc.user.user_name}</p>
							</div>
						</div>
						</a>
					</div>
				</c:forEach>
				
				<c:if test="${fn:length(etcList) > 13}">
					<div class='col-md-2  col-xs-4'>
						<a href="/etc/list">
						<div class='thumbnail'>
							<div class="thumbnail-wrapper">
								<div class="thumbnail-img thumbnail-more" style="background-image: url(${etcList[13].thumbnail.getUrlPathWithQuality(0)})"></div>
							</div>
							<div class='caption'>
								<p style="text-align: center; ">더보기</p>
								<p style="height: 1.42857143em;"></p>
							</div>
						</div>
						</a>
					</div>
				</c:if>
				
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


	<content tag="local_script">
	<!-- 
	<script type="text/javascript">
	$( document ).ready(function() {
		$(function() {
			var banners = ${mainTop};
			
			var topBanner = $("#top-banner");
			var cellW = topBanner.width() / 12;
			var cellH = topBanner.width() * 0.45 / 6;

			var temp = "<div class='brick' style='width:{width}px; height: {height}px; background-Image: {image}'><div class='cover'>{title}</div></div>";
			var w = 1, h = 1, html = '', color = '', limitItem = banners.length;
			for (var i = 0; i < limitItem; ++i) {
				var banner = banners[i];
				var w = banner["sizeW"];
				var h = banner["sizeH"];
				var image 	= "url(/images/" + banner["image"] + ")";
				var title 	= banner["title"]
				html += temp.replace(/\{height\}/g, h*cellW).replace(/\{width\}/g, w*cellH).replace("{image}", image).replace("{title}", title);
			}
			$("#top-banner").html(html);
		
			var wall = new Freewall("#top-banner");
			wall.reset({
					selector: '.brick',
					cellW: cellW,
					cellH: cellH,
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