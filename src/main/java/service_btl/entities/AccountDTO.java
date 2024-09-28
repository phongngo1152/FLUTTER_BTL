package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;

public class AccountDTO {
	private Integer acId;
	private String userName;
	private String email;
	private String password;
	private Integer role;
	private Date createAt;
	private Date updateAt;
	private Integer status;

	// Constructor không tham số
	public AccountDTO() {
	}

	// Constructor với tất cả các thuộc tính
	public AccountDTO(Integer acId, String userName, String email, String password, Integer role, Date createAt,
			Date updateAt, Integer status) {
		this.acId = acId;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.role = role;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
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

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
