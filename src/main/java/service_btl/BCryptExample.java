
package service_btl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptExample {

    public static void main(String[] args) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String rawPassword = "thuy";

        String encodedPassword = passwordEncoder.encode(rawPassword);

        System.out.println("Mã số gốc: " + rawPassword);
        System.out.println("Mã số đã băm: " + encodedPassword);
    }
}