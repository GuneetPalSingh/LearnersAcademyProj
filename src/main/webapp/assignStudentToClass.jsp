<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.simplilearn.entity.SubClasses"%>
<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.simplilearn.entity.Student"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="index.html">Back to Main Menu</a><br>

<h1>Assign a Student to a Class</h1>
<%
	SessionFactory sf  = HibernateUtil.getSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
	List<SubClasses> classes = hibernateSession.createQuery("from SubClasses").list();
%>
<form action="assignStudent" method="post">
<table>
<tr>
<th>Student Name </th>
<th>Class Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Student student : students){
	out.print("<option>" + student.getFname() + " " + student.getLname());
	out.print("</option>");
	}
%>
</select>
</td>

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
</tr>
</table>
<input type="submit" value="Submit">
</form>

</body>
</html>