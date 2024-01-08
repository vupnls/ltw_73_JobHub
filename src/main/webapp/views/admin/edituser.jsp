<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var="UserUrl" value="/quan-tri/nguoi-dung"/>
<c:url var="Login" value="/dang-nhap"/>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
</head>
<body>
<div class="content mt-3">
    <div class="animated fadeIn">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong class="card-title">Chỉnh sửa người dùng</strong>
                    </div>
                    <c:if test="${not empty message}">
                        <div class="text-center float-left alert alert-${alert}">${message}</div>
                    </c:if>
                    <div class="card-body card-block">
                        <form id="formSubmit" enctype="multipart/form-data" class="form-horizontal">
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Tên tài khoản</label></div>
                                <div class="col-12 col-md-9"><input type="text"
                                                                    name="username" class="form-control" value="${user.username}"></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Mật khẩu</label></div>
                                <div class="col-12 col-md-9"><input type="password"
                                                                    name="password" class="form-control" value="${user.password}"></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Họ tên</label></div>
                                <div class="col-12 col-md-9"><input type="text"
                                                                    name="fullname" class="form-control" value="${user.fullname}"></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Hình đại diện</label></div>
                                <div class="col-12 col-md-1">
                                    <img src="<c:url value='${user.avatar}'/>" class=" rounded-circle  mb-1" style="width:50px; height:50px;">

                                </div>
                                <div class="col-12 col-md-8">
                                    <input type="file"
                                           id="avatar" name="avatar"
                                           accept="image/png, image/jpeg" value="${user.avatar}">
<%--                                    <div class="custom-input-file">--%>
<%--                                    <label class="uploadPhoto">--%>
<%--                                        Chọn--%>
<%--                                        <input type="file" class="change-avatar" name="avatar" id="avatar">--%>
<%--                                    </label>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Email</label></div>
                                <div class="col-12 col-md-9"><input type="email"
                                                                    name="email" class="form-control" value="${user.email}"></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label
                                                                 class=" form-control-label">Số điện thoại</label></div>
                                <div class="col-12 col-md-9"><input type="tel" class="form-control" id="phone" pattern="[0]{1}[0-9]{9}"
                                                                    name="phone" required
                                                                    oninvalid="this.setCustomValidity('Hãy nhập số điện thoại!')"
                                                                    oninput="this.setCustomValidity('')" value="${user.phone}"></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Vai trò</label></div>
                                <div class="col-12 col-md-9">
                                    <select name="roleId" class="form-control">
                                        <c:forEach var="item" items="${roles}">
                                            <c:if test="${item.id == user.roleId}">
                                                <option value="${item.id}" selected>${item.name}</option>
                                            </c:if>
                                            <c:if test="${item.id != user.roleId}">
                                                <option value="${item.id}">${item.name}</option>
                                            </c:if>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Trạng thái
                                </label></div>
                                <div class="col-12 col-md-9">
                                    <select name="status" class="form-control">
                                        <c:if test="${user.status == 1}">
                                            <option value="1" selected>Hoạt động</option>
                                            <option value="0">Tạm ngưng</option>
                                        </c:if>
                                        <c:if test="${user.status == 0}">
                                            <option value="1">Hoạt động</option>
                                            <option value="0" selected>Tạm ngưng</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <button id="updateUser" type="submit" class="btn btn-primary">
                                    <i class="fa fa-dot-circle-o"></i> Lưu
                                </button>
                            </div>
                            <input type="hidden" value="${user.id}" id="id" name="id" />
                        </form>
                    </div>


                </div>
            </div>
        </div>
    </div><!-- .animated -->
</div><!-- .content -->
<script>
    $('#updateUser').click(function (e) {
        e.preventDefault();
        let data = {}; // mang object name: value
        let formData = $('#formSubmit').serializeArray();
        $.each(formData, function(i,v) {
            data[''+v.name] = v.value
        });
        data['uploadFile'] = {}
        var files = $('#avatar')[0].files[0];
        if(files != undefined) {
            var reader = new FileReader();
            reader.onload = function (e) {
                data['uploadFile']['base64'] = e.target.result;
                data['uploadFile']['name'] = files.name;
                updateUser(data);
            };
            reader.readAsDataURL(files);
        } else
            updateUser(data);
    })

    function updateUser(data) {
        $('.load').show();
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                $('.load').hide();
                if (result === ""){
                    window.location.href = "${UserUrl}?id=${user.id}&message=update_status_fail&alert=danger";
                }else if (result ==="overlappass"){
                    window.location.href = "${UserUrl}?id=${user.id}&message=update_overlap_pass&alert=danger";
                } else if (result ==="updatepass"){
                    window.location.href = "${Login}?message=update_information_password_success&alert=success";
                } else if(result !== null)
                    window.location.href = "${UserUrl}?id=${user.id}&message=update_success&alert=success";
                else
                    window.location.href = "${UserUrl}?id=${user.id}&message=username_email_exist&alert=danger";
            },
            error: function (error) {
                $('.load').hide();
                window.location.href = "${UserUrl}?message=system_error&alert=danger";
            }
        })
    }
</script>
</body>
</html>
