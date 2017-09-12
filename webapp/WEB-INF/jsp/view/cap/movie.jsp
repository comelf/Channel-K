<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<div class="container deco-body">
	<div class="cap-content">
		<div class="row">
			<div class="col-md-7 col-xs-12 cap-banner thumbnail">
				<div class="thumbnail-wrapper" style="padding-top: 50%;">
					<div class="thumbnail-img" style="background-image: url(${info.banner.getUrlPathWithQuality(0) });"></div>
				</div>
			</div>
			<div class="col-md-5 col-xs-12 cap-info">
				<div class="row">
					<div class="col-md-12 col-xs-12 info-title"><strong>${info.title}</strong><span>(${info.sub_title})</span></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head info-bt info-br">${info.category.text}</div>
					<div class="col-md-3 col-xs-3 info-bt info-br">${info.episode}</div>
					<div class="col-md-6 col-xs-6 info-bt">${info.time}</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head info-bt">제작</div>
					<div class="col-md-9 col-xs-9 info-bt">${info.metas["creators"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head">배급</div>
					<div class="col-md-9 col-xs-9">${info.metas["distributor"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head">출연배우</div>
					<div class="col-md-9 col-xs-9">${info.metas["actors"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head">감독</div>
					<div class="col-md-9 col-xs-9">${info.metas["director"].meta_value}</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3 info-head">줄거리</div>
					<div class="col-md-9 col-xs-9" style="line-height: 2.1;">${info.metas["summary"].meta_value}</div>
				</div>
			</div>
		</div>
		
		
		<div class="row cap-list">
			<div class="row">
				<div class="col-md-7">
					<c:forEach items="${capContent}" var="cap">
						<hr>
						<div class='row'>
							<div onclick="location.href='/cap/content/page?number=${cap.getId()}'" style="cursor: pointer; overflow: hidden;">
								<div class='col-md-2  col-xs-3'>
									<div class='thumbnail'>
										<img src='${cap.thumbnail.getUrlPathWithQuality(0) }' alt='...'>
									</div>
								</div>
								<div class='col-md-10  col-xs-9'>
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
				<div class="col-md-5">
					<!-- <div>
						<div>인기 게시글</div>
						<div class="row">
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="/images/001g/1부.jpg" alt="...">
							      <div class="caption" style="height: 60px;">
							        <p>인생에 남길 걸작!</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="/images/001g/3부.jpg" alt="...">
							      <div class="caption" style="height: 60px;">
							        <p>두려울 정도로 경이롭고 아름답다</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="/images/001g/2부.jpg" alt="...">
							      <div class="caption" style="height: 60px;">
							        <p>허풍도 적절한 ‘우주 서커스’</p>
							      </div>
							    </div>
							</div>
						</div>
					</div> -->
				</div> 
			</div>
		</div>
		
		<c:if test="${paging.totalCount > 10}">
			<div class="row center">
				<div class="col-md-12 text-center">
					<ul class="pagination">
						<c:if test="${paging.firstPageNo < paging.startPageNo}">
							<li><a href="/cap/content?id=${ contentId }&page=${paging.startPageNo-1}">«</a></li>
						</c:if>
					
					  	<c:forEach var="pageNum" begin="${paging.startPageNo}" step="1" end="${paging.endPageNo}">
					  		<c:choose>
					  			<c:when test="${paging.pageNo eq pageNum}"><li class="active"></c:when>
					  			<c:otherwise><li></c:otherwise>
					  		</c:choose>
					  		<a href="/cap/content?id=${ contentId }&page=${pageNum}">${pageNum}</a></li>
					  	</c:forEach>
					  	<c:if test="${paging.endPageNo < paging.finalPageNo}">
							<li><a href="/cap/content?id=${ contentId }&page=${paging.endPageNo+1}">»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
		
		
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