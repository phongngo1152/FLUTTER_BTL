package service_btl.entities;

import java.util.Date;

public class CommentDTOInsertAPI {
	private int accountId; // Only store the Account ID
	private int storyId; // Only store the Story ID
	private int chapterId; // Only store the Chapter ID
	private String content;

	// Default constructor
	public CommentDTOInsertAPI() {
	}

	// Constructor with all fields
	public CommentDTOInsertAPI(int accountId, int storyId, int chapterId, String content) {
		this.accountId = accountId;
		this.storyId = storyId;
		this.chapterId = chapterId;
		this.content = content;
		
	}

	

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getChapterId() {
		return chapterId;
	}

	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
