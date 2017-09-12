<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<div class="container deco-body">
	<div class="cap-content">
		<div class="row">
				<div class="col-md-12 content-title" >
					${capContent.title}
				</div>
				
				<div class="col-md-12 content-body" >
					${capContent.content}
				</div>
				<div class="col-md-12 content-footer">
					<div class="pull-right"><a href="/cap/content?id=${capContent.info.id}">목록 보기</a></div>
				</div>
		</div>
		
		<div class="row cap-list">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12">
					<c:forEach items="${capContentList}" var="cap">
						<hr>
						<div class='row'>
							<div onclick="location.href='/cap/content/page?number=${cap.id}'" style="cursor: pointer; overflow: hidden;">
								<div class='col-md-2  col-xs-2'>
									<div class='thumbnail' style="margin-bottom: 0px;">
										<div class="thumbnail-wrapper">
											<div class="thumbnail-img" style="background-image: url(${cap.thumbnail.getUrlPathWithQuality(0)});"></div>
										</div>
									</div>
								</div>
								<div class='col-md-10  col-xs-10'>
								<div>
									<strong>${cap.title}</strong></div>
									<div>${cap.summary}</div>
									<div>${cap.createDate}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				<hr>
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
		
    });
	</script>
	-->
	</content>
</body>
</html>