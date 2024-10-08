package service_btl.entities;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope // Cấu hình phạm vi phiên
public class UserSession {
	private Account account; // Thông tin tài khoản

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public boolean isLoggedIn() {
        return account != null;
    }
}
