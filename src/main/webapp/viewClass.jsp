<%@page import="com.simplilearn.entity.Subjects"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.simplilearn.entity.SubClasses"%>
<%@page import="java.util.List"%>
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
<a href="HTML/addClasses.html">Add Class</a><br>
<a href="assignSubjectToClass.jsp">Assign Subject to Class</a><br>

<h1>The Following Classes are listed</h1>
<%
	SessionFactory sf  = HibernateUtil.getSessionFactory();
	Session hibernateSession = sf.openSession();
	List<SubClasses> classes = hibernateSession.createQuery("from SubClasses").list();
%>
<table>
<tr>
<th>Class Name </th>
<th>Subject Name</th>
</tr>	
	<%		
		for(SubClasses clas : classes){
			out.print("<tr>");	
			out.print("<td>" + clas.getClass_name() + "</td>");
						
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subjects subject : clas.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getSubjectName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td>");
					buf.append("<td>" + subject.getSubjectName() + "</td>");
					buf.append("</tr>");
				}
				
			}
			out.print(buf.toString());
		}
	%>
</table>
</body>
</html>