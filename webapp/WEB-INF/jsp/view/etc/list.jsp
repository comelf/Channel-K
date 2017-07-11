<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="etc-content">
		<div class="etc-list row">
			<div class="col-md-9 col-sm-12">
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
										<p class="creator">캐스터 : ${etc.user.user_name}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<c:if test="${paging.totalCount > 15}">
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
			<div class="col-md-3 col-sm-12">
				<div class="row">
					<div class="best-section">
						<div class="best-title">BEST</div>
						<ol class="best-list" >
							<c:forEach items="${bestList}"  var="best" >
								<li><a href="/etc/content/${best.id}?page=${paging.pageNo}">${best.title}</a></li>
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>
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