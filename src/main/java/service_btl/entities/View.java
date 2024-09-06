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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "views")
public class View {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "viewId")
	private Integer viewId;

	@ManyToOne
	@JoinColumn(name = "acId", referencedColumnName = "acId")
	private Account account;

	@ManyToOne
	@JoinColumn(name = "storyId", referencedColumnName = "storyId")
	private Story story;

	@ManyToOne
	@JoinColumn(name = "chapterId", referencedColumnName = "chapterId")
	private Chapter chapter;

	@Column(name = "viewed_at")
	private LocalDateTime viewedAt;

	@Column(name = "create_at")
	private LocalDateTime createAt;

	@Column(name = "update_at")
	private LocalDateTime updateAt;

	@Column(name = "status")
	private int status;

	// Default constructor
	public View() {
	}

	// Constructor with all fields
	public View(Integer viewId, Account account, Story story, Chapter chapter, LocalDateTime viewedAt,
			LocalDateTime createAt, LocalDateTime updateAt, int status) {
		this.viewId = viewId;
		this.account = account;
		this.story = story;
		this.chapter = chapter;
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

	public Chapter getChapter() {
		return chapter;
	}

	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public LocalDateTime getViewedAt() {
		return viewedAt;
	}

	public void setViewedAt(LocalDateTime viewedAt) {
		this.viewedAt = viewedAt;
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