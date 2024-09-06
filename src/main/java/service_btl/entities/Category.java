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
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryId")
    private Integer categoryId;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "create_at", nullable = false)
    private LocalDateTime createAt;

    @Column(name = "update_at")
    private LocalDateTime updateAt;

    @Column(name = "status", nullable = false)
    private int status;

    @OneToMany(mappedBy = "category")
    private Set<Story> stories;

    // Default constructor
    public Category() {}

    // Constructor with all fields
    public Category(Integer categoryId, String name, String description, LocalDateTime createAt, LocalDateTime updateAt, int status) {
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
    }

    // Getters and Setters
    public Integer getCategoryId() { return categoryId; }
    public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public LocalDateTime getCreateAt() { return createAt; }
    public void setCreateAt(LocalDateTime createAt) { this.createAt = createAt; }

    public LocalDateTime getUpdateAt() { return updateAt; }
    public void setUpdateAt(LocalDateTime updateAt) { this.updateAt = updateAt; }

    public int getStatus() { return status; }

	public void setStatus(int status) { this.status = status; }

    public Set<Story> getStories() { return stories; }
    public void setStories(Set<Story> stories) { this.stories = stories; }
}