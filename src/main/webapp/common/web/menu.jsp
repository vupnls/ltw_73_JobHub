<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

    <header id="header" id="home">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                    <a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-active"><a href="index.html">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="category.html">Category</a></li>
                        <li><a href="price.html">Price</a></li>
                        <li><a href="blog-home.html">Blog</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li class="menu-has-children"><a href="">Pages</a>
                            <ul>
                                <li><a href="elements.html">elements</a></li>
                                <li><a href="search.html">search</a></li>
                                <li><a href="single.html">single</a></li>
                            </ul>
                        </li>
                        <c:if test="${empty USERMODEL}">
                            <li><a class="ticker-btn" href="<c:url value='/dang-ky'/>">Signup</a></li>
                            <li><a class="ticker-btn" href="<c:url value='/dang-nhap'/>">Login</a></li>
                        </c:if>

                        <c:if test="${not empty USERMODEL}">
                            <li class="menu-has-children user-menu">
                                <a href="#" data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false" class="avatar">
                                    <img class="user-avatar rounded-circle" src="<c:url value='${USERMODEL.avatar}'/>">
                                </a>
                                <span class="mr-3 text-black"> ${USERMODEL.fullname}</span>
                                <ul>
                                    <li><a class="nav-link text-dark" href="<c:url value='/chinh-sua-thong-tin'/>"><i
                                            class="fa fa-user"></i> Thông tin cá nhân</a></li>
                                    <li><a class="nav-link text-dark" href="<c:url value="/doi-mat-khau"/>"><i
                                            class="fa fa-key" aria-hidden="true"></i>
                                        Đổi
                                        mật khẩu</a></li>
                                    <li><a class="nav-link text-dark" href="<c:url value='/thoat?action=logout'/>"><i
                                            class="fa fa-power-off"></i> Thoát</a></li>
                                </ul>
                            </li>

                        </c:if>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header><!-- #header -->
