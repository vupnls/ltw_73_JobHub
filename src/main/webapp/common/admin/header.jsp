<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Header-->
<header id="header" class="header">

    <div class="header-menu">
        <div class="col-sm-12 float-right">
            <div class="user-area">
                <img class="user-avatar rounded-circle" src="<c:url value='${USERMODEL.avatar}'/>" alt="" style="width:32px; height:32px;">
                <span class="mr-3">Xin chào, ${USERMODEL.fullname}</span>
                <a href="<c:url value='/thoat?action=logout'/>"><i class="fa fa-power-off"></i> Thoát</a>
            </div>
        </div>
    </div>

</header><!-- /header -->
<!-- Header-->