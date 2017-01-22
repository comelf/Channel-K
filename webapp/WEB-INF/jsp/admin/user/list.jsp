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
							<h1 class="page-header">User 목록</h1>
							<ol class="breadcrumb">User</ol>
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
										<h4>User 목록 (${paging.totalCount})</h4>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<div class="table-responsive">
												<table class="table table-striped table-hover">
													<thead>
														<tr>
															<th>+</th>
															<th>Id</th>
															<th>name</th>
															<th>Email</th>
															<th>Create</th>
															<th>Point</th>
															<th>Status</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="row" items="${userList}">
															<tr>
																<td class="non-click"><input type="checkbox" id="inlineCheckbox1" value="${row.id}"></td>
																<td>${row.user_login_id}</td>
																<td>${row.user_name}</td>
																<td>${row.user_email}</td>
																<td>${row.user_join_date}</td>
																<td>${row.user_point}</td>
																<td><c:if test="${row.user_status == 1}">Open</c:if><c:if test="${row.user_status == 0}">Close</c:if></td>
															</tr>
														</c:forEach>
													</tbody>
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