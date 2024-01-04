<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li>
                        <a href="<c:url value='/trang-chu'/>">Trang chủ</a>
                        <i>|</i>
                    </li>
                    <li>Đăng Nhập</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- page -->
    <!--login-->
    <div class="container">
        <div class="row justify-content-center">
            <div class="modal-body col-sm-6">
                <c:if test="${not empty message}">
                    <div class="text-center alert alert-${alert}">${message}</div>
                </c:if>
                <form action="dang-nhap" method="post">
                    <div class="form-group">
                        <label for="username" class="col-form-label">Tên đăng nhập / Email</label>
                        <input type="text" class="form-control" id="username" name="username" required=""
                               oninvalid="this.setCustomValidity('Hãy nhập tên đăng nhập!')"
                               oninput="this.setCustomValidity('')" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password"
                               required="" oninvalid="this.setCustomValidity('Hãy nhập mật khẩu của bạn!')"
                               oninput="this.setCustomValidity('')">
                    </div>
                    <div class="sub-w3l">
                        <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing2">
                            <label class="custom-control-label" for="customControlAutosizing2" style="font-size: 13px;">
                                Ghi nhớ</label>
                        </div>
                    </div>
                    <div class="sub-w3l">
                        <p class="text-left dont-do mt-3">
                            <a href="/quen-mat-khau">
                                Bạn quên mật khẩu?</a>
                        </p>

                    </div>
                    <div class="right-w3l">
                        <input type="submit" class="form-control" value="Đăng nhập">
                    </div>
                    <p class="text-center dont-do mt-3">Bạn chưa có tài khoản?
                        <a href="<c:url value='#'/>">
                            Đăng ký ngay</a>
                    </p>
                </form>
            </div>
        </div>

    </div>
    <!--login-->
</body>
</html>
