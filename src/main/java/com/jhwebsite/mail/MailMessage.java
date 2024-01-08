package com.jhwebsite.mail;

public class MailMessage {
    public static String getWelcome(String name) {
        StringBuilder sb = new StringBuilder();
        sb.append("Thân chào "+name+",\n");
        sb.append("Chúc mừng bạn đã đăng ký thành công tài khoản sử dụng dịch vụ của JH chúng tôi. \n");
        sb.append("Hy vọng bạn sẽ có được những sự trải nghiệm tuyệt vời và chọn lựa được những sản phẩm phù hợp với sự lựa chọn của mình.\n");
        sb.append("Chúng tôi rất vui lòng được giải đáp mọi thắc mắc của bạn về sản phẩm thông qua email này.\n");
        sb.append("Chúc một ngày tốt lành.\n");
        sb.append("Trân trọng cảm ơn!");
        return sb.toString();
    }
    public static String getWelcomeAdmin(String name) {
        StringBuilder sb = new StringBuilder();
        sb.append("Thân chào "+name+",\n");
        sb.append("Chúc mừng bạn đã phân quyền quản trị Eco Store.\n");
        sb.append("Hy vọng bạn sẽ hợp tác quản lý giúp Eco Store phát triển hơn.\n");
        sb.append("Chúc một ngày tốt lành.\n");
        sb.append("Trân trọng cảm ơn!");
        return sb.toString();
    }

    public  static String getUrlChangPass(String email, String keycode){
        StringBuilder sb = new StringBuilder();
        sb.append("Nhấn vào link bên dưới để thay đổi lại mật khẩu của bạn! \n");
        sb.append("http://localhost:8080/mat-khau-moi?email=" + email + "&key=" + keycode);
        return  sb.toString();
    }
}
