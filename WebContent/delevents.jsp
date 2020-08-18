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
		String eid=request.getParameter("id");
		PreparedStatement st1=cn.prepareStatement("delete from feedback where eid=?");
		st1.setString(1,eid);
		st1.executeUpdate();
		PreparedStatement st2=cn.prepareStatement("delete from fposition where rid in(select rid from registration where eid=?)");
		st2.setString(1,eid);
		st2.executeUpdate();
		PreparedStatement st3=cn.prepareStatement("delete from sposition where rid in(select rid from registration where eid=?)");
		st3.setString(1,eid);
		st3.executeUpdate();
		PreparedStatement st4=cn.prepareStatement("delete from tposition where rid in(select rid from registration where eid=?)");
		st4.setString(1,eid);
		st4.executeUpdate();
		PreparedStatement st5=cn.prepareStatement("delete from registration where eid=?");
		st5.setString(1,eid);
		st5.executeUpdate();
		PreparedStatement st6=cn.prepareStatement("delete from event where eid=?");
		st6.setString(1,eid);
		st6.executeUpdate();
		
		response.sendRedirect("event.jsp");
		
		
	}
catch(Exception e)
{
	}
%>
</body>
</html>