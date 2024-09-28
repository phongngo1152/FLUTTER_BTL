package service_btl.entities;

import java.util.Date;

public class ChapterDTO {
	private Integer chapterId;
	private String chapterTitle;
	private String content;
	private Integer chapterNumber;
	private Date createAt;
	private Date updateAt;
	private Integer status;
	private Integer storyId; // Only store the story ID for the DTO

	// Default Constructor
	public ChapterDTO() {
	}

	// Parameterized Constructor
	public ChapterDTO(Integer chapterId, String chapterTitle, String content, Integer chapterNumber, Date createAt,
			Date updateAt, Integer status, Integer storyId) {
		this.chapterId = chapterId;
		this.chapterTitle = chapterTitle;
		this.content = content;
		this.chapterNumber = chapterNumber;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
		this.storyId = storyId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getChapterNumber() {
		return chapterNumber;
	}

	public void setChapterNumber(Integer chapterNumber) {
		this.chapterNumber = chapterNumber;
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

	public Integer getStoryId() {
		return storyId;
	}

	public void setStoryId(Integer storyId) {
		this.storyId = storyId;
	}
}
