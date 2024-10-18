package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;

public class LoginDTOAPIFlutter {
	private String userName;
	private String password;

	public LoginDTOAPIFlutter() {
	}

	public LoginDTOAPIFlutter(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
