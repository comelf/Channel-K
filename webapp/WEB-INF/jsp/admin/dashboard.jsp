<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<body>


        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>Statistics Overview</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <%-- Event Log --%>
                <%--<div class="row">--%>
                    <%--<div class="col-lg-12">--%>
                        <%--<div class="alert alert-info alert-dismissable">--%>
                            <%--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>--%>
                            <%--<i class="fa fa-info-circle"></i>  <strong>Like SB Admin?</strong> Try out <a href="http://startbootstrap.com/template-overviews/sb-admin-2" class="alert-link">SB Admin 2</a> for additional features!--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<!-- /.row -->--%>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>최신 Cap Content</h3>
                            </div>
                            <div class="panel-body">
                                <div id="meesig-area-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i>최신 댓글</h3>
                            </div>
                            <div class="panel-body">
                                <div class="list-group">
                                	<%-- <c:forEach items="${socialData }" var="sitem">
                                		<c:if test="${sitem.ctype == 'qna' }"><a href="/social/qnaList" class="list-group-item"></c:if>
                                        <c:if test="${sitem.ctype == 'review' }"><a href="/social/reviewList" class="list-group-item"></c:if>
                                        <span class="badge">${sitem.diffDate}</span>
                                        <i class="fa fa-fw fa-calendar"></i>${sitem.limitContent}</a>	
                                    </c:forEach> --%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>...</h3>
                            </div>
                            <div class="panel-body">
					
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->



<content tag="local_script">
<!-- 	
	<script src="/js/plugins/morris/raphael.min.js"></script>
	<script src="/js/plugins/morris/morris.min.js"></script>
	<script type="text/javascript">

 	</script>
 -->
</content>



</body>
</html>