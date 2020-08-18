<%@ page import="java.io.*" import="java.sql.*" import="java.util.Date" language="java" contentType="text/html; charset=ISO-8859-1"
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
if(request.getParameter("privacy").equals("Select")==false && request.getParameter("msg").equals("")==false)
{
		
		PreparedStatement st=cn.prepareStatement("select name from users where email=?");
		st.setString(1,session.getAttribute("email").toString());
		ResultSet rs=st.executeQuery();
		rs.next();
		String name=rs.getString(1);
		PreparedStatement stt=cn.prepareStatement("insert into wpost(sender,msg,dop,email,privacy) values(?,?,?,?,?)");
		stt.setString(1,name);
		stt.setString(2,request.getParameter("msg"));
		stt.setString(3,new Date().toString());
		stt.setString(4,session.getAttribute("email").toString());
		stt.setString(5,request.getParameter("privacy"));
		stt.executeUpdate();
		cn.close();
		response.sendRedirect("fwelcome.jsp");	
}		
		
		
else
	{
	if( request.getParameter("msg").equals(""))
	{
		response.sendRedirect("fwelcome.jsp?error1=PLEASE ENTER A MESSAGE");
	}
	else if(request.getParameter("privacy").equals("Select"))
		{
			response.sendRedirect("fwelcome.jsp?error=SELECT PRIVACY");
		}
		
		cn.close();
	}
	%>
</body>
</html>