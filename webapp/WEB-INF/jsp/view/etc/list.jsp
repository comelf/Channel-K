<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="etc-content">
<!-- 		<div class="col-md-8 col-sm-12">
			<div class="row">
			<div class="col-md-12">
				<div class="top-banner">
					<div class="size2"><img src="/images/etc/018.무한도전.jpg" width="100%" height="100%" style="    height: 260px;"></div>
				</div>
			</div>
		</div> -->

		<div class="etc-list">
			<div class="row">
				<c:forEach items="${etcList}"  var="etc" >
					<div class='col-md-3  col-xs-6'>
						<a href="/etc/content/${etc.id}?page=${paging.pageNo}">
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
				
				
				<!-- <div class="col-md-3">
					<div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <p>blabla</p>
				      </div>
				    </div>
				</div> -->
			</div>
			<c:if test="${paging.totalCount > 16}">
				<div class="row center">
					<div class="col-md-12 text-center">
						<ul class="pagination">
							<c:if test="${paging.firstPageNo < paging.startPageNo}">
								<li><a href="/etc/list?page=${paging.startPageNo-1}">«</a></li>
							</c:if>
						
						  	<c:forEach var="pageNum" begin="${paging.startPageNo}" step="1" end="${paging.endPageNo}">
						  		<c:choose>
						  			<c:when test="${paging.pageNo eq pageNum}"><li class="active"></c:when>
						  			<c:otherwise><li></c:otherwise>
						  		</c:choose>
						  		<a href="/etc/list?page=${pageNum}">${pageNum}</a></li>
						  	</c:forEach>
						  	<c:if test="${paging.endPageNo < paging.finalPageNo}">
								<li><a href="/etc/list?page=${paging.endPageNo+1}">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>
		</div>
		
		</div>
		<div class="col-md-4 col-sm-12">
			<!-- <div class="row">
				<div class="best-section">
					<div class="best-title">BEST</div>
					<ol class="best-list" >
						<li><a href="#">SBS 생활의 달인 초밥왕 편...</a></li>
						<li><a href="#">MBC 시사저널 연쇄살인마</a></li>
						<li><a href="#">KBS 다큐멘터리 3일</a></li>
						<li><a href="#">tvN 꽃보다 할배 스위스</a></li>
						<li><a href="#">배우들이 죽이 않는 이유</a></li>
						<li><a href="#">김래원 출연작 Top 5</a></li>
						<li><a href="#">W 한효주가 입고 나온 드레스</a></li>
						<li><a href="#">닥터스 촬영장소를 알아보자</a></li>
						<li><a href="#">몬스터 비하인드 스토리</a></li>
					</ol>
				</div>
			</div> -->
		</div>
	</div>	

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