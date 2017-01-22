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
		            
					<form:form modelAttribute="topForm" role="form" id="form" action="/admin/main/topbanner/edit" method="post" >
					<div class="row">
						<div class="col-lg-12">
	               				<div class="form-group">
									<label>Title</label>
									<form:input path="name" type="text" cssClass="form-control" placeholder="Title"/>
								    <form:errors path="name" cssClass="error-msg" />
		                		</div>
		                		<div class="form-group">
									<label>Title</label>
									<form:input path="name" type="text" cssClass="form-control" placeholder="Title"/>
								    <form:errors path="name" cssClass="error-msg" />
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
		<!-- 		-->
		</content>
</body>

</html>