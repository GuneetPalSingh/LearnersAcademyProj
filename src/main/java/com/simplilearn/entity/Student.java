package com.simplilearn.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_LearnerAcad")
public class Student {
	
	@Id
	@GeneratedValue
	@Column(name="s_id")
	private long student_id;
	
	@Column(name="f_name")
	private String fname;
	
	@Column(name="l_name")
	private String lname;
	
	/*@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name="student_class_link", joinColumns =@JoinColumn(name="s_id"),inverseJoinColumns = @JoinColumn(name="c_id"))
	private List<SubClasses> subclasses;*/
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="c_id")
	private SubClasses classes;

	public long getStudent_id() {
		return student_id;
	}

	public void setStudent_id(long student_id) {
		this.student_id = student_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public SubClasses getClasses() {
		return classes;
	}

	public void setClasses(SubClasses classes) {
		this.classes = classes;
	}

	
	

}
