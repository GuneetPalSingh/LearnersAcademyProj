package com.simplilearn.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.simplilearn.entity.SubClasses;
import com.simplilearn.entity.Subjects;
import com.simplilearn.entity.Teacher;
import com.simplilearn.entity.Student;



public class HibernateUtil {

	static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {

		if (sessionFactory != null)
			return sessionFactory;

		// STEP 1: Creating Configuration object and providing DB inforamation and
		// mapping information
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");
		configuration.addAnnotatedClass(Student.class);
		configuration.addAnnotatedClass(SubClasses.class);
		configuration.addAnnotatedClass(Subjects.class);
		configuration.addAnnotatedClass(Teacher.class);

		// STEP 2: create Session Factory object and return
		sessionFactory = configuration.buildSessionFactory();
		return sessionFactory;

	}

}