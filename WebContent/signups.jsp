<%@ page import="java.util.*" import="java.sql.*" import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN AND SIGNUP</title>
</head>
<body>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
		PreparedStatement st3=cn.prepareStatement("select email from superusers");
		ResultSet rs3=st3.executeQuery();
		
		//Connection cn1=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		String society=request.getParameter("society");
		String dept=request.getParameter("dept");
		String year=request.getParameter("year");
		String contact1=request.getParameter("contact1");
		String contact2=request.getParameter("contact2");
		String type=request.getParameter("type");
		
		
		
		PreparedStatement st1=cn.prepareStatement("select email from users");

		ArrayList<String> arr=new ArrayList<String>();
		ResultSet rs=st1.executeQuery();
		while(rs.next())
		{
			if(email.equals(rs.getString(1)))
			{
				response.sendRedirect("signup.jsp?error4=!! E-Mail ID already exists !!");
			}
		}
		
		
		
		if((email=="")||(name=="")||(password=="")||(repassword=="")||(society=="")||(dept=="")||(year=="")||
				(contact1=="")||(type==""))
		{
			response.sendRedirect("signup.jsp?error5=!! Mandatory fields are empty !!");
		}
		while(rs3.next())
		{
			if(rs3.getString(1).equals(email)==false)
			{
				response.sendRedirect("signup.jsp?error4=!! Unauthorised E-Mail ID !!");
			}
		}
		

		String socid="";
		if(email.endsWith("@mnit.ac.in") && password.length()>=5 && password.equals(repassword)){
			PreparedStatement st2=cn.prepareStatement("select socid from society where sname=?");
			st2.setString(1,society);
			PrintWriter pw=response.getWriter();
			ResultSet rs2=st2.executeQuery();
			if(rs2.next())
			{
				socid = rs2.getString(1);
			}
			%>
			 
			<% 
				PreparedStatement st=cn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
			
			st.setString(1,request.getParameter("name"));
			st.setString(2,request.getParameter("email"));
			st.setString(3,request.getParameter("password"));
			st.setString(4,socid);
			st.setString(5,request.getParameter("dept"));
			st.setString(6,request.getParameter("year"));
			st.setString(7,request.getParameter("contact1"));
			st.setString(8,request.getParameter("contact2"));
			st.setString(9,request.getParameter("type"));
			st.executeUpdate();
			for(int i=0;i<100;i++)
			{
				response.sendRedirect("success.jsp");	
			}
			
			//cn1.close();
			cn.close();
		}
		else
		{	
			if(email.endsWith("@mnit.ac.in")==false)
					response.sendRedirect("signup.jsp?error1=!! E-Mail ID must end with mnit.ac.in !!");
			else if(password.length()<5)
					response.sendRedirect("signup.jsp?error2=!! Password should be of atleast 5 characters !!");
			else if(password.equals(repassword)==false)
					response.sendRedirect("signup.jsp?error3=!! passwords do not  match !!");
			//cn1.close();
			cn.close();
		}
	}


	catch(Exception e)
	{
		
	}
%>
</body>
</html>