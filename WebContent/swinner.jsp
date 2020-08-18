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
	PreparedStatement st1=cn.prepareStatement("select rid from registration where eid=? and email=?");
	String st4=request.getParameter("eid");
	String st3=request.getParameter("desc");
	st1.setString(1,request.getParameter("eid"));
	st1.setString(2,request.getParameter("swinner"));
	ResultSet rs1=st1.executeQuery();
	rs1.next();
	String rid=rs1.getString(1);
	PreparedStatement st2=cn.prepareStatement("insert into sposition(rid) values(?)");
	st2.setString(1,rid);
	st2.executeUpdate();
	response.sendRedirect("pdescribe.jsp?id=st4&desc=st3");
	cn.close();
}
catch(Exception e)
{}
%>
</body>
</html>