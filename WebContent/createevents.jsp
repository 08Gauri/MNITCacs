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
		PreparedStatement st1=cn.prepareStatement("insert into event(ename,edate,socid,description) values(?,?,?,?)");
		st1.setString(1,request.getParameter("ename"));
		String date=request.getParameter("year")+request.getParameter("month")+request.getParameter("date");
		st1.setString(2,date);
		String email=session.getAttribute("email").toString();
		PreparedStatement st2=cn.prepareStatement("select socid from users where email=?");
		st2.setString(1,email);
		ResultSet rs1=st2.executeQuery();
		rs1.next();
		String socid=rs1.getString(1);
		st1.setString(3,socid);
		st1.setString(4,request.getParameter("description"));
		st1.executeUpdate();
		cn.close();
		response.sendRedirect("fwelcome.jsp");
	}
	catch(Exception e)
{
		}
%>
</body>
</html>