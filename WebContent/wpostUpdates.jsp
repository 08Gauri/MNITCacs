<%@ page language="java" import="java.sql.*"  contentType="text/html; charset=ISO-8859-1"
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
	String wid=request.getParameter("wid");
	PreparedStatement st1=cn.prepareStatement("update wpost set msg=?,privacy=? where wid=? ");
	st1.setString(1,request.getParameter("msg"));
	st1.setString(2,request.getParameter("privacy"));
	st1.setString(3,request.getParameter("wid"));
	st1.executeUpdate();
	response.sendRedirect("fwelcome.jsp");
}
catch(Exception e)
{}
%>
</body>
</html>