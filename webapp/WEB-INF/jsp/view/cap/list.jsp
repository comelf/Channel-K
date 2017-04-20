<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="cap-content">
		<div class="row cap-category">
			<div class="col-md-12">
				<div class="row main-category">
						<div class="col-md-2 col-xs-3 item"><a href="/cap">전체</a></div>
					<c:forEach items="${contentType}" var="type">
						<div class="col-md-2 col-xs-3 item"><a href="/cap?type=${type.id}">${type.text } 캡</a></div>
					</c:forEach>
				</div>
				<div class="row sub-category">
					<c:forEach items="${categorys}" var="category">
						<div class="col-md-1 col-xs-3 item"><a href="/cap?category=${category.id}">${category.text }</a></div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="row cap-list">
			<div class="row">
				<c:forEach items="${ capList}"  var="cap" end="2">
					<div class='col-md-4  col-xs-6'>
						<a href="/cap/content?id=${cap.id}">
						<div class='thumbnail'>
							<div class="thumbnail-wrapper">
								<div class="thumbnail-img" style="background-image: url(${cap.thumbnail.getUrlPathWithQuality(0)});"></div>
							</div>
							<div class='caption'>
								<p class="title">${cap.title}</p>
								<p class="creator">캐스터 : 와이군</p>
							</div>
						</div>
						</a>
					</div>
				</c:forEach>
				
				<c:forEach items="${ capList}"  var="cap" begin="2">
					<div class='col-md-3 col-xs-6'>
						<a href="/cap/content?id=${cap.id}">
						<div class='thumbnail'>
							<div class="thumbnail-wrapper">
								<div class="thumbnail-img" style="background-image: url(${cap.thumbnail.getUrlPathWithQuality(0)});"></div>
							</div>
							<div class="caption">
								<p class="title">${cap.title}</p>
								<p class="creator">캐스터 : 와이군</p>
							</div>
						</div>
						</a>
					</div>
				</c:forEach>
				
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
		
    });
	</script>
	-->
	</content>
</body>
</html>