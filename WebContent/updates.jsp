<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN AND SIGNUP</title>
</head>
<body>


<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
		PreparedStatement st=cn.prepareStatement("select * from users where email=?");
		st.setString(1,session.getAttribute("email").toString());
		ResultSet rs=st.executeQuery();
		rs.next();
		String op=rs.getString(3);
		String oldpassword=request.getParameter("oldpassword");
		String password = request.getParameter("password");
		String repassword=request.getParameter("repassword");
		
		
		
		if(oldpassword.equals(op)){
			PreparedStatement st1=cn.prepareStatement("update users set password = ? where email=?");
			
			st1.setString(1,request.getParameter("password"));
			st1.setString(2,session.getAttribute("email").toString());
			
			
			st1.executeUpdate();
			response.sendRedirect("profile.jsp");
			cn.close();
		}
		else
		{	
	
					response.sendRedirect("update.jsp?error=!! passwords do not  match !!");
			cn.close();
		}
	}


	catch(Exception e)
	{
		
	}
%>


</body>
</html>