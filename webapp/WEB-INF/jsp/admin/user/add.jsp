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
                        <h1 class="page-header">회원추가</h1>
                        <ol class="breadcrumb">
                            <li class="active">새로운 회원을 추가합니다.</li>
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
                	<form:form modelAttribute="createUser" role="form" action="/admin/user/create" method="post">
                		<div class="col-lg-5">
							<div class="form-group">
							    <label>ID</label>
							    <form:input path="user_login_id" type="text" cssClass="form-control" placeholder="User ID"/>
							    <form:errors path="user_login_id" cssClass="error-msg" />
							</div>
							<div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <form:input path="user_password" type="password" cssClass="form-control" placeholder="Password" />
							    <form:errors path="user_password" cssClass="error-msg" />
							</div>
							<div class="form-group">
							    <label>Name</label>
							    <form:input path="user_name" type="text" cssClass="form-control" placeholder="User Name" />
							    <form:errors path="user_name" cssClass="error-msg" />
							</div>
							<div class="form-group">
							    <label>Email address</label>
							    <form:input path="user_email" type="email" cssClass="form-control" placeholder="E-mail" />
							    <form:errors path="user_email" cssClass="error-msg" />
							</div>
						</div>
						<div class="col-lg-5">
							  <div class="form-group">
							    <label for="exampleInputPassword1">권한</label>
							    <form:select path="user_role" cssClass="form-control">
							    	<form:option value="ROLE_USERS">USER</form:option>
							    	<form:option value="ROLE_ADMIN">ADMIN</form:option>
							    </form:select>
							  </div>
						  	<button type="submit" class="btn btn-danger">Save</button>
						</div>
					</form:form>
                </div>

                <div class="row">
                	<div class="col-lg-12">
                		<div class="block-400">
                		</div>
                	</div>
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