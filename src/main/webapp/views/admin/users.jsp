<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var="UserUrl" value="/quan-tri/nguoi-dung"/>
<html>
<head>
    <title>Quản lý người dùng </title>
</head>
<body>
<div class="content mt-3">
    <div class="animated fadeIn">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong class="card-title">Danh sách người dùng</strong>
                    </div>
                    <div class="card-header">
                        <c:if test="${not empty message}">
                            <div class="text-center float-left alert alert-${alert}">${message}</div>
                        </c:if>
                        <div class="float-right">
                            <a href="#addUserModal" class="btn btn-success" data-toggle="modal"><i
                                    class="fa fa-plus-circle" aria-hidden="true"></i> <span>Thêm</span></a>
                            <a href="#deleteUserModal" class="btn btn-danger" data-toggle="modal"><i
                                    class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center">
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                </th>
                                <th class="text-center">Tên tài khoản</th>
<%--                                <th class="text-center">Mật khẩu</th>--%>
                                <th class="text-center">Hình đại diện</th>
                                <th class="text-center">Họ tên</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Số điện thoại</th>
                                <th class="text-center">Vai trò</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${users}">
                                <tr>
                                    <td class="text-center">
                                                 <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                    </td>
                                    <td>${item.username}</td>
<%--                                    <td>${item.password}</td>--%>
                                    <td class="text-center"><img src="<c:url value='${item.avatar}'/> " class="rounded-circle td-img"
                                                                 alt="Not found" style="width:45px; height:45px;"></td>
                                    <td>${item.fullname}</td>
                                    <td>${item.email}</td>
                                    <td class="text-center">${item.phone}</td>

                                    <td>${item.role.name}</td>

                                    <c:if test="${item.status == 1}">
                                        <td class="text-center"><span class="status text-success">&bull;</span>Hoạt động
                                        </td>
                                    </c:if>
                                    <c:if test="${item.status == 0}">
                                        <td class="text-center"><span class="status text-danger">&bull;</span>Tạm ngưng
                                        </td>
                                    </c:if>
                                    <td class="text-center">
                                        <a href="<c:url value='/quan-tri/nguoi-dung?id=${item.id}'/>" class="edit"><i class="fa fa-pencil"
                                                                                aria-hidden="true" data-toggle="tooltip"
                                                                                title="Chỉnh sửa"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- .animated -->
</div><!-- .content -->


<!-- Add Modal HTML -->
<div id="addUserModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="formSubmit">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm người dùng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên tài khoản</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <div class="form-group">
                        <label>Họ tên</label>
                        <input type="text" class="form-control" name="fullname" required>
                    </div>
                    <div class="row form-group">
                        <label for="avatar" class="col-sm-3 form-control-label">Hình
                            đại diện</label>
                        <div class="col-sm-3">
                            <input type="file"
                                   id="avatar" name="avatar"
                                   accept="image/png, image/jpeg">
<%--                            <div class="custom-input-file">--%>
<%--                                <label class="uploadPhoto">--%>
<%--                                    Chọn--%>
<%--                                    <input type="file" class="change-avatar" name="avatar" id="avatar">--%>
<%--                                </label>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="phone" pattern="[0]{1}[0-9]{9}" name="phone"
                               required oninvalid="this.setCustomValidity('Hãy nhập số điện thoại!')"
                               oninput="this.setCustomValidity('')">
                    </div>
                    <div class="form-group">
                        <label>Vai trò</label>
                        <select name="roleId" class="form-control">
                            <c:forEach var="item1" items="${roles}">
                                <option value="${item1.id}">${item1.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Trạng thái</label>
                        <select  name="status" class="form-control">
                            <option value="1">Hoạt động</option>
                            <option value="0">Tạm ngưng</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <button id="addUser" type="submit" class="btn btn-success" >Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteUserModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Xóa người dùng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Bạn chắc chắn muốn xóa những người dùng này?</p>
                    <p class="text-warning"><small>Hành động này sẽ không thể khôi phục lại.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <button id="deleteUser" type="submit" class="btn btn-danger" >Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('#addUser').click(function (e) {
        if($('#formSubmit')[0].checkValidity()) {
            e.preventDefault();
            let data = {}; // mang object name: value
            let formData = $('#formSubmit').serializeArray();
            // vong lap
            $.each(formData, function (i, v) {
                data['' + v.name] = v.value
            });
            data['uploadFile'] = {}
            var files = $('#avatar')[0].files[0];
            if(files != undefined) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    data['uploadFile']['base64'] = e.target.result;
                    data['uploadFile']['name'] = files.name;
                    addUser(data);
                };
                reader.readAsDataURL(files);
            } else
                addUser(data);
        }
    })

    function addUser(data) {
        $('.load').show();
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {

                $('.load').hide();
                if(result !== null){
                    const id = result.id;
                    window.location.href = "${UserUrl}?id="+id+"&message=insert_success&alert=success";
                }
                else
                    window.location.href = "${UserUrl}?message=username_email_exist&alert=danger";
            },
            error: function (error) {
                $('.load').hide();
                window.location.href = "${UserUrl}?message=system_error&alert=danger";
            }
        })
    }

    $('#deleteUser').click(function (e) {
        e.preventDefault();
        let data = {}; // mang object name: value
        // lay data khi check vao cac checkbox
        let dataArray = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val(); // lay value cua input checked
        }).get();
        if (dataArray.length != 0) {
            data['ids'] = dataArray;
            deleteUser(data);
        }
    })

    function deleteUser(data) {
        $('.load').show();
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                $('.load').hide();
                if(result)
                    window.location.href = "${UserUrl}?message=delete_success&alert=success";
                else
                    window.location.href = "${UserUrl}?message=delete_user_fail&alert=danger";
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
