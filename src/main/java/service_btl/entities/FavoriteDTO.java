package service_btl.entities;

import java.util.Date;

public class FavoriteDTO {
    private Integer favoriteId;
    private Integer accountId; // Store only the account ID
    private Integer storyId;   // Store only the story ID
    private Date createAt;
    private Date updateAt;
    private Integer status;

    // Default constructor
    public FavoriteDTO() {}

    // Constructor with all fields
    public FavoriteDTO(Integer favoriteId, Integer accountId, Integer storyId, Date createAt, Date updateAt, Integer status) {
        this.favoriteId = favoriteId;
        this.accountId = accountId;
        this.storyId = storyId;
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

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getStoryId() {
        return storyId;
    }

    public void setStoryId(Integer storyId) {
        this.storyId = storyId;
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
