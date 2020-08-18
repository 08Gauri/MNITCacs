<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>

</head>
<body>
	<div class="navbar" id="myNavbar">
		<a href="index.jsp" class="navbar-brand">
			<div class="logo">
				<img src="images/logo.png" style="height: 30px;">&nbsp MNIT-CACS <span
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
	<div class="text-center">
	
	<form action="contact.jsp">
	Society:
							<select name="society">
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
							<br>
							</select >
							Type: 
							<select name="type">
							<option>Select</option>
							<option>Student</option>
							<option>Faculty</option>
							<option>Student Coordinator</option>
							</select>
							<button class="btn ">SEARCH</button>

								</form>
								<br><br><br>		
<center>
<table class="table table-bordered" style="width:600px;">
<tr>
	<th>NAME</th>
	<th>EMAIL</th>
	<th>CONTACT</th>
</tr>	
	<%
Class.forName("com.mysql.jdbc.Driver");
Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
PreparedStatement st1=cn.prepareStatement("select socid from society where sname=?");
st1.setString(1,request.getParameter("society"));

ResultSet rs1=st1.executeQuery();
if(rs1.next())
{

String socid=rs1.getString(1);
PreparedStatement st=cn.prepareStatement("select name,email,contact1 from users where socid=? and type=?");
st.setString(1,socid);
st.setString(2, request.getParameter("type"));
ResultSet rs=st.executeQuery();

while(rs.next())
{

String str1=rs.getString(1);	
String str2=rs.getString(2);
String str3=rs.getString(3);
%><tr>

<td><%=str1 %></td><td><%=str2 %></td><td><%=str3 %></td>
							
							</tr>	

<%
}
}
else
{
		
}
cn.close();


%>
		</table>					
	</div>											
</body>
</html>