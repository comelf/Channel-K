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
                        <h1 class="page-header">회원수정</h1>
                        <ol class="breadcrumb">
                            <li class="active">회원 정보를 수정합니다.</li>
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
					<c:if test="${not empty editUser}">
	                	<form:form modelAttribute="editUser" role="form" action="/admin/user/update" method="post">
	                		<form:input path="id" type="text" cssClass="form-control hidden" readonly="true"/>
	                		<div class="col-lg-5">
								<div class="form-group">
								    <label>ID</label>
								    <form:input path="user_login_id" type="text" cssClass="form-control" readonly="true"/>
								    <form:errors path="user_login_id" cssClass="error-msg" />
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
								    <label for="user_role">권한</label>
								    <form:select path="user_role" cssClass="form-control">
								    	<form:option value="ROLE_USERS">USER</form:option>
								    	<form:option value="ROLE_ADMIN">ADMIN</form:option>
								    </form:select>
								  </div>
								  <div class="form-group">
								    <label for="user_status">상태</label>
								    <form:select path="user_status" cssClass="form-control">
								    	<form:option value="0">CLOSE</form:option>
								    	<form:option value="1">OPEN</form:option>
								    </form:select>
								  </div>
								  
							  
							</div>
							<div class="col-lg-10 text-center">
								<button type="submit" class="btn btn-danger">정보 수정</button>
							</div>
						</form:form>
						
					</c:if>
                </div>
                
                <div class="row">
					<c:if test="${not empty editUser}">
	                	<form:form modelAttribute="editUser" role="form" action="/admin/user/updatePassword" method="post">
	                		<form:input path="id" type="text" cssClass="form-control hidden" readonly="true"/>
	                		<div class="col-lg-5">
								<div class="form-group">
								    <form:input path="user_login_id" type="text" cssClass="form-control  hidden" readonly="true"/>
								    <form:errors path="user_login_id" cssClass="error-msg" />
								</div>
								<div class="form-group">
								    <form:input path="user_name" type="text" cssClass="form-control hidden" placeholder="User Name" />
								    <form:errors path="user_name" cssClass="error-msg" />
								</div>
								<div class="form-group">
								    <form:input path="user_email" type="email" cssClass="form-control  hidden" placeholder="E-mail" />
								    <form:errors path="user_email" cssClass="error-msg" />
								</div>
							</div>
							<div class="col-lg-5">
								  <div class="form-group">
								    <form:select path="user_role" cssClass="form-control  hidden">
								    	<form:option value="ROLE_USERS">USER</form:option>
								    	<form:option value="ROLE_ADMIN">ADMIN</form:option>
								    </form:select>
								  </div>
								  <div class="form-group">
								    <form:select path="user_status" cssClass="form-control  hidden">
								    	<form:option value="0">CLOSE</form:option>
								    	<form:option value="1">OPEN</form:option>
								    </form:select>
								  </div>
								  	<div class="form-group">
								    <label for="user_password">Password</label>
								    <form:input path="user_password" type="password" cssClass="form-control" placeholder="Password" />
								    <form:errors path="user_password" cssClass="error-msg" />
								</div>
								<div class="form-group">
								    <label for="user_password">Confirm Password </label>
								    <form:input path="user_password_match" type="password" cssClass="form-control" placeholder="Confirm Password" />
								    <form:errors path="user_password_match" cssClass="error-msg" />
								</div>
							  
							</div>
							<div class="col-lg-10 text-center">
								<button type="submit" class="btn btn-danger">비밀번호 변경</button>
							</div>
						</form:form>
						
					
						
					</c:if>
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