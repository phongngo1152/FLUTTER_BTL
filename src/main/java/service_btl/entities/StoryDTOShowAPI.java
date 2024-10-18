package service_btl.entities;

import java.util.List;

public class StoryDTOShowAPI {
	
    private Integer storyId;
    private String title;
    private String description;
    private String coverImage;

    
    private AuthorDTOShowAPI author; 
    private CategoryDTOShowAPI category;
    
    private Integer totalChapter;
    private Integer totalComment;
    private Integer totalFavorite;
    

    // Constructor
    public StoryDTOShowAPI(Integer storyId, String title, String description, String coverImage, 
                           AuthorDTOShowAPI author, CategoryDTOShowAPI category, 
                           Integer totalChapter, Integer totalComment, Integer totalFavorite) {
        this.storyId = storyId;
        this.title = title;
        this.description = description;
        this.coverImage = coverImage;
        this.author = author;
        this.category = category;
        this.totalChapter = totalChapter;
        this.totalComment = totalComment;
        this.totalFavorite = totalFavorite;

    }

    // Getters and Setters
    public Integer getStoryId() {
        return storyId;
    }

    public void setStoryId(Integer storyId) {
        this.storyId = storyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    public AuthorDTOShowAPI getAuthor() {
        return author;
    }

    public void setAuthor(AuthorDTOShowAPI author) {
        this.author = author;
    }

    public CategoryDTOShowAPI getCategory() {
        return category;
    }

    public void setCategory(CategoryDTOShowAPI category) {
        this.category = category;
    }

    public Integer getTotalChapter() {
        return totalChapter;
    }

    public void setTotalChapter(Integer totalChapter) {
        this.totalChapter = totalChapter;
    }

    public Integer getTotalComment() {
        return totalComment;
    }

    public void setTotalComment(Integer totalComment) {
        this.totalComment = totalComment;
    }

    public Integer getTotalFavorite() {
        return totalFavorite;
    }

    public void setTotalFavorite(Integer totalFavorite) {
        this.totalFavorite = totalFavorite;
    }
    
}