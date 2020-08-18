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
		
		PreparedStatement st0 = cn.prepareStatement("select email from users where socid in(select socid from users where email = ?)");
		st0.setString(1, session.getAttribute("email").toString());
		ResultSet rs0 = st0.executeQuery();
		while(rs0.next())
		{
			String email = rs0.getString(1);
			if(request.getParameter(email)!=null)
			{
				%>
				<%=email %>
				<%
				PreparedStatement st=cn.prepareStatement("update attendance set counts = counts+1 where email = ?");
				st.setString(1,request.getParameter("email"));
				st.executeUpdate();
			}
		}
		
		
		
		
		response.sendRedirect("attendance.jsp");
		//cn1.close();
		cn.close();
		}


	catch(Exception e)
	{
		
	}
%>


</body>
</html>