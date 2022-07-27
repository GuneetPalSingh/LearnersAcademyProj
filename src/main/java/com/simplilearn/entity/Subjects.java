package com.simplilearn.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Subjects_LearnerAcad")
public class Subjects {
	
	@Id
	@GeneratedValue
	@Column(name="sub_id")
	private long subid;
	
	@Column(name="sub_name")
	private String subjectName;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="c_id")
	private SubClasses classes;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name="Teach_Id")
	private Teacher teacher;
	
	public long getSubid() {
		return subid;
	}

	public void setSubid(long subid) {
		this.subid = subid;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public SubClasses getSubclasses() {
		return classes;
	}

	public void setSubclasses(SubClasses classes) {
		this.classes = classes;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	
	
}