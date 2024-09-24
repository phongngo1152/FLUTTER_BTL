package service_btl.entities;

import java.util.Date;
import java.util.Set;

public class AuthorDTO {
    private Integer authorId;
    private String name;
    private String bio;
    private Date createAt;
    private Date updateAt;
    private int status;
    private Set<Integer> storyIds; // Chỉ cần lưu các ID của các Story

    // Constructor không tham số
    public AuthorDTO() {
    }

    // Constructor với tất cả các thuộc tính
    public AuthorDTO(Integer authorId, String name, String bio, Date createAt, Date updateAt, int status, Set<Integer> storyIds) {
        this.authorId = authorId;
        this.name = name;
        this.bio = bio;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.storyIds = storyIds;
    }
    public AuthorDTO(Integer authorId, String name, String bio, Date createAt, Date updateAt, int status) {
        this.authorId = authorId;
        this.name = name;
        this.bio = bio;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
       
    }
    // Getter và Setter cho tất cả các thuộc tính
    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Set<Integer> getStoryIds() {
        return storyIds;
    }

    public void setStoryIds(Set<Integer> storyIds) {
        this.storyIds = storyIds;
    }
}
