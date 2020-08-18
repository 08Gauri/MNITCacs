<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.SimpleDateFormat" import="java.util.Date" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://fonts.googleapis.com/css?family=Mali" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Lobster|Mali|Oswald|Patrick+Hand" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="style/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	function deletes()
	{
		confirm("Are you sure you want to delete this event");
	}
</script>
<title>MNIT-CACS</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection cnn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
PreparedStatement st=cnn.prepareStatement("select * from users where email=?");
st.setString(1,session.getAttribute("email").toString());
ResultSet rs=st.executeQuery();
rs.next();
String Name=rs.getString(1);
String Society=rs.getString(5);
if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp?error=session_timed_out");
}
else
{}
%>
	<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
PreparedStatement state=con.prepareStatement("select * from users where email=?");
state.setString(1,session.getAttribute("email").toString());
ResultSet rset = state.executeQuery();
rset.next();
String Email = session.getAttribute("email").toString();
String ty = rset.getString(9);
String SoCid=rset.getString(4);
String NAME=rset.getString(1);
PreparedStatement state2=con.prepareStatement("select sname from society where socid=?");
state2.setString(1,SoCid);
ResultSet rset1 = state2.executeQuery();
rset1.next();
String SocName = rset1.getString(1);
con.close();
%>

	<div class="navbar" id="myNavbar">
	<ul class="nav navbar-nav navbar-left">
	<li>
		<%
			if(ty.equals("Faculty"))
			{
				%>
		<a href="fwelcome.jsp">WELCOME &nbsp  <%=NAME %>
		(<%=SocName %>)
		</a>				
		
<%} 
			else if(ty.equals("Student"))
			{
				%>
		<a href="swelcome.jsp">WELCOME &nbsp  <%=NAME %>
		(<%=SocName %>)
		</a>				
<%}
			else if(ty.equals("Student Coordinator"))
			{
				%>
		<a href="fwelcome.jsp">WELCOME &nbsp <%=NAME %>
		(<%=SocName %>)
		</a>				
<%}		
%>

</li>	
</ul>
	



		<ul class="nav navbar-nav navbar-right">
		<li><a href="gallery.jsp?socid=<%=SoCid%>">Gallery<span
					class="glyphicon glyphicon-camera"></span></a></li>
					<li>
					<%
			if(ty.equals("Faculty"))
			{
				%>
				
		<a href="sponsers.jsp">Sponsers
		</a>				
		
<%} 
			
			else if(ty.equals("Student Coordinator"))
			{
				%>
				
		<a href="sponsers.jsp">Sponsers
		</a>
		</li>		
					<li>
					<%}
			if(ty.equals("Faculty"))
			{
				%>
		<a href="createevent.jsp">Create Event>
		</a>				
		
<%} 
			else if(ty.equals("Student"))
			{
				%>
		<a href="yourEvent.jsp">Your Events
		</a>				
<%}
			else if(ty.equals("Student Coordinator"))
			{
				%>
		<a href="createevent.jsp">Create Event
		</a>
		</li>				
<%}		
%>
					<li>
			<%
			if(ty.equals("Faculty"))
			{
				%>
		<a href="event.jsp">Events
		</a>				
		
<%} 
			else if(ty.equals("Student"))
			{
				%>
		<a href="sevent.jsp">Events
		</a>				
<%}
			else if(ty.equals("Student Coordinator"))
			{
				%>
		<a href="event.jsp">Events
		</a></li>
			<%} %>
			
			
			
			<li><a href="studentlist.jsp">Student List
			</a></li>
			<li><a href="update.jsp">Change Password
			</a></li>
			<li><a href="profile.jsp">Profile<span
					class="glyphicon glyphicon-user"></span>
			</a></li>
			<li><a href="logouts.jsp">Logout<span
					class="glyphicon glyphicon-log-out"></span>
			</a></li>
			
		</ul>
	</div>
	<marquee>
		<p
			style="color: white; font-size: 14px; background-color: rgba(0, 0, 0, 0.8);">
			<img src="images/new.gif" style="height: 22px;">Registration
			open || New user can register now || Profile update option is now
			open || Last date of registration is December 31st,2018 || In case of
			any issue, contact Student Welfare.
		</p>
	</marquee>

<br><br>
<% 
String pattern = "yyyyMMdd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
String date = simpleDateFormat.format(new Date());
//System.out.println(date);
int currdate=Integer.parseInt(date);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
	String email=session.getAttribute("email").toString();
	PreparedStatement st2=cn.prepareStatement("select socid from users where email=?");
	st2.setString(1,email);
	ResultSet rs2=st2.executeQuery();
	rs2.next();
	String socid=rs2.getString(1);
	PreparedStatement st1=cn.prepareStatement("select * from event where socid=? order by edate desc");
	PreparedStatement st4=cn.prepareStatement("select * from event where socid=? order by edate desc");
	st1.setString(1,socid);
	st4.setString(1,socid);
	ResultSet rs1=st1.executeQuery();
	ArrayList<String> upcoming=new ArrayList<String>();
	ArrayList<String> today=new ArrayList<String>();
	ArrayList<String> past=new ArrayList<String>();
	%>
	<h3 style="margin-left:275px;font-family: 'Lobster', cursive;font-size:35px;">Upcoming Events</h3><br>
	<center>
	<table class="table table-bordered" style="width:800px;color:white;">
	<tr>
	<th>Event Name</th>
	<th>Event Date</th>
	<th>Registered Students</th>
	<th>Delete</th>
	<th>Update</th>
	</tr>
	<%
	int j=0;
	
	while(rs1.next())
	{
		
	if(currdate<Integer.parseInt(rs1.getString(3)))
	{
			upcoming.add(rs1.getString(1));
			String eid=rs1.getString(1);
			String name=rs1.getString(2);
			String description=rs1.getString(5);
			String dte=rs1.getString(3);
			String fdate=dte.charAt(6)+dte.charAt(7)+"-"+dte.charAt(4)+dte.charAt(5)+"-"+dte.charAt(0)+dte.charAt(1)+dte.charAt(2)+dte.charAt(3);
			%>
			
			<tr>
			<td><a href="utdescribe.jsp?desc=<%=description%>" style="color:white;"><b><%=name %></b></a></td>
			<td><%=dte.charAt(6) %><%=dte.charAt(7) %>-<%=dte.charAt(4) %><%=dte.charAt(5) %>-<%=dte.charAt(0) %><%=dte.charAt(1) %><%=dte.charAt(2) %><%=dte.charAt(3) %></td>
			<td><a href="registered.jsp?id=<%=eid %>" target="_blank" style="color:white;">Registration</a></td>
			<% %>
			<td><a href="delevents.jsp?id=<%=eid %>" style="color:white;"> <Button class="btn btn-danger" id="btn1" onclick="deletes();">Delete</Button></a></td>
			<td><a href="updateevents.jsp?id=<%=eid %>" style="color:white;"> <Button  class="btn btn-warning" id="btn2">Update</Button></a></td><br>
			</tr>			
			<%
	}
	}

	%>
	</table>
	</center>
	<hr>
	
	<h3 style="margin-left:275px;font-family: 'Lobster', cursive;font-size:35px;">Today's Event</h3><br>
	<center>
	<table class="table table-bordered" style="width:800px;color:white;">
	<tr>
	<th>Event Name</th>
	<th>Event Date</th>
	<th>Registered Students</th>
	
	</tr>
	<%
	PreparedStatement st3=cn.prepareStatement("select * from event where socid=? order by edate desc");
	st3.setString(1,socid);
	rs1=st3.executeQuery();
	while(rs1.next())
		{
		
		if(currdate==Integer.parseInt(rs1.getString(3))) 
		{
			today.add(rs1.getString(1));
			String eid=rs1.getString(1);
			String name=rs1.getString(2);
			String description=rs1.getString(5);
			String dte=rs1.getString(3);
			String fdate=dte.charAt(6)+dte.charAt(7)+"-"+dte.charAt(4)+dte.charAt(5)+"-"+dte.charAt(0)+dte.charAt(1)+dte.charAt(2)+dte.charAt(3);
			%>	
			<tr>
			<td><a href="utdescribe.jsp?desc=<%=description%>" style="color:white;"><b><%=name %></b></a></td>
			<td><%=dte.charAt(6) %><%=dte.charAt(7) %>-<%=dte.charAt(4) %><%=dte.charAt(5) %>-<%=dte.charAt(0) %><%=dte.charAt(1) %><%=dte.charAt(2) %><%=dte.charAt(3) %></td>
			<td><a href="registered.jsp?id=<%=eid %>" style="color:white;">Registeration</a><br></td>
			</tr>
			<%
		}
		}	
	%>
	</table>
	</center>
	<hr>
	<h3 style="margin-left:275px;font-family: 'Lobster', cursive;font-size:35px;">Past Events</h3><br>
	<center>
	<table class="table table-bordered" style="width:800px;color:white;">
	<tr>
	<th>Event Name</th>
	<th>Event Date</th>
	<th>Registered Students</th>
	</tr>
	<%
	rs1=st4.executeQuery();
	while(rs1.next())
		{
		if(currdate>Integer.parseInt(rs1.getString(3)))
		{
			past.add(rs1.getString(1));
			String eid=rs1.getString(1);
			String name=rs1.getString(2);
			String description=rs1.getString(5);
			String dte=rs1.getString(3);
			String fdate=dte.charAt(6)+dte.charAt(7)+"-"+dte.charAt(4)+dte.charAt(5)+"-"+dte.charAt(0)+dte.charAt(1)+dte.charAt(2)+dte.charAt(3);
			%>
			<tr>
			<td><a href="pdescribe.jsp?id=<%=eid%>" style="color:white;"><b><%=name%></b></a></td>
			<td><%=dte.charAt(6) %><%=dte.charAt(7) %>-<%=dte.charAt(4) %><%=dte.charAt(5) %>-<%=dte.charAt(0) %><%=dte.charAt(1) %><%=dte.charAt(2) %><%=dte.charAt(3) %></td>
			<td><a href="feedback.jsp?id=<%=eid %>" style="color:white;">FeedBack</a><br></td>
			</tr>
			<%
		}
		}	
	
	cn.close();
	
}
catch(Exception e)
{
	
}
finally{}
%>
</table>
</center>

</body>
</html>