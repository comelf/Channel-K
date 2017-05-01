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
                        <h1 class="page-header">Content Detail</h1>
                        <ol class="breadcrumb">
                            <li class="active">Content 정보</li>
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
                	
				<form:form modelAttribute="contentInfo" role="form" id="form" action="/admin/content/edit" method="post" >
	                <form:input path="id" type="text" cssClass="form-control hidden" value="${contentInfo.id }"/>
	                <div class="row">
	                	<div class="col-md-12">
	                		<div class="col-md-6">
		                		<div class="form-group">
		                			<label>Category</label>
		                			<form:select path="contentCategoryId" cssClass="form-control" >
		                				<c:forEach var="c" items="${contentCatetories}">
		                					<c:choose>
									            <c:when test="${c.id eq contentInfo.category.id}">
									                <option value="${c.id}" selected="selected">${c.text}</option>
									            </c:when>
									            <c:otherwise>
									                <option value="${c.id}">${c.text}</option>
									            </c:otherwise>
									        </c:choose> 
		                				</c:forEach>
								    </form:select>
		                		</div>
		                		<div class="form-group">
		                			<form:input path="contentTypeId" type="text" cssClass="form-control hidden" value="${contentInfo.type.id }"/>
		                		</div>
		                		<div class="form-group">
									<label>Title</label>
									<form:input path="title" type="text" cssClass="form-control" placeholder="Title"/>
								    <form:errors path="title" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
									<label>(Sub Title)</label>
									<form:input path="sub_title" type="text" cssClass="form-control" placeholder="sub title"/>
								    <form:errors path="sub_title" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
									<label>회차정보 (개봉일)</label>
									<form:input path="episode" type="text" cssClass="form-control currency-won" />
								    <form:errors path="episode" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
									<label>관람가</label>
									<form:input path="rating" type="text" cssClass="form-control" placeholder="15세 이상"/>
								    <form:errors path="rating" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
									<label>부작 (상영시간)</label>
									<form:input path="time" type="text" cssClass="form-control" placeholder="총 20부작 or 1시간 30분"/>
								    <form:errors path="time" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
		                			<label>캡컨텐트 여부</label>
									<form:select path="cap" cssClass="form-control">
											<c:choose>
									            <c:when test="${contentInfo.cap}">
									                <option value="0">캡 없음</option>
									                <option value="1" selected="selected">캡 있음</option>
									            </c:when>
									            <c:otherwise>
									                <option value="0" selected="selected">캡 없음</option>
									                <option value="1">캡 있음</option>
									            </c:otherwise>
									        </c:choose> 
								    </form:select>
		                		</div>
		                		<div class="form-group">
									<label>Status</label>
								    <form:select path="status_text" cssClass="form-control">
		                				<option value="0">선택하세요</option>
		                				<c:forEach var="status" items="${contentStatusList}">
		                					<option value="${status.text}" <c:if test="${status.text eq contentInfo.status.text}">selected="selected"</c:if>>${status.text}</option>
		                				</c:forEach>
								    </form:select>
		                		</div>
		                	</div>
		                	<div class="col-md-6 content-metas">
		                		<c:choose>
						            <c:when test="${contentInfo.type.id eq 1}">
						                <div class="form-group">
											<label>방송사</label>
											<input id="metas'broadcaster'.meta_key" name="metas['broadcaster'].meta_key" class="form-control hidden" type="text" value="broadcaster" readonly="readonly">
											<select id="metas'broadcaster'.meta_value" name="metas['broadcaster'].meta_value" class="form-control">
												
												<option value="KBS" <c:if test="${'KBS' eq contentInfo.metas['broadcaster'].meta_value}">selected="selected"</c:if>>KBS</option>
												<option value="MBC" <c:if test="${'MBC' eq contentInfo.metas['broadcaster'].meta_value}">selected="selected"</c:if>>MBC</option>
												<option value="SBS" <c:if test="${'SBS' eq contentInfo.metas['broadcaster'].meta_value}">selected="selected"</c:if>>SBS</option>
										    </select>
										</div>
										<div class="form-group">
											<label>요일</label>
											<input id="metas'tvtable_day'.meta_key" name="metas['tvtable_day'].meta_key" class="form-control hidden" type="text" value="tvtable_day" readonly="readonly">
											<select id="metas'tvtable_day'.meta_value" name="metas['tvtable_day'].meta_value" class="form-control">
												<option value="1" <c:if test="${'1' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>월</option>
												<option value="3" <c:if test="${'3' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>화</option>
												<option value="4" <c:if test="${'4' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>수</option>
												<option value="6" <c:if test="${'6' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>목</option>
												<option value="7" <c:if test="${'7' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>금</option>
												<option value="9" <c:if test="${'9' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>토</option>
												<option value="11" <c:if test="${'11' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>일</option>
												<option value="2" <c:if test="${'2' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>월/화</option>
												<option value="5" <c:if test="${'5' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>수/목</option>
												<option value="8" <c:if test="${'8' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>금/토</option>
												<option value="10" <c:if test="${'10' eq contentInfo.metas['tvtable_day'].meta_value}">selected="selected"</c:if>>토/일</option>
										    </select>
										</div>
										<div class="form-group">
											<label>시간</label>
											<input id="metas'tvtable_time'.meta_key" name="metas['tvtable_time'].meta_key" class="form-control hidden" type="text" value="tvtable_time" readonly="readonly">
											<input id="metas'tvtable_time'.meta_value" name="metas['tvtable_time'].meta_value" class="form-control" placeholder="오후 10:00" type="text" value="${contentInfo.metas['tvtable_time'].meta_value}">
										</div>
										<div class="form-group">
											<label>시청률</label>
											<input id="metas'audience'.meta_key" name="metas['audience'].meta_key" class="form-control hidden" type="text" value="audience" readonly="readonly">
											<input id="metas'audience'.meta_value" name="metas['audience'].meta_value" class="form-control" placeholder="10.1% (닐슨코리아 제공) 10.1% (TNMS 제공)" type="text" value="${contentInfo.metas['audience'].meta_value}">
										</div>
										<div class="form-group">
											<label>출연배우</label>
											<input id="metas'actors'.meta_key" name="metas['actors'].meta_key" class="form-control hidden" type="text" value="actors" readonly="readonly">
											<input id="metas'actors'.meta_value" name="metas['actors'].meta_value" class="form-control" placeholder="배우들" type="text" value="${contentInfo.metas['actors'].meta_value}">
										</div>
										<div class="form-group">
											<label>제작진</label>
											<input id="metas'creators'.meta_key" name="metas['creators'].meta_key" class="form-control hidden" type="text" value="creators" readonly="readonly">
											<input id="metas'creators'.meta_value" name="metas['creators'].meta_value" class="form-control" placeholder="제작진" type="text" value="${contentInfo.metas['creators'].meta_value}">
										</div>
										<div class="form-group">
											<label>줄거리</label>
											<input id="metas'summary'.meta_key" name="metas['summary'].meta_key" class="form-control hidden" type="text" value="summary" readonly="readonly">
											<textarea id="metas'summary'.meta_value" name="metas['summary'].meta_value" class="form-control" type="text" rows="5">${contentInfo.metas['summary'].meta_value}</textarea>
										</div>
						            </c:when>
						            <c:when test="${contentInfo.type.id eq 2}">
						                <div class="form-group">
											<label>제작</label>
											<input id="metas'creators'.meta_key" name="metas['creators'].meta_key" class="form-control hidden" type="text" value="creators" readonly="readonly">
											<input id="metas'creators'.meta_value" name="metas['creators'].meta_value" class="form-control" placeholder="영화사" type="text" value="${contentInfo.metas['creators'].meta_value}">
					               		</div>
					               		<div class="form-group">
											<label>배급</label>
											<input id="metas'distributor'.meta_key" name="metas['distributor'].meta_key" class="form-control hidden" type="text" value="distributor" readonly="readonly">
											<input id="metas'distributor'.meta_value" name="metas['distributor'].meta_value" class="form-control" placeholder="배급사" type="text" value="${contentInfo.metas['distributor'].meta_value}">
					               		</div>
					               		<div class="form-group">
											<label>출연배우</label>
											<input id="metas'actors'.meta_key" name="metas['actors'].meta_key" class="form-control hidden" type="text" value="actors" readonly="readonly">
											<input id="metas'actors'.meta_value" name="metas['actors'].meta_value" class="form-control" placeholder="출연배우" type="text" value="${contentInfo.metas['summary'].meta_value}">
					               		</div>
					               		<div class="form-group">
											<label>감독</label>
											<input id="metas'director'.meta_key" name="metas['director'].meta_key" class="form-control hidden" type="text" value="director" readonly="readonly">
											<input id="metas'director'.meta_value" name="metas['director'].meta_value" class="form-control" placeholder="감독" type="text" value="${contentInfo.metas['director'].meta_value}">
					               		</div>
					               		<div class="form-group">
											<label>줄거리</label>
											<input id="metas'summary'.meta_key" name="metas['summary'].meta_key" class="form-control hidden" type="text" value="summary" readonly="readonly">
											<textarea id="metas'summary'.meta_value" name="metas['summary'].meta_value" class="form-control" type="text" rows="5">${contentInfo.metas['summary'].meta_value}</textarea>
					               		</div>
						            </c:when>
						        </c:choose> 
						    </div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
                			<div class="image-block">
	                			<label>썸네일 (필수)</label>
	                			<img src="<c:if test="${not empty contentInfo.thumbnail}">${contentInfo.thumbnail.getUrlPathWithQuality(0) }</c:if>" width="400" class="">
	                			<form:input path="thumbnail_image_id" type="text" cssClass="hidden img-id" />
	                			<form:errors path="thumbnail_image_id" cssClass="error-msg" />
	                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 업로드" onclick="ADMIN.photoUpload(this)">
                			</div>
                		</div>
	                	<div class="col-md-12">
                			<div class="image-block">
	                			<label>상단 배너 (옵션)</label>
	                			<img src="<c:if test="${not empty contentInfo.banner}">${contentInfo.banner.getUrlPathWithQuality(0) }</c:if>"  width="600" class="">
	                			<form:input path="banner_id" type="text" cssClass="hidden img-id" />
	                			<form:errors path="banner_id" cssClass="error-msg" />
	                			<input type="button" class="btn btn-primary" id="add-image" value="이미지 업로드" onclick="ADMIN.photoUpload(this)">
                			</div>
                		</div>
					</div>
					
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-3">
									<input type="submit" class="btn btn-danger" id="savebutton" value="저장" />
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
		<script src="/js/admin.js"></script>
		
		<script id="drama-meta-template" type="text/x-handlebars-template">
				<div class="form-group">
					<label>방송사</label>
					<input id="metas'broadcaster'.meta_key" name="metas['broadcaster'].meta_key" class="form-control hidden" type="text" value="broadcaster" readonly="readonly">
					<select id="metas'broadcaster'.meta_value" name="metas['broadcaster'].meta_value" class="form-control">
						<option value="KBS">KBS</option>
						<option value="MBC">MBC</option>
						<option value="SBS">SBS</option>
				    </select>
				</div>
				<div class="form-group">
					<label>요일</label>
					<input id="metas'tvtable_day'.meta_key" name="metas['tvtable_day'].meta_key" class="form-control hidden" type="text" value="tvtable_day" readonly="readonly">
					<select id="metas'tvtable_day'.meta_value" name="metas['tvtable_day'].meta_value" class="form-control">
						<option value="1">월</option>
						<option value="3">화</option>
						<option value="4">수</option>
						<option value="6">목</option>
						<option value="7">금</option>
						<option value="9">토</option>
						<option value="11">일</option>
						<option value="2">월/화</option>
						<option value="5">수/목</option>
						<option value="8">금/토</option>
						<option value="10">토/일</option>
				    </select>
				</div>
				<div class="form-group">
					<label>시간</label>
					<input id="metas'tvtable_time'.meta_key" name="metas['tvtable_time'].meta_key" class="form-control hidden" type="text" value="tvtable_time" readonly="readonly">
					<input id="metas'tvtable_time'.meta_value" name="metas['tvtable_time'].meta_value" class="form-control" placeholder="오후 10:00" type="text" value="">
				</div>
				<div class="form-group">
					<label>시청률</label>
					<input id="metas'audience'.meta_key" name="metas['audience'].meta_key" class="form-control hidden" type="text" value="audience" readonly="readonly">
					<input id="metas'audience'.meta_value" name="metas['audience'].meta_value" class="form-control" placeholder="10.1% (닐슨코리아 제공) 10.1% (TNMS 제공)" type="text" value="">
				</div>
				<div class="form-group">
					<label>출연배우</label>
					<input id="metas'actors'.meta_key" name="metas['actors'].meta_key" class="form-control hidden" type="text" value="actors" readonly="readonly">
					<input id="metas'actors'.meta_value" name="metas['actors'].meta_value" class="form-control" placeholder="배우들" type="text" value="">
				</div>
				<div class="form-group">
					<label>제작진</label>
					<input id="metas'creators'.meta_key" name="metas['creators'].meta_key" class="form-control hidden" type="text" value="creators" readonly="readonly">
					<input id="metas'creators'.meta_value" name="metas['creators'].meta_value" class="form-control" placeholder="제작진" type="text" value="">
				</div>
				<div class="form-group">
					<label>줄거리</label>
					<input id="metas'summary'.meta_key" name="metas['summary'].meta_key" class="form-control hidden" type="text" value="summary" readonly="readonly">
					<textarea id="metas'summary'.meta_value" name="metas['summary'].meta_value" class="form-control" type="text" rows="5"></textarea>
				</div>
		</script>
		
		<script id="movie-meta-template" type="text/x-handlebars-template">
				<div class="form-group">
						<label>제작</label>
						<input id="metas'creators'.meta_key" name="metas['creators'].meta_key" class="form-control hidden" type="text" value="creators" readonly="readonly">
						<input id="metas'creators'.meta_value" name="metas['creators'].meta_value" class="form-control" placeholder="영화사" type="text" value="">
               		</div>
               		<div class="form-group">
						<label>배급</label>
						<input id="metas'distributor'.meta_key" name="metas['distributor'].meta_key" class="form-control hidden" type="text" value="distributor" readonly="readonly">
						<input id="metas'distributor'.meta_value" name="metas['distributor'].meta_value" class="form-control" placeholder="배급사" type="text" value="">
               		</div>
               		<div class="form-group">
						<label>출연배우</label>
						<input id="metas'actors'.meta_key" name="metas['actors'].meta_key" class="form-control hidden" type="text" value="actors" readonly="readonly">
						<input id="metas'actors'.meta_value" name="metas['actors'].meta_value" class="form-control" placeholder="출연배우" type="text" value="">
               		</div>
               		<div class="form-group">
						<label>감독</label>
						<input id="metas'director'.meta_key" name="metas['director'].meta_key" class="form-control hidden" type="text" value="director" readonly="readonly">
						<input id="metas'director'.meta_value" name="metas['director'].meta_value" class="form-control" placeholder="감독" type="text" value="">
               		</div>
               		<div class="form-group">
						<label>줄거리</label>
						<input id="metas'summary'.meta_key" name="metas['summary'].meta_key" class="form-control hidden" type="text" value="summary" readonly="readonly">
						<textarea id="metas'summary'.meta_value" name="metas['summary'].meta_value" class="form-control" type="text" rows="5"></textarea>
               		</div>
		</script>
		
		<script type="text/javascript">
				$( document ).ready(function() {
					ContentInfo.init();
			    });
		</script>
	-->
	</content>
</body>
</html>