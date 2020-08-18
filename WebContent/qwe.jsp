<%@ page import="java.sql.*" import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=pucchi143");
PreparedStatement st1=cn.prepareStatement("select socid from society where sname=?");
st1.setString(1,request.getParameter("val"));
ResultSet rs1=st1.executeQuery();
if(rs1.next())
{
String socid=rs1.getString(1);
PreparedStatement st=cn.prepareStatement("select name,email,contact1 from users where socid=? and type=?");
st.setString(1, request.getParameter(socid));
st.setString(2, request.getParameter("as"));
ResultSet rs=st.executeQuery();

while(rs.next())
{
	String s = "         ";
String str1=rs.getString(1);	
String str2=rs.getString(2);
String str3=rs.getString(3);
PrintWriter pw=response.getWriter();
out.println(str1+"(");
out.println(str2+")  ->");
out.println(str3);
}
}
else
{
		
}
cn.close();


%>
</body>
</html>
