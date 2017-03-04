<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="content-detail">
		<div class="row">
				<div class="col-md-12 content-title">
					${etcContent.title}
				</div>
				
				<div class="col-md-12 content-body">
					${etcContent.content}
				</div>
				<div class="col-md-12 content-footer">
					<div class="pull-right"><a href="/etc/list?page=${paging.pageNo}">목록 보기</a></div>
				</div>
		</div>
		
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