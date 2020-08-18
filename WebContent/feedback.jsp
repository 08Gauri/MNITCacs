<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="3;url=event.jsp">
<title>Insert title here</title>
</head>
<body>
<h2>
<% 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
	PreparedStatement st1=cn.prepareStatement("select avg(score) from feedback where eid=?");
	st1.setString(1,request.getParameter("id"));
	ResultSet rs=st1.executeQuery();
	rs.next();
	 int avg=rs.getInt(1);
	%>
	<%=avg %>/10
	<%
}
catch(Exception e)
{}
%>
</h2>
<h3>Redirecting....</h3>
</body>
</html>