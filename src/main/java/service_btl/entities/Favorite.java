package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "favorites")
public class Favorite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "favoriteId")
	private Integer favoriteId;

	@ManyToOne
	@JoinColumn(name = "acId", referencedColumnName = "acId")
	private Account account;

	@ManyToOne
	@JoinColumn(name = "storyId", referencedColumnName = "storyId")
	private Story story;

	@Column(name = "create_at", nullable = false)
	private LocalDateTime createAt;

	@Column(name = "update_at")
	private LocalDateTime updateAt;

	@Column(name = "status", nullable = false)
	private int status;

	// Default constructor
	public Favorite() {
	}

	// Constructor with all fields
	public Favorite(Integer favoriteId, Account account, Story story, LocalDateTime createAt, LocalDateTime updateAt,
			int status) {
		this.favoriteId = favoriteId;
		this.account = account;
		this.story = story;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
	}

	// Getters and Setters
	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}