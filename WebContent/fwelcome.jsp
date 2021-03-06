<%@ page import="java.sql.*" import="java.util.*" import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
String Socid=rs.getString(4);

PreparedStatement st11=cnn.prepareStatement("select sname from society where socid=?");
st11.setString(1,Socid);
ResultSet rs11=st11.executeQuery();
rs11.next();

if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp?error5=session_timed_out");
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









<div class="conatiner-fluid">
<div class="row">
<div class="col-md-3 col-md-offset-5">
<form name="imageUpload" action="fwelcome.jsp" method="post" enctype="multipart/form-data">

<%
		String saveFile =  new String();
		String contentType=request.getContentType();
		if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0))
		{
			DataInputStream in = new DataInputStream(request.getInputStream());
			int formDataLength=request.getContentLength();
			byte dataBytes[]=new byte[formDataLength];
			int byteRead=0;
			int totalBytesRead=0;
			
			while(totalBytesRead<formDataLength)
			{
				byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
				totalBytesRead+=byteRead;
			}
			
			String file=new String(dataBytes);
			saveFile=file.substring(file.indexOf("filename=\"")+10);
			saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
			saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
			
			int lastIndex=contentType.lastIndexOf("=");
			
			String boundary = contentType.substring(lastIndex+1,contentType.length());
			
			int pos;
			
			pos=file.indexOf("filename=\"");
			pos=file.indexOf("\n",pos)+1;
			pos=file.indexOf("\n",pos)+1;
			pos=file.indexOf("\n",pos)+1;
			
			int boundaryLocation =file.indexOf(boundary,pos)-4;
			
			int startPos=((file.substring(0,pos)).getBytes()).length;
			int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
			
			saveFile="C:\\Users\\Kartikeya\\workspace\\MnitCACS\\WebContent\\images\\"+SoCid+"\\"+saveFile;
			
			File ff=new File(saveFile);
			try
			{
				FileOutputStream fileOut=new FileOutputStream(ff);
				fileOut.write(dataBytes,startPos,(endPos-startPos));
				fileOut.flush();
				fileOut.close();
			}
			
			catch(Exception e)
			{
				out.println(e);
				
			}		
			
		}
%>
<button type="submit" value="Upload Pic" name="submit" ><span class="glyphicon glyphicon-camera" style="width:40px;"></span></button>

<input type="file" name = "file" style="background-color:white;">


</form>
</div>
</div>
</div>



<form action="wposts.jsp">
<center>
<div class="col-md-1 col-md-offset-2">
<select name="privacy" >
							<option>Select</option>
							<option>User All</option>
							<option>Society Members</option>	
							<option>Society Coordinators</option>
				</select>
</div>					
<br><br>	
				<%
								if(request.getParameter("error")==null)
								{}
								else
								{
									PrintWriter pw=response.getWriter();%>
									<h5 style="color:black;"><%= request.getParameter("error") %></h5><br>
							<%		
								}
							%>
<%
								if(request.getParameter("error1")==null)
								{}
								else
								{
									PrintWriter pw=response.getWriter();%>
									<h5 style="color:black;"><%= request.getParameter("error1") %></h5><br>
							<%		
								}
							%>
<textarea name="msg" row="200" column="500" style="background-color:rgba(0,0,0,0.7); color:white"></textarea>



<br>
<div class="col-md-1 col-md-offset-9">
<input type="submit" value="Post" style="width:90px;">

</div>


</form>

</center>
<br><br>
<center>

	<h3>My Posts:</h3>
<table class="table table-bordered" style="width:800px;">
<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
	PreparedStatement stat = cn.prepareStatement("select * from wpost where email = ? order by wid desc");
	stat.setString(1,session.getAttribute("email").toString());
	ResultSet result = stat.executeQuery();
	while(result.next())
	{
		ArrayList<String> all=new ArrayList<String>();
		if(result.getString(6).equals("User All"))
		{
					PreparedStatement sat1=cn.prepareStatement("select email from users");
					ResultSet ras2=sat1.executeQuery();
					while(ras2.next())
					{
						all.add(ras2.getString(1));
					}
		}
		else if(result.getString(6).equals("Society Members"))
		{
			PreparedStatement sat2=cn.prepareStatement("select email from users where socid in (select socid from users where email=?)");
			sat2.setString(1,result.getString(3));
			ResultSet ras3=sat2.executeQuery();
			while(ras3.next())
			{
				all.add(ras3.getString(1));
			}
		}
		
		else if(result.getString(6).equals("Society Coordinators"))
		{
			PreparedStatement sat3=cn.prepareStatement("select email from users where type=? or type=? and socid in (select socid from users where email=?)");
			sat3.setString(1,"Student Coordinator");
			sat3.setString(2,"Faculty");
			sat3.setString(3,result.getString(3));
			ResultSet ras4=sat3.executeQuery();
			while(ras4.next())
			{
				all.add(ras4.getString(1));
			}
		}
		
		//display of wallpost on screen
		PreparedStatement sat4=cn.prepareStatement("select sname from society where socid in(select socid from users where email=?)");
		sat4.setString(1,result.getString(3));
		ResultSet ras5=sat4.executeQuery();
		ras5.next();
		String soc=ras5.getString(1);
			String email=result.getString(3);
			String send=result.getString(2);
			String msg=result.getString(4);
			String dop=result.getString(5);
			
			if(all.contains(rs.getString(2)))
			{
	%>
		
		
		<tr>
		
		<td class="col-md-2 col-md-offset-2"><b><%=send %></b><br><%=email %><br><%=dop %><br><%=soc %> </td>
		<td class="col-md-6 " style="background-color:rgba(255,255,255,0.2);"><b><%=msg %> </b></td>
		<td><button class="btn btn-warning"><a href="wpostUpdate.jsp?wid=<%=result.getString(1) %>" style="color:white;">Update</a></button>
		<td><button class="btn btn-danger"><a href="wpostDelete.jsp?wid=<%=result.getString(1) %>" style="color:white;">Delete</a></button>
		</tr>
		
		
		
		
		
		
		
		
	<%
			}	
	}
	%>
	</table>
	<h3>All Posts:</h3>
	<table class="table table-bordered" style="width:800px;">
	<%
	PreparedStatement stt=cn.prepareStatement("select * from wpost order by wid desc");
	ResultSet rs1=stt.executeQuery();
	while(rs1.next())
	{
		ArrayList<String> all=new ArrayList<String>();
		if(rs1.getString(6).equals("User All"))
		{
					PreparedStatement st1=cn.prepareStatement("select email from users");
					ResultSet rs2=st1.executeQuery();
					while(rs2.next())
					{
						all.add(rs2.getString(1));
					}
		}
		else if(rs1.getString(6).equals("Society Members"))
		{
			PreparedStatement st2=cn.prepareStatement("select email from users where socid in (select socid from users where email=?)");
			st2.setString(1,rs1.getString(3));
			ResultSet rs3=st2.executeQuery();
			while(rs3.next())
			{
				all.add(rs3.getString(1));
			}
		}
		
		else if(rs1.getString(6).equals("Society Coordinators"))
		{
			PreparedStatement st3=cn.prepareStatement("select email from users where type=? or type=? and socid in (select socid from users where email=?)");
			st3.setString(1,"Student Coordinator");
			st3.setString(2,"Faculty");
			st3.setString(3,rs1.getString(3));
			ResultSet rs4=st3.executeQuery();
			while(rs4.next())
			{
				all.add(rs4.getString(1));
			}
		}
		
		//display of wallpost on screen
		PreparedStatement st4=cn.prepareStatement("select sname from society where socid in(select socid from users where email=?)");
		st4.setString(1,rs1.getString(3));
		ResultSet rs5=st4.executeQuery();
		rs5.next();
		String soc=rs5.getString(1);
			String email=rs1.getString(3);
			String send=rs1.getString(2);
			String msg=rs1.getString(4);
			String dop=rs1.getString(5);
			
			if(all.contains(rs.getString(2)))
			{
	%>
		
		
		<tr>
		
		<td class="col-md-2 col-md-offset-2"><b><%=send %></b><br><%=email %><br><%=dop %><br><%=soc %> </td>
		<td class="col-md-6 " style="background-color:rgba(255,255,255,0.2);"><b><%=msg %> </b></td>
		
		</tr>
		
		
		
		
		
		
		
		
	<%
			}
			
		}
	

	cn.close();
%>

</table>
</center>
<br>
</div>


</body>
</html>