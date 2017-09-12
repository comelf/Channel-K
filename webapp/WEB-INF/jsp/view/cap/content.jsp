<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<div class="container deco-body">
	<div class="cap-content">
		<div class="row">
			<div class="col-md-7 cap-banner">
				<img src="/img/sample/cap/qbxldlstkdlem.jpg" width="100%">
			</div>
			<div class="col-md-5 cap-info">
				<div class="row">
					<div class="col-md-12 info-title"><strong>뷰티인사이드</strong><span>(The beauty inside 2015)</span></div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head info-bt info-br">드라마</div>
					<div class="col-md-3 info-bt info-br">총 16부작</div>
					<div class="col-md-6 info-bt">2015.08.20 개봉작</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head info-bt">제작</div>
					<div class="col-md-9 info-bt">2015 용필름</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">출연배우</div>
					<div class="col-md-9">한효우(홍이수 역) /박서준(우진12 역)</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">감독</div>
					<div class="col-md-9">백종열</div>
				</div>
				<div class="row">
					<div class="col-md-3 info-head">줄거리</div>
					<div class="col-md-9" style="line-height: 2.1;">남자, 여자, 아이, 노인. 심지어 외국인까지! 자고 일어나면 매일 다른모습으로 변하는 남자 '우진'. 그에게 처음으로 비밀을 말하고 싶은 단 한사람이 생겼다. 드디어 D-DAY! '우진'은 그녀에게 자신의 마음을 고백하기로 하는데...</div>
				</div>
			</div>
		</div>
		
		
		<div class="row cap-list">
			<div class="row">
				<div class="col-md-7">
				<% for(int i =0; i < 3; i++){
					out.println("<hr>");
					out.println("<div class='row'><div class='col-md-2  col-xs-2'><div class='thumbnail'><img src='/img/sample/cap/skqlgyrhk.jpg' alt='...'></div></div><div class='col-md-10  col-xs-10'><div><strong>Title</strong></div><div>detail</div><div>16.01.01</div></div></div>");	
				}
				%>
				<hr>
				</div>
				<div class="col-md-5">
					<div>
						<div>인기 게시글</div>
						<div class="row">
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
							      <img src="..." alt="...">
							      <div class="caption">
							        <p>blabla</p>
							      </div>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
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