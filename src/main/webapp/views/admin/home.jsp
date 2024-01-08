<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div class="breadcrumbs">
    <div class="col-sm-4">
        <div class="page-header float-left">
            <div class="page-title">
                <h1>Thống kê</h1>
            </div>
        </div>
    </div>
</div>

<div class="content mt-3">
<%--    danh sach quan tri vien--%>
    <div class="row justify-content-center">
        <c:forEach var="item" items="${admins}">
            <div class="col-xl-4 col-lg-6">
                <section class="card">
                    <div class="twt-feed blue-bg">
                        <div class="media">
                            <a href="#">
                                <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt=""
                                     src="<c:url value='${item.avatar}'/> ">
                            </a>
                            <div class="media-body">
                                <h2 class="text-white display-6">${item.fullname}</h2>
                                <p class="text-light">${item.role.name}</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </c:forEach>
    </div>
<%--thong ke--%>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="stat-widget-one">
                        <div class="stat-icon dib"><i class="fa fa-shopping-cart ti-money text-info"></i></div>
                        <div class="stat-content dib">
                            <div class="stat-text">Số lượng đơn hàng:</div>
                            <div class="stat-digit">${totalOrders}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="stat-widget-one">
                        <div class="stat-icon dib"><i class="fa fa-money ti-money text-success"></i></div>
                        <div class="stat-content dib">
                            <div class="stat-text">Tổng doanh thu:</div>
                            <div class="stat-digit" id="revenue">${revenue}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="stat-widget-one">
                        <div class="stat-icon dib"><i class="fa fa-user ti-money text-secondary"></i></div>
                        <div class="stat-content dib">
                            <div class="stat-text">Số lượng khách hàng:</div>
                            <div class="stat-digit">${totalUsers}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="stat-widget-one">
                        <div class="stat-icon dib"><i class="fa fa-product-hunt ti-money text-warning"></i></div>
                        <div class="stat-content dib">
                            <div class="stat-text">Sản phẩm đang hoạt động:</div>
                            <div class="stat-digit">${totalProductActive}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .content -->
<script>
    function formatVND(element) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(element);
    }
    let revenue = document.getElementById("revenue").innerHTML;
    document.getElementById("revenue").innerHTML = formatVND(revenue);
</script>
</body>
</html>
