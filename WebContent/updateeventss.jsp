<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
	PreparedStatement st1=cn.prepareStatement("update event set description=?,edate=? where eid=? ");
	st1.setString(1,request.getParameter("desc"));
	String date=request.getParameter("year")+request.getParameter("month")+request.getParameter("date");
	st1.setString(2,date);
	st1.setString(3,request.getParameter("eid"));
	st1.executeUpdate();
	response.sendRedirect("event.jsp");
}
catch(Exception e)
{}
%>
</body>
</html>