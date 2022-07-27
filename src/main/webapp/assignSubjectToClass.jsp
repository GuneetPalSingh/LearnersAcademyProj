<%@page import="com.simplilearn.entity.Subjects"%>
<%@page import="com.simplilearn.entity.SubClasses"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="index.html">Back to Main Menu</a><br>

<h1>Assign a Subject to a Class</h1>
<%
	SessionFactory sf  = HibernateUtil.getSessionFactory();
	Session hibernateSession = sf.openSession();
	List<SubClasses> classes = hibernateSession.createQuery("from SubClasses").list();
	List<Subjects> subjects = hibernateSession.createQuery("from Subjects").list();
%>
<form action="assignSubject" method="post">
<table>
<tr>
<th>Class Name </th>
<th>Subject Name </th>
</tr>
<tr>
<td>
<select name="class">
<%
	for (SubClasses clas : classes){
	out.print("<option>" + clas.getClass_name());
	out.print("</option>");
	}
%>
</select>
</td>

<td>
<select name="subject">
<%
	for (Subjects subject : subjects){
	out.print("<option>" + subject.getSubjectName());
	out.print("</option>");
	}
%>
</select>
</td>
</tr>
</table>
<input type="submit" value="Submit">
</form>
</body>
</html>