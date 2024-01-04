<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title><dec:title default="Trang Chủ"/></title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8"/>
    <meta name="keywords"
          content="Tech_Power Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <link rel="shortcut icon" href="<c:url value='#'/>">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <!-- Libraries Stylesheet -->
    <link href="<c:url value='/template/web/lib/animate/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/template/web/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value='/template/web/css/style.css'/>" rel="stylesheet">
    <!-- //Meta tag Keywords -->

    <!-- web fonts -->
    <link
            href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext"
            rel="stylesheet">
    <link
            href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
            rel="stylesheet">
    <!-- Icon Font Stylesheet -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- web fonts -->

</head>
<body>
<div class="container-xxl bg-white p-0">
<%@ include file="/common/web/header.jsp" %>
<%@ include file="/common/web/menu.jsp" %>
<%--<div class="load" style="display: none">--%>
<%--</div>--%>
<dec:body/>
<%@ include file="/common/web/footer.jsp" %>
</div>




<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/web/lib/wow/wow.min.js'/>"></script>
<script src="<c:url value='/template/web/lib/easing/easing.min.js'/>"></script>
<script src="<c:url value='/template/web/lib/waypoints/waypoints.min.js'/>"></script>
<script src="<c:url value='/template/web/lib/owlcarousel/owl.carousel.min.js'/>"></script>


<!-- Template Javascript -->
<script src="<c:url value='/template/web/js/main.js'/>"></script>



</body>
</html>