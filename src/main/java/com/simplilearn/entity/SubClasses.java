package com.simplilearn.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Classes_LearnerAcad")
public class SubClasses {
	
	@Id
	@GeneratedValue
	@Column(name="c_id")
	private long class_id;
	
	@Column(name="c_name")
	private String class_name;

	@OneToMany(cascade= CascadeType.ALL, mappedBy="classes")
	private List<Student> students;
	
	@OneToMany(cascade= CascadeType.ALL, mappedBy="classes")
	private List<Subjects> subjects;

	public long getClass_id() {
		return class_id;
	}

	public void setClass_id(long class_id) {
		this.class_id = class_id;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<Subjects> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}

	
}
