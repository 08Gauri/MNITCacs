<%@ page import="java.util.*" import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
	String first=request.getParameter("fwinner");
	String second=request.getParameter("swinner");
	String third=request.getParameter("twinner");
	String eid=request.getParameter("eid");
		List<String> arrf = new ArrayList<String>(Arrays.asList(first.split(",")));
		List<String> arrs = new ArrayList<String>(Arrays.asList(second.split(",")));
		List<String> arrt = new ArrayList<String>(Arrays.asList(third.split(",")));
		
		for(int i=0;i<arrf.size();i++)
		{
			%>
			<%=arrf.size()%>
			<% 
		PreparedStatement st1=cn.prepareStatement("select rid from registration where eid=? and email=?");
		st1.setString(1,eid);
		st1.setString(2,arrf.get(i));
		ResultSet rs1=st1.executeQuery();
		rs1.next();
		String rid=rs1.getString(1);
		PreparedStatement st11=cn.prepareStatement("insert into fposition(rid) values(?)");
		st11.setString(1,rid);
		st11.executeUpdate();
		}
		
		for(int i=0;i<arrs.size();i++)
		{

			%>
			<%=arrs.size()%>
			<% 
		PreparedStatement st1=cn.prepareStatement("select rid from registration where eid=? and email=?");
		st1.setString(1,eid);
		st1.setString(2,arrs.get(i));
		ResultSet rs1=st1.executeQuery();
		rs1.next();
		String rid=rs1.getString(1);
		PreparedStatement st11=cn.prepareStatement("insert into sposition(rid) values(?)");
		st11.setString(1,rid);
		st11.executeUpdate();
		}

		%>
		<%=arrs.size()%>
		<% 
		for(int i=0;i<arrt.size();i++)
		{

			%>
			<%=arrt.size()%>
			<% 
		PreparedStatement st1=cn.prepareStatement("select rid from registration where eid=? and email=?");
		st1.setString(1,eid);
		st1.setString(2,arrt.get(i));
		ResultSet rs1=st1.executeQuery();
		rs1.next();
		String rid=rs1.getString(1);
		PreparedStatement st11=cn.prepareStatement("insert into tposition(rid) values(?)");
		st11.setString(1,rid);
		st11.executeUpdate();
		}
		
		response.sendRedirect("event.jsp");
	
	cn.close();
}
catch(Exception e)
{}
%>
</body>
</html>