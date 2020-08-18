<%@ page import="java.io.*" import="java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="captchas.jsp">
Enter email : <input type="email" name="email"><br>
Enter Password :
<input type="password" name="password">
<%
String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
String value="";
for(int i=0;i<6;i++)
{
	Random rand=new Random();
	
	int as=rand.nextInt(62);
	value=value+str.charAt(as);
	
}
%>
<input type="text" name="captcha" value="<%=value%>">
<input type="text" name="captchad">
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
<input type="submit" name="submit">
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
</form>
</body>
</html>