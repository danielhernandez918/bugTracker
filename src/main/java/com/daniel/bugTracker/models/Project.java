package com.daniel.bugTracker.models;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="projects")
public class Project {
 	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Size(min = 5, max = 200, message="Title must be at least 5 characters.")
    private String title;
    @NotNull
    @Size(min = 5, max = 200, message="Description must be at least 5 characters and less than 200.")
    private String description;
    @NotNull

    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="poster_id")
    private User poster;
    
//    @ManyToMany(mappedBy = "partneredProjects")
//    private Set<User> partners;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "partners_projects", 
        joinColumns = @JoinColumn(name = "project_id"), 
        inverseJoinColumns = @JoinColumn(name = "partner_id")
    )
    private List<User> partners;
    
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Project() {
    }
//    public Project(String title, User poster) {
//        this.title = title;
//        this.poster = poster;
//    }
    
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	
	public User getPoster() {
		return poster;
	}
	public void setPoster(User poster) {
		this.poster = poster;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	public List<User> getPartners() {
		return partners;
	}
	public void setPartners(List<User> partners) {
		this.partners = partners;
	}
	
}
