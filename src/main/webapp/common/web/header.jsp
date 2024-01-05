<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
    <li class="text-center border-right text-white">
        <a href="<c:url value='/dang-nhap'/>" class="text-white">
            <i class="fas fa-sign-in-alt mr-2"></i> Đăng nhập </a>
    </li>
</div>