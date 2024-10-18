package service_btl.entities;

import java.util.Date;

public class FavoriteDTOInsertAPI {
	private int accountId; // Store only the account ID
	private int storyId; // Store only the story ID

	// Default constructor
	public FavoriteDTOInsertAPI() {
	}

	// Constructor with all fields
	public FavoriteDTOInsertAPI( int accountId, int storyId) {
		this.accountId = accountId;
		this.storyId = storyId;
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
}
