package service_btl.entities;

import java.util.Date;

public class CommentDTOShowAPI {
	private Integer commentId;
	private String content;
	private AccountDTOShowAPI account;
	private StoryDTOShowAPI story;
	// Only store the Account ID // Only store the Story ID



	// Default constructor
	public CommentDTOShowAPI() {
	}

	// Constructor with all fields
	public CommentDTOShowAPI(Integer commentId, String content, AccountDTOShowAPI account, StoryDTOShowAPI story) {
		this.commentId = commentId;
		this.content = content;
		this.account = account;
		this.story = story;
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

	public StoryDTOShowAPI getStory() {
		return story;
	}

	public void setStory(StoryDTOShowAPI story) {
		this.story = story;
	}
	
	
}
