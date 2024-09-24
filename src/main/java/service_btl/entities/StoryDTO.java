package service_btl.entities;

import java.util.Date;

public class StoryDTO {
    private Integer storyId;
    private String title;
    private String description;
    private String coverImage;
    private Date createAt;
    private Date updateAt;
    private Boolean status;
    private Integer authorId; // Store only the author ID
    private Integer categoryId; // Store only the category ID

    // Default constructor
    public StoryDTO() {}

    // Constructor with all fields
    public StoryDTO(Integer storyId, String title, String description, String coverImage, Date createAt, 
                    Date updateAt, Boolean status, Integer authorId, Integer categoryId) {
        this.storyId = storyId;
        this.title = title;
        this.description = description;
        this.coverImage = coverImage;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.authorId = authorId;
        this.categoryId = categoryId;
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
