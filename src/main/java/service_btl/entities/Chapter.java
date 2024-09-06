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
@Table(name = "chapters")
public class Chapter {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "chapterId")
	private Integer chapterId;

	@Column(name = "chapterTitle")
	private String chapterTitle;

	@Column(name = "content")
	private String content;

	@Column(name = "chapterNumber")
	private Integer chapterNumber;

	@Column(name = "create_at")
	private LocalDateTime createAt;

	@Column(name = "update_at")
	private LocalDateTime updateAt;

	@Column(name = "status")
	private int status;

	@ManyToOne
	@JoinColumn(name = "storyId", referencedColumnName = "storyId")
	private Story story;

	// Default Constructor
	public Chapter() {
		super();
	}

	// Parameterized Constructor
	public Chapter(Integer chapterId, Story story, String chapterTitle, String content, Integer chapterNumber,
			LocalDateTime createAt, LocalDateTime updateAt, int status) {
		this.chapterId = chapterId;
		this.story = story;
		this.chapterTitle = chapterTitle;
		this.content = content;
		this.chapterNumber = chapterNumber;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
	}

	// Getters and Setters
	public Integer getChapterId() {
		return chapterId;
	}

	public void setChapterId(Integer chapterId) {
		this.chapterId = chapterId;
	}

	public String getChapterTitle() {
		return chapterTitle;
	}

	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}

	public Integer getChapterNumber() {
		return chapterNumber;
	}

	public void setChapterNumber(Integer chapterNumber) {
		this.chapterNumber = chapterNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}
}
