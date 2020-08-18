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
Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
PreparedStatement st1=cn.prepareStatement("select * from users where email=?");
st1.setString(1,session.getAttribute("email").toString());
ResultSet rs1=st1.executeQuery();
rs1.next();
String Name=rs1.getString(1);
String Socid=rs1.getString(5);
String Type = rs1.getString(9);
if(session.getAttribute("email")==null)
{
	response.sendRedirect("loginj.jsp?error=session_timed_out");
}
else
{
%>
	<div class="navbar" id="myNavbar">
		<a href="index.jsp" class="navbar-brand">
			<div class="logo">
				<img src="images/logo.png" style="height: 30px;">&nbsp
				MNIT-CACS <span class="glyphicon glyphicon-copyright-mark"></span>
			</div>
		</a>


<%
}
%>


		<ul class="nav navbar-nav navbar-right">
		<% 
		String redirect="";
		if(Type.equals("Faculty"))
			redirect=  "fwelcome.jsp";
			else if(Type.equals("Student"))
				redirect=  "swelcome.jsp";
				else if(Type.equals("Student Coordinator"))
				redirect=  "fwelcome.jsp";
		%>
		<li>WELCOME <%=Name%></li>
		<li><a href="<%= redirect %>">Home<span
					class="glyphicon glyphicon-home"></span></a></li>
			<li><a href="gallery.jsp">Gallery<span
					class="glyphicon glyphicon-camera"></span></a></li>
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





<div class="col-md-offset-5">

</div>



<div col="container-fluid">
<div class="row" style="font-size:30px;">
<b>
<div class="col-md-3">
NAME
</div>
<div class="col-md-3">
EMAIL
</div>
<div class="col-md-3">
PRESENT
</div>
</b>
</div>
</div>
<form action="attendances.jsp">
<%

Class.forName("com.mysql.jdbc.Driver");
Connection cnn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
PreparedStatement st=cnn.prepareStatement("select name,email,dept from users where socid in(select socid from users where email=?) and type!=?");
st.setString(1,session.getAttribute("email").toString());
st.setString(2,"Faculty");
ResultSet rs=st.executeQuery();
while(rs.next())
{
	%>
	

<input type="email" value = "<%=rs.getString(2)%>">

<input type="name" value = "<%=rs.getString(1)%>">
<input type="radio" name="<%= rs.getString(2) %>" value = "<%= rs.getString(2) %>"><br>


	<% 	
}
cnn.close();

%>
<input type="submit" value= "Mark Present">
</form>
</body>
</html>