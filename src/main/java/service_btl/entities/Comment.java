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
import javax.persistence.Table;


@Entity
@Table(name = "comments")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "commentId")
    private Integer commentId;

    @ManyToOne
    @JoinColumn(name = "acId", referencedColumnName = "acId")
    private Account account;

    @ManyToOne
    @JoinColumn(name = "storyId", referencedColumnName = "storyId")
    private Story story;

    @ManyToOne
    @JoinColumn(name = "chapterId", referencedColumnName = "chapterId")
    private Chapter chapter;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "create_at", nullable = false)
    private LocalDateTime createAt;

    @Column(name = "update_at")
    private LocalDateTime updateAt;

    @Column(name = "status", nullable = false)
    private int status;

    // Default constructor
    public Comment() {}

    // Constructor with all fields
    public Comment(Integer commentId, Account account, Story story, Chapter chapter, String content,
                   LocalDateTime createAt, LocalDateTime updateAt, int status) {
        this.commentId = commentId;
        this.account = account;
        this.story = story;
        this.chapter = chapter;
        this.content = content;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
    }

    // Getters and Setters
    public Integer getCommentId() { return commentId; }
    public void setCommentId(Integer commentId) { this.commentId = commentId; }

    public Account getAccount() { return account; }
    public void setAccount(Account account) { this.account = account; }

    public Story getStory() { return story; }
    public void setStory(Story story) { this.story = story; }

    public Chapter getChapter() { return chapter; }
    public void setChapter(Chapter chapter) { this.chapter = chapter; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public LocalDateTime getCreateAt() { return createAt; }
    public void setCreateAt(LocalDateTime createAt) { this.createAt = createAt; }

    public LocalDateTime getUpdateAt() { return updateAt; }
    public void setUpdateAt(LocalDateTime updateAt) { this.updateAt = updateAt; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
}