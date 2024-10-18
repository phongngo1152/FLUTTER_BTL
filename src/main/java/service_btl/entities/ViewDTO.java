package service_btl.entities;

import java.util.Date;

public class ViewDTO {
	private Integer viewId;
	private Integer accountId; // Store only the account ID
	private Integer storyId; // Store only the story ID
	private Integer chapterId; // Store only the chapter ID
	private Date viewedAt;
	private Date createAt;
	private Date updateAt;
	private Integer status;

	// Default constructor
	public ViewDTO() {
	}

	// Constructor with all fields
	public ViewDTO(Integer viewId, Integer accountId, Integer storyId, Integer chapterId, Date viewedAt, Date createAt,
			Date updateAt, Integer status) {
		this.viewId = viewId;
		this.accountId = accountId;
		this.storyId = storyId;
		this.chapterId = chapterId;
		this.viewedAt = viewedAt;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
	}

	// Getters and Setters
	public Integer getViewId() {
		return viewId;
	}

	public void setViewId(Integer viewId) {
		this.viewId = viewId;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getStoryId() {
		return storyId;
	}

	public void setStoryId(Integer storyId) {
		this.storyId = storyId;
	}

	public Integer getChapterId() {
		return chapterId;
	}

	public void setChapterId(Integer chapterId) {
		this.chapterId = chapterId;
	}

	public Date getViewedAt() {
		return viewedAt;
	}

	public void setViewedAt(Date viewedAt) {
		this.viewedAt = viewedAt;
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
