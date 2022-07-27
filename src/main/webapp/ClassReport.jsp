<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.simplilearn.entity.Student"%>
<%@page import="com.simplilearn.entity.Teacher"%>
<%@page import="com.simplilearn.entity.Subjects"%>
<%@page import="com.simplilearn.entity.SubClasses"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="index.html">Back to Main Menu</a><br>
<%String clas = request.getParameter("class");%>
<h1>Class Report for <%=clas%></h1>

<%
	SessionFactory sf  = HibernateUtil.getSessionFactory();
	Session hibernateSession = sf.openSession();
	List<SubClasses> classes = hibernateSession.createQuery("from SubClasses cl where cl.class_name='" + clas + "'").list();
	SubClasses clasForReport = classes.get(0);
%>
<table>
<tr>
<th>Subject Name </th>
<th>Teacher Name </th>
</tr>
<%	
	for(Subjects subject: clasForReport.getSubjects()){
		out.print("<tr>");	
		out.print("<td>" + subject.getSubjectName() + "</td>");
		out.print("<td>" + getTeacherName(subject) + "</td>");
		out.print("</tr>");
	}
%>
</table>
<%!
	public String getTeacherName(Subjects subject){
		Teacher teacher = subject.getTeacher();
		String name;
		String lname;
	
		if(teacher != null){
			name=teacher.getTeachFName();
			lname = teacher.getTeachLName();
			
			return name + " " + lname;
		}else{
			return "No Teacher assigned";
		}
}
%>
<table>
<br>
<tr>
<th>Listed Students</th>
</tr>
<%
	for(Student student : clasForReport.getStudents()){
		out.print("<tr>");
		out.print("<td>" + student.getFname() + " " + student.getLname() + "</td>");
		out.print("</tr>");
	}
%>
</table>
</body>
</html>