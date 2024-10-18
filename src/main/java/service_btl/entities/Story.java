package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;
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

	@Column(name = "description")
	private String description;

	@Column(name = "coverImage")
	private String coverImage;

	@Column(name = "create_at")
	private Date createAt;

	@Column(name = "update_at")
	private Date updateAt;

	@Column(name = "status")
	private Boolean status;

	@ManyToOne
	@JoinColumn(name = "authorId", nullable = false)
	private Author author;

	@ManyToOne
	@JoinColumn(name = "categoryId", nullable = false)
	private Category category;
	
//	@OneToMany(mappedBy = "story")
//	private Set<Chapter> chapters;
//
//	@OneToMany(mappedBy = "story")
//	private Set<Comment> comments;
//
//	@OneToMany(mappedBy = "story")
//	private Set<View> views;

	// Default Constructor
	public Story() {
		super();
	}

	// Parameterized Constructor

	public Story(Integer storyId, String title, String description, String coverImage, Date createAt, Date updateAt,
			Boolean status, Author author, Category category
//			Set<Chapter> chapters, Set<Comment> comments, Set<View> views
			) {
		super();
		this.storyId = storyId;
		this.title = title;
		this.description = description;
		this.coverImage = coverImage;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;
		this.author = author;
		this.category = category;
//		this.chapters = chapters;
//		this.comments = comments;
//		this.views = views;
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

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

//	public Set<Chapter> getChapters() {
//		return chapters;
//	}
//
//	public void setChapters(Set<Chapter> chapters) {
//		this.chapters = chapters;
//	}
//
//	public Set<Comment> getComments() {
//		return comments;
//	}
//
//	public void setComments(Set<Comment> comments) {
//		this.comments = comments;
//	}
//
//	public Set<View> getViews() {
//		return views;
//	}
//
//	public void setViews(Set<View> views) {
//		this.views = views;
//	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	 // Getters for Author and Category

    public String getAuthorName() {
        return author != null ? author.getName() : "Unknown Author";
    }

    public String getCategoryName() {
        return category != null ? category.getName() : "Unknown Category";
    }
}
