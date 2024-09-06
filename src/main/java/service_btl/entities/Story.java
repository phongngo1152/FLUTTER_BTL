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
@Table(name = "stories")
public class Story {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "storyId")
    private Integer storyId;

    @Column(name = "title")
    private String title;

    @Column(name = "summary")
    private String summary;

    @Column(name = "content")
    private String content;

    @Column(name = "create_at")
    private LocalDateTime createAt;

    @Column(name = "update_at")
    private LocalDateTime updateAt;

    @Column(name = "status")
    private Boolean status;

    @ManyToOne
    @JoinColumn(name = "authorId", referencedColumnName = "authorId")
    private Author author;

    @ManyToOne
    @JoinColumn(name = "categoryId", referencedColumnName = "categoryId", nullable = false)
    private Category category;
    @OneToMany(mappedBy = "Stories")
    private Set<Chapter> chapters;

    @OneToMany(mappedBy = "Stories")
    private Set<Comment> comments;

    @OneToMany(mappedBy = "Stories")
    private Set<View> views;

    // Default Constructor
    public Story() {
        super();
    }

    // Parameterized Constructor
    public Story(Integer storyId, String title, String summary, String content, LocalDateTime createAt,
                 LocalDateTime updateAt, Boolean status, Author author, Set<Chapter> chapters, 
                 Set<Comment> comments, Set<View> views) {
        this.storyId = storyId;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.author = author;
        this.chapters = chapters;
        this.comments = comments;
        this.views = views;
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Set<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(Set<Chapter> chapters) {
        this.chapters = chapters;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<View> getViews() {
        return views;
    }

    public void setViews(Set<View> views) {
        this.views = views;
    }
}
