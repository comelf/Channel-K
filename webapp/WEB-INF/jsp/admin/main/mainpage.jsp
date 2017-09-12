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
							<h1 class="page-header">MainPage</h1>
							<ol class="breadcrumb">MainPage</ol>
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
						<form:form modelAttribute="mpc" role="form" id="form" action="/admin/main/mainpage" method="post" >
							<div class="col-lg-12">
								<div class="image-block">
		                			<label>캡콘텐츠 메인 작품(연재중)</label>
		                			<c:choose>
		                				<c:when test="${not empty mpc.recently.image}">
		                					<img src="${mpc.recently.image.getUrlPathWithQuality(0)}" width="600" class="">
		                					<form:input path="recently.banner_image_id" type="text" cssClass="hidden img-id" value="${mpc.recently.image.id}"/>
		                				</c:when>
		                				<c:otherwise>
		                					<img src="" width="600" class="">
		                					<form:input path="recently.banner_image_id" type="text" cssClass="hidden img-id" />
		                				</c:otherwise>
		                			</c:choose>
		                			<form:errors path="recently.banner_image_id" cssClass="error-msg" />
		                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 변경" onclick="ADMIN.photoUpload(this)">
	                			</div>
							</div>
							<div class="col-md-5">
								<form:input path="recently.id" type="text" cssClass="form-control hidden" value="${recently.id}" />
								<form:input path="recently.link" type="text" cssClass="form-control" placeholder="Link" value="${recently.link}" />
							</div>
							<div class="col-md-5">
								<form:input path="recently.caption" type="text" cssClass="form-control" placeholder="Caption" value="${recently.caption}"/>
							</div>
							
							<c:forEach var="come" items="${mpc.coming}" varStatus="status">
								<div class="col-lg-12">
									<div class="image-block">
			                			<label>출시예정 작품 ${status.index + 1} </label>
			                			<c:choose>
			                				<c:when test="${not empty come.image}">
			                					<img src="${come.image.getUrlPathWithQuality(0)}" width="600" class="">
			                					<form:input path="coming[${status.index}].banner_image_id" type="text" cssClass="hidden img-id" value="${come.image.id}"/>
			                				</c:when>
			                				<c:otherwise>
			                					<img src="" width="600" class="">
			                					<form:input path="coming[${status.index}].banner_image_id" type="text" cssClass="hidden img-id" />
			                				</c:otherwise>
			                			</c:choose>
			                			<form:errors path="coming[${status.index}].banner_image_id" cssClass="error-msg" />
			                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 변경" onclick="ADMIN.photoUpload(this)">
		                			</div>
								</div>
								<div class="col-md-5">
									<form:input path="coming[${status.index}].id" type="text" cssClass="form-control hidden" value="${come.id}" />
									<form:input path="coming[${status.index}].link" type="text" cssClass="form-control" placeholder="Link" value="${come.link}" />
								</div>
								<div class="col-md-5">
									<form:input path="coming[${status.index}].caption" type="text" cssClass="form-control" placeholder="Caption" value="${come.caption}"/>
								</div>
							</c:forEach>
							
							
							<c:forEach var="reco" items="${mpc.recomend}" varStatus="status">
								<div class="col-lg-12">
									<div class="image-block">
			                			<label>추천 작품 ${status.index + 1}  </label>
			                			<c:choose>
			                				<c:when test="${not empty reco.image}">
			                					<img src="${reco.image.getUrlPathWithQuality(0)}" width="600" class="">
			                					<form:input path="recomend[${status.index}].banner_image_id" type="text" cssClass="hidden img-id" value="${reco.image.id}"/>
			                				</c:when>
			                				<c:otherwise>
			                					<img src="" width="600" class="">
			                					<form:input path="recomend[${status.index}].banner_image_id" type="text" cssClass="hidden img-id" />
			                				</c:otherwise>
			                			</c:choose>
			                			<form:errors path="recomend[${status.index}].banner_image_id" cssClass="error-msg" />
			                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 변경" onclick="ADMIN.photoUpload(this)">
		                			</div>
								</div>
								<div class="col-md-5">
									<form:input path="recomend[${status.index}].id" type="text" cssClass="form-control hidden" value="${reco.id}" />
									<form:input path="recomend[${status.index}].link" type="text" cssClass="form-control" placeholder="Link" value="${reco.link}" />
								</div>
								<div class="col-md-5">
									<form:input path="recomend[${status.index}].caption" type="text" cssClass="form-control" placeholder="Caption" value="${reco.caption}"/>
								</div>
							</c:forEach>
							<div class="col-md-12">
							<input type="submit" class="btn btn-danger" id="savebutton" value="저장" />
						</div>
						</form:form>
					</div>
					
					<div class="row">
		            	<div class="col-lg-12">
		                	<div class="block-200"></div>
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