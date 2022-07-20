package com.gmprojects.vinylchum.models;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="records")
public class Vinyl {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	@NotBlank(message="Title field cannot be empty")
	private String title;
	@NotBlank(message="Author field cannot be empty")
	private String artist;
	@NotBlank(message="Author field cannot be empty")
	private Long artist;
	@NotBlank(message="Thoughts field cannot be empty")
	private String thoughts;

	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	// One user can have many vinyl records

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;

public Vinyl() {
        
    }