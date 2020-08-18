<%@ page import="java.io.*" import="java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
	<div class="panel" >
	<div class="panel-header"><h3><center>Login</center></h3></div>
	<hr style="color:white">
	<div class="panel-body" ">
	<form action="logins.jsp">
Email:<br><input type="email" name="email"><br>
Password:<br>
<input type="password" name="password">
<%
String str="ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
String value="";
for(int i=0;i<6;i++)
{
	Random rand=new Random();
	
	int as=rand.nextInt(60);
	value=value+str.charAt(as);
	
}
%>
<br>
Enter the Captcha:<br>
<input type="text" name="captchad"> <b><input class="cap" type="text" name="captcha" value=<%=value%> readonly="readonly" ></input></b><br>
<%
								if(request.getParameter("error1")==null)
								{}
								else
								{
									PrintWriter pw=response.getWriter();%>
									<h5 style="color:red;"><%= request.getParameter("error1") %></h5><br>
							<%		
								}
							%>
							<br><br>
<button class="btn btn-primary">Login</button>

<%
								if(request.getParameter("error")==null)
								{}
								else
								{
									PrintWriter pw=response.getWriter();%>
									<h5 style="color:red;"><%= request.getParameter("error") %></h5><br>
							<%		
								}
							%>
							
<%
								if(request.getParameter("error6")==null)
								{}
								else
								{
									PrintWriter pw=response.getWriter();%>
									<h5 style="color:red;"><%= request.getParameter("error6") %></h5><br>
							<%		
								}
							%>			
							
											
</form>
<br>
<a href="forgotpassword.jsp"><Button class="btn btn-danger">Forgot Password</Button></a>
<br>
<a href="signup.jsp">Not Registered yet? Signup here!</a>
			</div>
	</div>
	</div>
	</div>		
		
</body>
</html>	