<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="cap-content">
		<div class="row">
				<div class="col-md-12" style="border-top: solid 1px #999; border-bottom: solid 1px #999; padding: 20px 20px;">
					${capContent.title}
				</div>
				
				<div class="col-md-12" style="padding: 20px 20%;">
					${capContent.content}
				</div>
				<div class="col-md-12" style="border-top: solid 2px #999; border-bottom: solid 1px #999; padding: 20px 20px;">
					<div class="pull-right"><a href="/cap/content?id=${capContent.info.id}">목록 보기</a></div>
				</div>
		</div>
	</div>	
<!-- 	
	
	
	<img alt="" src="/img/sample/main/gkdlzlr.jpg">
	 -->
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