package service_btl.entities;

import java.util.Date;

public class FavoriteDTOShowAPI {
	private Integer favoriteId;
	private AccountDTOShowAPI account; // Store only the account ID
	private StoryDTOShowAPI story; // Store only the story ID

	// Default constructor
	public FavoriteDTOShowAPI() {
	}

	// Constructor with all fields
	public FavoriteDTOShowAPI(Integer favoriteId, AccountDTOShowAPI account, StoryDTOShowAPI story) {
		this.favoriteId = favoriteId;
		this.account = account;
		this.story = story;
	}

	// Getters and Setters
	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
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
