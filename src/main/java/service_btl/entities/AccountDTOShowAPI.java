package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;

public class AccountDTOShowAPI {
	private Integer acId;
	private String userName;


	// Constructor không tham số
	public AccountDTOShowAPI() {
	}

	// Constructor với tất cả các thuộc tính
	public AccountDTOShowAPI(Integer acId, String userName) {
		this.acId = acId;
		this.userName = userName;
	}

	// Getter và Setter cho tất cả các thuộc tính
	public Integer getAcId() {
		return acId;
	}

	public void setAcId(Integer acId) {
		this.acId = acId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
