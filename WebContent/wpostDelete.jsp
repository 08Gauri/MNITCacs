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
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
		String wid=request.getParameter("wid");
		PreparedStatement st1=cn.prepareStatement("delete from wpost where wid=?");
		st1.setString(1,wid);
		st1.executeUpdate();
		cn.close();
		response.sendRedirect("fwelcome.jsp");
%>
</body>
</html>