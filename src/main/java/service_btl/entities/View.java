package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;
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
	private Date viewedAt;

	@Column(name = "create_at")
	private Date createAt;

	@Column(name = "update_at")
	private Date updateAt;

	@Column(name = "status")
	private Integer status;

	// Default constructor
	public View() {
	}

	// Constructor with all fields
	public View(Integer viewId, Account account, Story story, Chapter chapter, Date viewedAt,
			Date createAt, Date updateAt, Integer status) {
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