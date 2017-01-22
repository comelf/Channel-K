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
                    <div class="col-md-12">
                        <h1 class="page-header">Content 수정</h1>
                        <ol class="breadcrumb">
                            <li class="active">Content 수정합니다.</li>
                        </ol>
                    </div>
                </div>
               	
               	<!-- Message -->
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
                	
				<form:form modelAttribute="capContent" role="form" id="form" action="/admin/capcontent/edit?cap=${isCap}" method="post" >
	                <form:input path="id" type="text" cssClass="hidden" />
	                <div class="row">
	                		<div class="col-md-12">
	                			<div class="image-block">
		                			<label>썸네일 (필수)</label>
		                			<img src="<c:if test="${not empty capContent.thumbnail}">${capContent.thumbnail.getUrlPathWithQuality(0) }</c:if>" width="400" class="">
		                			<form:input path="thumbnail_id" type="text" cssClass="hidden img-id" />
		                			<form:errors path="thumbnail_id" cssClass="error-msg" />
		                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 업로드" onclick="ADMIN.photoUpload(this)">
	                			</div>
	                		</div>
	                		
	                		<div class="col-md-6">
		                		<div class="form-group">
		                			<label>Content</label>
		                			<form:select path="content_id" cssClass="form-control">
		                				<option value="0">선택하세요</option>
		                				<c:forEach var="info" items="${contentInfoList}">
		                					<option value="${info.id}" <c:if test="${info.id eq capContent.info.id}">selected="selected"</c:if>>${info.title}</option>
		                				</c:forEach>
								    </form:select>
		                		</div>
		                	</div>
		                	<div class="col-md-6">
		                		<div class="form-group">
									<label>Status</label>
								    <form:select path="status_text" cssClass="form-control">
		                				<option value="0">선택하세요</option>
		                				<c:forEach var="status" items="${contentStatusList}">
		                					<option value="${status.text}" <c:if test="${status.text eq capContent.status.text}">selected="selected"</c:if>>${status.text}</option>
		                				</c:forEach>
								    </form:select>
		                		</div>
						    </div>
						    <div class="col-md-12">
		                		<div class="form-group">
									<label>Title</label>
									<form:input path="title" type="text" cssClass="form-control" placeholder="Item Name"/>
								    <form:errors path="title" cssClass="error-msg" />
		                		</div>
						    </div>
						    <div class="col-md-12">
		                		<div class="form-group">
									<label>요약</label>
									<form:input path="summary" type="text" cssClass="form-control" placeholder="Item Name"/>
								    <form:errors path="summary" cssClass="error-msg" />
		                		</div>
						    </div>
					</div>
					<!-- Textarea For Tinymce -->
	                <div class="row">
	                	<div class="col-md-12">
						    <div class="form-group">
						   		<label>Contents</label>
						    	<form:textarea path="content" cssClass="form-control" rows="60" />
						   	</div>
						</div>
					</div>
					 
					<div class="row">
						<div class="col-lg-12">
							<div class="col-lg-3">
								<input type="button" class="btn btn-danger" id="savebutton" value="저장" />
							</div>
						</div>
					</div>
				
				</form:form>
	                
	                <div class="row">
	                	<div class="col-md-12">
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
                		<h4><label  class="col-md-10">상품 이미지</label></h4>
                		<form method="POST" enctype="multipart/form-data" action="/media/photoUpload" role="form" class="form-horizontal" id="form-img-upload">
                			 <div class="form-group">
                			 	<label class="col-md-3 control-label">이미지</label>
                			 	<div class="col-md-7">
                			 		<input type="file" name="file">
                			 		<span class="error-msg"></span>
                			 	</div>
					         </div>
					         <div class="form-group">
					         	<label class="col-md-3 control-label">설명</label>
					         	<div class="col-md-7">
					         		<input type="text" name="alt" class="form-control">
					         	</div>
					         </div>
					         <div class="form-group">
					         	<div class="col-md-offset-3 col-md-7">
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