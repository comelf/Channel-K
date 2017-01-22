<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="broadcast-content">
		<div class="row">
			<div class="col-md-12">
					<div class="top-banner" style='background-Image: url(/img/sample/banner/ghstnfskasu.jpg)'></div>
			</div>
		</div>
		
		<div class="today-broadcast">
			<div class="row section-head">
				<div class="col-md-12">
					<div>오늘의 방송 (수/목)</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-xs-2">
					<div class="size1 program-table" style="background-color:rgb(2,3,80);color:#fff;padding:10px;">
						<div>수목드라마</div><hr>
						<div>MBC <strong>W</strong></div>
						<div>KBS <strong>함부러 애뜻하게</strong></div>
						<div>SBS <strong>원티드</strong></div>
						</div>
				</div>
				<div class="col-md-4 col-xs-4">
					<div class="size2"><img src="/img/sample/today/ekfdmldudls.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-2">
					<div class="size1"><img src="/img/sample/today/dnflwlqdp.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/dlawlsdhofks.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-2">
					<div class="size1"><img src="/img/sample/today/tyvlddhkd.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/wlfxndmlghktls.jpg" width="100%" height="100%"></div>
				</div>
				<div class="col-md-2 col-xs-2">
					<div class="size1"><img src="/img/sample/today/mbcw.jpg" width="100%" height="100%"></div>
					<div class="size1"><img src="/img/sample/today/ghstnfskasu.jpg" width="100%" height="100%"></div>				
				</div>
			</div>
		</div>
		
		<div class="content-drama">
			<div class="row section-head">
				<div class="col-md-12">
					<div>드라마 컨텐츠</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<% for(int i =0; i < 8; i++){
					out.println("<div class='col-md-3  col-xs-6'><div class='thumbnail caption-grep'><img src='/img/sample/cap/skqlgyrhk.jpg' alt='...'><div class='caption'><p>blabla</p><p>blabla</p></div></div></div>");	
				}
				%>
				
				<!-- <div class="col-md-3">
					<div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <p>blabla</p>
				      </div>
				    </div>
				</div> -->
			</div>
		</div>
	</div>	


	<content tag="local_script">
	<!-- 
	<script type="text/javascript">
	$( document ).ready(function() {
		
    });
	</script>
	-->
	</content>
</body>
</html>