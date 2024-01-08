<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu"
                    aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="<c:url value='/quan-tri/trang-chu'/>"><img src="<c:url value='/images/logo.png'/>"></a>
            <a class="navbar-brand hidden" href="<c:url value='/quan-tri/trang-chu'/>"><img src="<c:url value='/images/logo.png'/>"></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">

                    <li class="mb-3">
                        <a href="<c:url value='/quan-tri/nguoi-dung'/>">Quản lý người dùng</a>
                    </li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->
