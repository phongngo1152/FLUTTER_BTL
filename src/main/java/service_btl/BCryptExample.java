
package service_btl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptExample {

    public static void main(String[] args) {
        // Khởi tạo đối tượng BCryptPasswordEncoder
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // Mã số cần băm
        String rawPassword = "123456";

        // Băm mã số
        String encodedPassword = passwordEncoder.encode(rawPassword);

        // Hiển thị kết quả
        System.out.println("Mã số gốc: " + rawPassword);
        System.out.println("Mã số đã băm: " + encodedPassword);
    }
}