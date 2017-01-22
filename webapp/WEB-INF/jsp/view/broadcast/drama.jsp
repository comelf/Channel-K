<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="cap-content">
		<div class="row">
			<div class="col-md-7 cap-banner">
				<img src="${info.thumbnail.getUrlPathWithQuality(0) }" width="100%">
			</div>
			<div class="col-md-5 cap-info">
				<div class="row">
					<div class="col-md-12 info-title"><strong>${info.title}</strong><span>(${info.sub_title})</span></div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head info-bt info-br">${info.category.text}</div>
					<div class="col-md-3 info-bt info-br">${info.episode}</div>
					<div class="col-md-6 info-bt">${info.time}</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head info-bt">제작</div>
					<div class="col-md-9 info-bt">${info.metas["creators"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">배급</div>
					<div class="col-md-9">${info.metas["distributor"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">출연배우</div>
					<div class="col-md-9">${info.metas["actors"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">감독</div>
					<div class="col-md-9">${info.metas["director"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">줄거리</div>
					<div class="col-md-9" style="line-height: 2.1;">${info.metas["summary"].meta_value}</div>
				</div>
			</div>
		</div>
		
		
		<div class="row cap-list">
			<div class="row">
				<div class="col-md-7">
					<c:forEach items="#{capContent}" var="cap">
						<hr>
						<div class='row'>
							<div class='col-md-2  col-xs-2'>
								<div class='thumbnail'>
									<img src='${cap.thumbnail.getUrlPathWithQuality(0) }' alt='...'>
								</div>
							</div>
							<div class='col-md-10  col-xs-10'>
							<div>
								<strong>${cap.title}</strong></div>
								<div>${cap.summary}</div>
								<div>${cap.createDate}</div>
							</div>
						</div>
					</c:forEach>
				<hr>
				</div>
				<div class="col-md-5">
					<!-- <div>
						<div>인기 게시글</div>
						<div class="row">
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
						</div>
					</div> -->
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