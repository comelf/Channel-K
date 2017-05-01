<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
        <div id="page-wrapper">
            <div class="container-fluid">
				<c:set var="celNum" value="10,20,30,50,100"/>
			
					<!-- Page Heading -->
					<div class="row">
						<div class="col-md-12">
							<h1 class="page-header">Content 목록</h1>
							<ol class="breadcrumb">Content</ol>
						</div>
					</div>
					
				    <c:if test="${not empty msg}">
		                <div class="row">
		                 	<div class="col-md-12">
								<div class="alert alert alert-danger alert-dismissable">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							    	<strong>${msg}</strong>
								</div>
							</div>
		                </div>
		            </c:if>
					
					<!-- Item List table -->
					<!-- <div class="row">
						<div class="col-lg-12">
							<div class="fl-right mg-bottom">
								<form class="form-inline" role="form" action="/admin/content/list/search" method="get">
									<div class="form-group">
										<select class="form-control" name="type">
											<option value="name">Name</option>
										</select>
										<input type="text" class="form-control" name="query" placeholder="Search">
										<button class="btn btn-default" type="submit">검색</button>
									</div>
								</form>
							</div>
						</div>
					</div> -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading" style="overflow: hidden;">
										<h4>Content 목록 (${paging.totalCount})</h4>
								</div>
								<div class="panel-body">
									
									<div class="row">
										<div class="col-lg-12">
											<div class="table-responsive">
												<table class="table table-striped table-hover">
													<thead>
														<tr>
															<th>+</th>
															<th>img</th>
															<th>title (sub)</th>
															<th>관람가</th>
															<th>회차정보</th>
															<th>시간</th>
															<th>종류</th>
															<th>Status</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="row" items="${contentInfoList}">
															<tr>
																<td class="non-click"><input type="checkbox" id="inlineCheckbox1" value="${row.id}"></td>
																<td>
																	<c:if test="${not empty row.thumbnail}">
																		<img src="${row.thumbnail.getUrlPathWithQuality(0) }" height="30" width="30">
																	</c:if>
																</td>		
																<td>${row.title} (${row.sub_title})</td>
																<td>${row.rating}</td>
																<td>${row.episode}</td>
																<td>${row.time}</td>
																<td>${row.type.text}</td>
																<td>${row.status.text}</td>
															</tr>
														</c:forEach>
													</tbody>
													</div>
												</table>
											</div>
										</div>
									</div> 
									
									<div class="row center">
										<ul class="pagination">
											<c:if test="${paging.firstPageNo < paging.startPageNo}">
												<li><a href="/admin/content/list?page=${paging.startPageNo-1}&count=${paging.pageSize}">«</a></li>
											</c:if>
										
										  	<c:forEach var="pageNum" begin="${paging.startPageNo}" step="1" end="${paging.endPageNo}">
										  		<c:choose>
										  			<c:when test="${paging.pageNo eq pageNum}"><li class="active"></c:when>
										  			<c:otherwise><li></c:otherwise>
										  		</c:choose>
										  		<a href="/admin/content/list?page=${pageNum}&count=${paging.pageSize}">${pageNum}</a></li>
										  	</c:forEach>
										  	<c:if test="${paging.endPageNo < paging.finalPageNo}">
												<li><a href="/admin/content/list?page=${paging.endPageNo+1}&count=${paging.pageSize}">»</a></li>
											</c:if>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
		            	<div class="col-lg-12">
		                	<div class="block-200"></div>
		                </div>
		            </div>
					
					
					<div class="row">
		            	<div class="col-lg-12">
		                	<div class="block-200"></div>
		                </div>
		            </div>
				</div>
			</div>
		</div>
		
		<content tag="local_script">
		<!-- 	<script src="/js/table.js"></script>	-->
		</content>
</body>

</html>