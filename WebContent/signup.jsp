<%@ page import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
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
	<div class="navbar" id="myNavbar">
		<a href="index.jsp" class="navbar-brand">
			<div class="logo">
				<img src="images/logo.png" style="height: 30px;">MNIT-CACS <span
					class="glyphicon glyphicon-copyright-mark"></span>
			</div>
		</a>


		<ul class="nav navbar-nav navbar-right">
		<li><a href="sponsership.jsp">Sponsership
		</a></li>
			<li><a href="contact.jsp">Contact </a></li>
			<li><a href="login.jsp">Login<span
					class="glyphicon glyphicon-log-in"></span>
			</a></li>
			<li><a href="signup.jsp">Sign up<span
					class="glyphicon glyphicon-user"></span>
			</a></li>
		</ul>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<div class="panel">
					<div class="panel-header">
						<b><center><h2>Sign Up Here</h2></center></b>
						<hr style="color:white">
					</div>
					<div class=" panel-body">
						<form name="form" action="signups.jsp" method="get">
							User name: <br>
							<input type="text" name="name">
						
							<br> 
							Email Id: <br>
							<input type="email" name="email">
							<%
		if (request.getParameter("error1") == null) {
		} else {
			PrintWriter pw = response.getWriter();
			String error = request.getParameter("error1").toString();
			
			
			%>
			<h5 style="color:red;"><%= request.getParameter("error1") %></h5><%} %>	
							<%
		if (request.getParameter("error4") == null) {
		} else {
			PrintWriter pw = response.getWriter();
			String error = request.getParameter("error4").toString();
			
			
			%>
			<h5 style="color:red;"><%= request.getParameter("error4") %></h5><%} %>
							<br> 
							Password: <br>
							<input type="password" name="password">
							<%
							if (request.getParameter("error2") == null) {
		} else {
			PrintWriter pw = response.getWriter();
			String error = request.getParameter("error2").toString();
			%>
			<h5 style="color:red;"><%= request.getParameter("error2") %></h5><%} %>
								
							<br> 
							Enter Password Again: <br>
							<input type="password" name="repassword">
							<%
				if (request.getParameter("error3") == null) {
		} else {
			PrintWriter pw = response.getWriter();
			String error = request.getParameter("error3").toString();
			%>
			<h5 style="color:red;"><%= request.getParameter("error3") %></h5><%} %>				
							<br>
							Society: <br>
							<select name="society" style="color:black;">
							<option>Select</option>
							<option>Music Society</option>
							<option>Litsoc</option>
							<option>Dramatics</option>
							<option>NSS</option>
							<option>Energy Club</option>
							<option>Rotract</option>
							<option>Film And Photography</option>
							<option>Alcom</option>
							<option>Technical Society</option>	
							</select><br>
							Department: <br>
							<select name="dept" >
							<option>Select</option>
							<option>Computer Science</option>
							<option>Electronics Engineering</option>
							<option>Electrical Engineering</option>
							<option>Civil Engineering</option>
							<option>Mechanical Engineering</option>
							<option>Chemical Engineering</option>
							<option>Metallurgy and Materials Science</option>
							<option>Architecture</option>
							<option>Physics</option>
							<option>Chemistry</option>
							<option>Mathematics</option>
							<option>Humanities</option>	
							</select><br>
							Year: <br>
							<select name="year" >
							<option>Select</option>
							<option>First</option>
							<option>Second</option>
							<option>Third</option>
							<option>Fourth</option>
							<option>Fifth</option>
							<option>NA</option>
							</select>
							<br>
							Contact No: <br>
							<input type="text" name="contact1"><br>
							Alternate Contact No(optional): <br>
							<input type="text" name="contact2"><br> 
							Type: <br>
							<select name="type" >
							<option>Select</option>
							<option>Student</option>
							<option>Faculty</option><br>
							<option>Student Coordinator</option><br>
							</select>
							<br>
							<br>
							<button id="signup" class="btn btn-danger">Sign Up</button>
							
							<a href="login.jsp">Already Registered? Login here!</a>
							<%
				if (request.getParameter("error5") == null) {
		} else {
			PrintWriter pw = response.getWriter();
			String error = request.getParameter("error5").toString();
			%>
			<h5 style="color:red;"><%= request.getParameter("error5") %></h5><%} %>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	



</body>
</html>