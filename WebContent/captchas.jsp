<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
			PreparedStatement st=cn.prepareStatement("select * from users where email=? and password=?");
			st.setString(1,request.getParameter("email"));
			st.setString(2,request.getParameter("password"));
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				if(request.getParameter("captcha").toString().equals(request.getParameter("captchad").toString()))
				{
				String desg=rs.getString(9);
				HttpSession hs=request.getSession();
				hs.setAttribute("email",request.getParameter("email"));
				hs.setMaxInactiveInterval(300);
				cn.close();
				Cookie ck=new Cookie("suidg",request.getParameter("email"));
				ck.setMaxAge(365);
				response.addCookie(ck);
				
				if(desg.equals("Faculty"))
					response.sendRedirect("fwelcome.jsp");
				else if(desg.equals("Student"))
					response.sendRedirect("swelcome.jsp");
				else if(desg.equals("Student Coordinator"))
					response.sendRedirect("fwelcome.jsp");
			}
				else
				{
					response.sendRedirect("caaptcha_login.jsp?error1=re-enter captcha");
				}
			}
			else
			{
				response.sendRedirect("caaptcha_login.jsp?error=INVALID ID OR PASSWORD");
				cn.close();
			}
		}
		catch(Exception e)
		{
			
		}
	
%>
</body>
</html>