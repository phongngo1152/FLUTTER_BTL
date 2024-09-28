package service_btl.entities;

import java.util.Date;

public class CategoryDTO {
	public Integer categoryID;
	private String name;
	private String description;
	private Integer status;
	private Date createAt;
	private Date updateAt;

	public CategoryDTO() {
	}

	public CategoryDTO(Integer categoryID, String name, String description, Integer status, 
			Date createAt, Date updateAt) {
		super();
		this.categoryID = categoryID;
		this.name = name;
		this.description = description;
		this.status = status;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public Integer getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
	
}
