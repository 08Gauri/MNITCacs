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
	Connection cnn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=pucchi143");
	PreparedStatement st=cnn.prepareStatement("select * from society");
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{
		%>
		<a href="gallery.jsp?socid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a><br>
		<%
	}
}
catch(Exception e)
{}
%>

</body>
</html>