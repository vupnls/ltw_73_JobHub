$(document).ready(function () {
    // Số ký tự tối đa
    var maxLength = 80704;

    // Hàm xử lý sự kiện input
    function handleInputEvent(textAreaId, charCountId) {
        $(textAreaId).on("input", function () {
            // Lấy số ký tự đã nhập
            var currentLength = $(this).val().length;

            // Cập nhật số ký tự
            $(charCountId).text("(" + currentLength + "/" + maxLength + " ký tự)");
        });
    }

    // Áp dụng hàm xử lý sự kiện cho mô tả công việc
    handleInputEvent("#job_description", "#char-count1");

    // Áp dụng hàm xử lý sự kiện cho yêu cầu công việc
    handleInputEvent("#job_request", "#char-count2");

    // Áp dụng hàm xử lý sự kiện cho thông tin công ty
    handleInputEvent("#company-info", "#char-count3");
});

function showTab(tabId) {
    // Ẩn tất cả các tab content
    $(".tab-content").removeClass("active");

    // Xóa lớp 'active' từ tất cả các tab link
    $("#myTabs .nav-link").removeClass("active");

    // Thêm lớp 'active' cho tab link được chọn
    $("a[data-tab='" + tabId + "']").addClass("active");

    // Thêm lớp 'active' cho tab content tương ứng với tab được chọn
    $("#" + tabId).addClass("active");
}
