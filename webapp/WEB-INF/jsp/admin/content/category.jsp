<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<body>
        <div id="page-wrapper">
            <div class="container-fluid">
            	<!-- Page Heading -->
				<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Category</h1>
                        <ol class="breadcrumb">
                            <li class="active">Content Category</li>
                        </ol>
                    </div>
                </div>
               	
               	<!-- Message -->
                <c:if test="${not empty msg}">
	                <div class="row">
	                 	<div class="col-lg-12">
							<div class="alert alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						    	<strong>${msg}</strong>
							</div>
						</div>
	                </div>
                </c:if>
                	
				
	                <div class="row">
	                	<div class="col-md-6">
                			<div class="table-responsive">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>+</th>
											<th>text</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${categoryList}">
											<tr>
												<td class="non-click"><input type="checkbox" id="inlineCheckbox1" value="${row.id}"></td>
												<td>${row.text}</td>
												<td>
													<form:form modelAttribute="category" role="form" id="form" action="/admin/content/category/delete" method="post" >
														<form:input path="id" type="text" cssClass="form-control hidden" value="${row.id}" readonly="true"/>
														<input type="submit" class="btn btn-xs btn-default" id="savebutton" value="삭제" />
													</form:form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                		</div>
                		<div class="col-md-6">
                			<form:form modelAttribute="category" role="form" id="form" action="/admin/content/category/create" method="post" >
                				<div class="form-group">
		                			<label>Category</label>
		                			<form:input path="text" type="text" cssClass="form-control" placeholder="Title"/>
								    <form:errors path="text" cssClass="error-msg" />
								    <input type="submit" class="btn btn-danger" id="savebutton" value="저장" />
		                		</div>
                			</form:form>
                		</div>
	                </div>
	                
	                <div class="row">
	                	<div class="col-lg-12">
	                		<div class="block-400">
	                		</div>
	                	</div>
	                </div>
			</div>
		</div>
		
		<!-- Photo Uploader -->
	        <div id="photo-uploader" class="pop-layer" >
	            <div class="bg"></div>
                <div class="pop-container">
                	<div class="btn-r">
                		<span class="glyphicon glyphicon-remove close-btn"></span>
                	</div>
                	<div class="pop-conts">
                		<h4><label  class="col-lg-10">상품 이미지</label></h4>
                		<form method="POST" enctype="multipart/form-data" action="/media/photoUpload" role="form" class="form-horizontal" id="form-img-upload">
                			 <div class="form-group">
                			 	<label class="col-lg-3 control-label">이미지</label>
                			 	<div class="col-lg-7">
                			 		<input type="file" name="file">
                			 		<span class="error-msg"></span>
                			 	</div>
					         </div>
					         <div class="form-group">
					         	<label class="col-lg-3 control-label">설명</label>
					         	<div class="col-lg-7">
					         		<input type="text" name="alt" class="form-control">
					         	</div>
					         </div>
					         <div class="form-group">
					         	<div class="col-lg-offset-3 col-lg-7">
					         		<input type="submit" class="btn btn-primary" value="파일 올리기">
					         	</div>
					         </div>
					     </form>
                	</div>
                	
                </div>
            </div>
		
		<content tag="local_script">
	<!-- 
		<script src="/js/tinymce/tinymce.min.js"></script>
		<script src="/js/tinymce.init.js"></script>
		<script src="/js/admin.js"></script>
		
	-->
	</content>
</body>
</html>