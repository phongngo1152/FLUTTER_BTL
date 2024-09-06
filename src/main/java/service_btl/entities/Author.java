package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "authors")
public class Author {
    @Id
    @Column(name = "authorId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer authorId;

    @Column(name = "name")
    private String name;

    @Column(name = "bio")
    private String bio;

    @Column(name = "create_at")
    private LocalDateTime createAt;

    @Column(name = "update_at")
    private LocalDateTime updateAt;

    @Column(name = "status")
    private int status;

    @OneToMany(mappedBy = "author",fetch = FetchType.EAGER)
    private Set<Story> stories;

    public Author() {
        super();
    }

    public Author(Integer authorId, String name, String bio, LocalDateTime createAt, LocalDateTime updateAt, int status, Set<Story> stories) {
        super();
        this.authorId = authorId;
        this.name = name;
        this.bio = bio;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.stories = stories;
    }

    // Getters and Setters
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

    public Set<Story> getStories() {
        return stories;
    }

    public void setStories(Set<Story> stories) {
        this.stories = stories;
    }
}
