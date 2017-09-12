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
							<h1 class="page-header">Top Banner</h1>
							<ol class="breadcrumb">Top Banner</ol>
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
		            
					
					<div class="row">
						<c:forEach var="banner" items="${ topList }">
							<form:form modelAttribute="topForm" role="form" id="form" action="/admin/main/topbanner/edit" method="post" >
								<div class="col-lg-12">
									<div class="image-block">
			                			<label>썸네일 (필수)</label>
			                			<img src="${banner.image.getUrlPathWithQuality(0)}" width="600" class="">
			                			<form:input path="banner_image_id" type="text" cssClass="hidden img-id" value="${banner.image.id}"/>
			                			<form:errors path="banner_image_id" cssClass="error-msg" />
			                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 변경" onclick="ADMIN.photoUpload(this)">
		                			</div>
								</div>
								<div class="col-md-5">
									<form:input path="id" type="text" cssClass="form-control hidden" value="${banner.id}" />
									<form:input path="link" type="text" cssClass="form-control" placeholder="Link" value="${banner.link}" />
								</div>
								<div class="col-md-5">
									<form:input path="caption" type="text" cssClass="form-control" placeholder="Caption" value="${banner.caption}"/>
								</div>
								<div class="col-md-1">
									<input type="submit" class="btn btn-primary" id="savebutton" value="편집" />
								</div>
							</form:form>
							<form:form modelAttribute="topForm" role="form" id="form" action="/admin/main/topbanner/delete/${banner.id}" method="delete" >
							<div class="col-md-1">
								<input type="submit" class="btn btn-danger" id="savebutton" value="삭제" />
							</div>
							</form:form>
						</c:forEach>
						
						</div>
					</div>
					
					<form:form modelAttribute="topForm" role="form" id="form" action="/admin/main/topbanner/add" method="post" >
					<div class="row">
						<div class="col-lg-12">
							<div class="image-block">
	                			<label>썸네일 (필수)</label>
	                			<img src="" width="600" class="">
	                			<form:input path="banner_image_id" type="text" cssClass="hidden img-id" />
	                			<form:errors path="banner_image_id" cssClass="error-msg" />
	                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 업로드" onclick="ADMIN.photoUpload(this)">
                			</div>
						</div>
						<div class="col-lg-5">
							<form:input path="link" type="text" cssClass="form-control" placeholder="Link"/>
						</div>
						<div class="col-lg-5">
							<form:input path="caption" type="text" cssClass="form-control" placeholder="Caption"/>
						</div>
						<div class="col-md-2">
							<input type="submit" class="btn btn-danger" id="savebutton" value="저장" />
						</div>
					</div>
					</form:form>
					
					<div class="row">
		            	<div class="col-lg-12">
		                	<div class="block-200"></div>
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
                		<h4><label  class="col-md-10">작품 이미지</label></h4>
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
			<script src="/js/admin.js"></script>
			<script type="text/javascript">
				$( document ).ready(function() {
			    });
		</script>
			-->
		</content>
</body>

</html>