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
import javax.validation.constraints.NotNull;

@Entity
@Table(name="records")
public class Vinyl {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	@NotBlank(message="Artist field cannot be empty.")
	private String artist;
	@NotBlank(message="Title field cannot be empty.")
	private String title;
	@NotBlank(message="Label field cannot be empty.")
	private String label;
	@NotNull(message="Year of release field cannot be empty.")
	private Long year;
	@NotBlank(message="Catalogue number field cannot be empty.")
	private String cat_no;
	@NotNull(message="UPC/barcode number cannot be empty.")
	private Long upc_no;
	@NotBlank(message="Notes field cannot be empty.")
	private String notes;

	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	// One user can have many vinyl records

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	

public Vinyl() {
        
    }

public Long getId() {
	return Id;
}

public void setId(Long id) {
	Id = id;
}

public String getArtist() {
	return artist;
}

public void setArtist(String artist) {
	this.artist = artist;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getLabel() {
	return label;
}

public void setLabel(String label) {
	this.label = label;
}

public Long getYear() {
	return year;
}

public void setYear(Long year) {
	this.year = year;
}

public String getCat_no() {
	return cat_no;
}

public void setCat_no(String cat_no) {
	this.cat_no = cat_no;
}

public Long getUpc_no() {
	return upc_no;
}

public void setUpc_no(Long upc_no) {
	this.upc_no = upc_no;
}

public String getNotes() {
	return notes;
}

public void setNotes(String notes) {
	this.notes = notes;
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

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

@PrePersist
protected void onCreate(){
    this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate(){
    this.updatedAt = new Date();
}

}