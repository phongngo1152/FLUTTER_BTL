package service_btl.entities;

import java.util.Date;

public class CommentDTO {
	private Integer commentId;
	private Integer accountId; // Only store the Account ID
	private Integer storyId; // Only store the Story ID
	private Integer chapterId; // Only store the Chapter ID
	private String content;
	private Date createAt;
	private Date updateAt;
	private Integer status;

	// Default constructor
	public CommentDTO() {
	}

	// Constructor with all fields
	public CommentDTO(Integer commentId, Integer accountId, Integer storyId, Integer chapterId, String content,
			Date createAt, Date updateAt, Integer status) {
		this.commentId = commentId;
		this.accountId = accountId;
		this.storyId = storyId;
		this.chapterId = chapterId;
		this.content = content;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
	}

	// Getters and Setters
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
