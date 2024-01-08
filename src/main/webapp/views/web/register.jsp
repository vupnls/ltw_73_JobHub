<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <c:url var="APIurl" value="/api-web-user"/>
<c:url var="HomeURL" value="/trang-chu"/>
<c:url var="RegisterURL" value="/dang-ky"/>
<html>
<head>
    <title>Đăng ký</title>
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
                    <li>Đăng Ký</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
    <!--register-->
    <div class="container">
        <div class="row justify-content-center">
            <div class="modal-body col-sm-6">
                <form id="formSubmit">
                    <c:if test="${not empty message}">
                        <div class="text-center alert alert-${alert}">${message}</div>
                    </c:if>
                    <div class="form-group">
                        <label for="fullname" class="col-form-label">Họ tên</label>
                        <input type="text" class="form-control" id="fullname" name="fullname"
                               required oninvalid="this.setCustomValidity('Hãy nhập họ tên của bạn (ít nhất 2 ký tự)')"
                               oninput="this.setCustomValidity('')" minlength="2" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required=""
                               oninvalid="this.setCustomValidity('Hãy nhập email của bạn!')"
                               oninput="this.setCustomValidity('')">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="phone" pattern="(\+84|0)\d{9,10}"
                               name="phone" required oninvalid="this.setCustomValidity('Hãy nhập số điện thoại (10 - 11 chữ , bắt đầu từ 0 hoặc 84)!')"
                               oninput="this.setCustomValidity('')">
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" name="username"
                               required
                               oninvalid="this.setCustomValidity('Hãy nhập tên đăng nhập của bạn (ít nhất 4 ký tự)')"
                               oninput="this.setCustomValidity('')" minlength="4" >
                    </div>
                    <div class="form-group">
                        <label for="password1" class="col-form-label">Mật khẩu</label>
                        <input type="password" class="form-control" name="password" id="password1"
                               required oninvalid="this.setCustomValidity('Mật khẩu từ 6 ký tự!')"
                               oninput="this.setCustomValidity('')" minlength="6">
                    </div>
                    <div class="form-group">
                        <label for="password2" class="col-form-label">Nhập lại mật khẩu</label>
                        <input type="password" class="form-control"
                               id="password2" required oninvalid="this.setCustomValidity('Mật khẩu không khớp!')"
                               oninput="this.setCustomValidity('')" minlength="6">
                    </div>
                    <div class="sub-w3l">
                        <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing2" required oninvalid="this.setCustomValidity('Hãy đọc kĩ và chấp nhận các điều khoản sử dụng của chúng tôi.')"
                                   oninput="this.setCustomValidity('')">
                            <label class="custom-control-label" for="customControlAutosizing2">
                                Tôi chấp nhận các <a href="<c:url value='/dieu-khoan-su-dung'/>" target="_blank">điều khoản & điều
                                kiện</a></label>
                        </div>
                    </div>
                    <div class="right-w3l">
                        <button id="registerBtn" type="submit" class="form-control">Đăng ký</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <!--register-->
    <!-- password-script -->
    <script>
        window.onload = function () {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
        }
    </script>
    <script>
        $('#registerBtn').click(function (e) {
            if($('#formSubmit')[0].checkValidity()) {
                e.preventDefault();
                let data = {};
                let formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data['' + v.name] = v.value
                });
                register(data);
            }
        })

        function register(data) {
            $('.load').show();
            $.ajax({
                url: '${APIurl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    $('.load').hide();
                    if(result !== null)
                        window.location.href = "${HomeURL}";
                    else
                        window.location.href = "${RegisterURL}?message=username_email_exist&alert=danger";
                },
                error: function (error) {
                    $('.load').hide();
                    window.location.href = "${RegisterURL}?message=system_error&alert=danger";
                }
            })
        }
    </script>
</body>
</html>
