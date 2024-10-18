package service_btl.entities;

import java.util.Date;

public class ChapterDTOShowAPI {
	private Integer chapterId;
	private String chapterTitle;
	private String content;
	private Integer chapterNumber;
	// Only store the story ID for the DTO

	// Default Constructor
	public ChapterDTOShowAPI() {
	}

	// Parameterized Constructor
	public ChapterDTOShowAPI(Integer chapterId, String chapterTitle, String content, Integer chapterNumber) {
		this.chapterId = chapterId;
		this.chapterTitle = chapterTitle;
		this.content = content;
		this.chapterNumber = chapterNumber;
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

}
