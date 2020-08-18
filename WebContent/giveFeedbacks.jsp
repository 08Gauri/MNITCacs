<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
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
	PreparedStatement st0 = cn.prepareStatement("select * from feedback where email = ? and eid = ?");
	st0.setString(1,session.getAttribute("email").toString());
	st0.setString(2,request.getParameter("id"));
	ResultSet rs0 = st0.executeQuery();
	
	if(rs0.next())
	{
		PreparedStatement st1=cn.prepareStatement("update feedback set score = ? where email = ? and eid = ?");
		
		
		st1.setString(1,request.getParameter("feedback"));	
		st1.setString(2,session.getAttribute("email").toString());
		st1.setString(3,request.getParameter("id"));
		st1.executeUpdate();
		cn.close();
		response.sendRedirect("sevent.jsp");
	}
	
	else
	{
	PreparedStatement st1=cn.prepareStatement("insert into feedback(eid,email,score) values(?,?,?)");
	st1.setString(1,request.getParameter("id"));
	st1.setString(2,session.getAttribute("email").toString());
	st1.setString(3,request.getParameter("feedback"));
	st1.executeUpdate();
	cn.close();
	response.sendRedirect("sevent.jsp");
	}
	
}
catch(Exception e)
{
	}
%>
</body>
</html>