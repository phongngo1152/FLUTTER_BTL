package service_btl.entities;

import java.util.Date;

public class CommentDTOShowAPI {
	private Integer commentId;
	private String content;
	private AccountDTOShowAPI account;
	private Integer storyId;
	private String storyName;
	// Only store the Account ID // Only store the Story ID



	// Default constructor
	public CommentDTOShowAPI() {
	}

	// Constructor with all fields
	public CommentDTOShowAPI(Integer commentId, String content, AccountDTOShowAPI account, Integer storyId, String storyName) {
		this.commentId = commentId;
		this.content = content;
		this.account = account;
		this.storyId = storyId;
		this.storyName = storyName;
	}

	// Getters and Setters
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public AccountDTOShowAPI getAccount() {
		return account;
	}

	public void setAccount(AccountDTOShowAPI account) {
		this.account = account;
	}


	
	public Integer getStoryId() {
		return storyId;
	}

	public void setStoryId(Integer content) {
		this.storyId = storyId;
	}

	public String getStoryName() {
		return storyName;
	}
	
	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}
}
