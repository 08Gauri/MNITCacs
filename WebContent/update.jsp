<%@ page import="java.sql.*" import="java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Acme|Charmonman|Dancing+Script|Pacifico"
	rel="stylesheet">
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
String Type = rs.getString(9);

if(session.getAttribute("email")==null)
{
	response.sendRedirect("loginj.jsp?error=session_timed_out");
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






<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<div class="panel">
					<div class="panel-header"><center>
						<h3>Update Password</h3></center>
						<hr>
					</div>
					<div class="panel-body">
						<form action="updates.jsp" method="get">
							Old Password: <br>
							<input type="password" name="oldpassword" >
						
							<br> 
							New Password: <br>
							<input type="password" name="password" >
							<br>
							
							Enter new password Again: <br>
							<input name="repassword" type="password">
							<br>
							<br>
							<button class="btn btn-danger">Update</button>
							<br>
					</form>
					</div>
				</div>
				<%
								if(request.getParameter("error")==null)
								{}
								else
								{
								%>
									<h5 style="color:red;"><%= request.getParameter("error") %></h5><br>
							<%		
								}
							%>
			</div>
		</div>
	</div>
</body>
</html>