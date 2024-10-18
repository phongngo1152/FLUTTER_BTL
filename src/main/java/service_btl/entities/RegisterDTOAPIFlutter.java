package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;

public class RegisterDTOAPIFlutter {
	private String userName;
	private String email;
	private String password;

	// Constructor không tham số
	public RegisterDTOAPIFlutter() {
	}

	// Constructor với tất cả các thuộc tính
	public RegisterDTOAPIFlutter(String userName, String email, String password) {
		this.userName = userName;
		this.email = email;
		this.password = password;
	}

	// Getter và Setter cho tất cả các thuộc tính

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
