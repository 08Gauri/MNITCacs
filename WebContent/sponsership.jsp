<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	<div class="navbar" id="myNavbar">
		<a href="index.jsp" class="navbar-brand">
			<div class="logo">
				<img src="images/logo.png" style="height: 30px;">&nbsp
				MNIT-CACS <span class="glyphicon glyphicon-copyright-mark"></span>
			</div>
		</a>


		<ul class="nav navbar-nav navbar-right">
		<li><a href="sponsership.jsp">Sponsership
		</a></li>
			<li><a href="contact.jsp">Contact </a></li>
			<li><a href="#aboutCACS">About CACS </a></li>
			<li><a href="login.jsp">Login<span
					class="glyphicon glyphicon-log-in"></span>
			</a></li>
			<li><a href="signup.jsp">Sign up<span
					class="glyphicon glyphicon-user"></span>
			</a></li>
		</ul>
	</div>
	<marquee scrollamount="3">
		<p
			style="color: white; font-size: 14px; background-color: rgba(0, 0, 0, 0.8);">
			<img src="images/new.gif" style="height: 22px;">Registration
			open || New user can register now || Last date of registration is December 31st,2018 || In case of
			any issue, contact Student Welfare.
		</p>
	</marquee>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-6 col-md-offset-3">
	<div class="panel">
	<div class="panel-heading">
	<h3><center>Sponser</center></h3>
	</div>
	<div class="panel-body">
	
<form action="asd1">
	Email :<br> <input type=email name=email><br>
	Name :<br> <input type=text name=name><br>
	Contact number :<br> <input type=text name=contact><br>
	Enter Required details :<br> <textarea rows="20" cols="20" name=msg style="width:500px;color:black;"></textarea><br>
	Enter Interested Society :<br> <select name=society>
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
	</select><br><br>
	<input type=submit value="sponser">
</form>
</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>