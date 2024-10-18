package service_btl.entities;

import java.time.LocalDateTime;
import java.util.Date;
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
	private Date createAt;

	@Column(name = "update_at")
	private Date updateAt;

	@Column(name = "status")
	private Integer status;

	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Set<Story> stories;

	public Author() {
		super();
	}

	public Author(Integer authorId, String name, String bio, Date createAt, Date updateAt, int status) {
		this.authorId = authorId;
		this.name = name;
		this.bio = bio;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.status = status;

	}

	public Author(Integer authorId, String name, String bio, Date createAt, Date updateAt, Integer status,
			Set<Story> stories) {
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

	public Set<Story> getStories() {
		return stories;
	}

	public void setStories(Set<Story> stories) {
		this.stories = stories;
	}
}
