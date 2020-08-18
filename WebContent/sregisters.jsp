<%@ page language="java" import="java.util.*" import="java.sql.*" import="java.io.*" contentType="text/html; charset=ISO-8859-1"
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
	String email=session.getAttribute("email").toString();
	String eid=request.getParameter("id");
	PreparedStatement st0 = cn.prepareStatement("select rid from registration where eid=? and email=?");
	st0.setString(1,eid);
	st0.setString(2,email);
	ResultSet rs0 = st0.executeQuery();
	%>
	<%=eid %>
	<%
	if(rs0.next())
		{
		response.sendRedirect("sevent.jsp?error= Already Registered!!");
		cn.close();
		}
	else
	{
		PreparedStatement st1=cn.prepareStatement("insert into registration(eid,email) values(?,?)");
		st1.setString(1,eid);
		st1.setString(2,email);
		st1.executeUpdate();
		response.sendRedirect("sevent.jsp");
		cn.close();
	}
	cn.close();
	
	
}

catch(Exception e)
{
	
}
%>
</body>
</html>