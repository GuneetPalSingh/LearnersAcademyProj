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
@Table(name="Teacher_LearnerAcad")
public class Teacher {
	
	@Id
	@GeneratedValue
	@Column(name="Teach_Id")
	private long teachId;
	
	@Column(name="Teach_FName")
	private String teachFName;
	
	@Column(name="Teach_LName")
	private String teachLName;
	
	@OneToMany(mappedBy = "teacher", cascade = CascadeType.ALL)
	private List<Subjects> subjects;
	
	public long getTeachId() {
		return teachId;
	}

	public void setTeachId(long teachId) {
		this.teachId = teachId;
	}

	

	public String getTeachFName() {
		return teachFName;
	}

	public void setTeachFName(String teachFName) {
		this.teachFName = teachFName;
	}

	public String getTeachLName() {
		return teachLName;
	}

	public void setTeachLName(String teachLName) {
		this.teachLName = teachLName;
	}

	public List<Subjects> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}

	
}
