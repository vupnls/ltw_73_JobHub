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
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Site Title -->
    <title>Job Listing</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/linearicons.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/font-awesome.min.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/magnific-popup.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/nice-select.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/animate.min.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/owl.carousel.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/main.css'/>" >
    <link rel="stylesheet" href="<c:url value='/template/web/css/style.css'/>" >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<%--Ajax--%>
    <script src="<c:url value='/template/web/vendors/jquery/dist/jquery.min.js'/>"></script>

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
<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="<c:url value='/template/web/js/easing.min.js'/>"></script>
<script src="<c:url value='/template/web/js/hoverIntent.js'/>"></script>
<script src="<c:url value='/template/web/js/superfish.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.ajaxchimp.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/template/web/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.sticky.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.nice-select.min.js'/>"></script>
<script src="<c:url value='/template/web/js/parallax.min.js'/>"></script>
<script src="<c:url value='/template/web/js/mail-script.js'/>"></script>
<script src="<c:url value='/template/web/js/main.js'/>"></script>

<!-- Template Javascript -->
<script src="<c:url value='/template/web/js/main.js'/>"></script>



</body>
</html>