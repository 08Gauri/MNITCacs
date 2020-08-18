
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import javax.mail.*; 
import javax.mail.internet.*;

import java.sql.*;
/**
 * Servlet implementation class asd
 */
@WebServlet("/asd")
public class asd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public asd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		final String username = "2016ucp1438@mnit.ac.in"; // enter your mail id
		final String password = "Sanjaykalpana06";// enter ur password
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		String str="ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
		String value="";
		for(int i=0;i<6;i++)
		{
			Random rand=new Random();
			
			int as=rand.nextInt(60);
			value=value+str.charAt(as);
			
		}

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("2016ucp1438@mnit.ac.in")); // same email id
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(request.getParameter("mail")));// whome u have to send mails that person id
			message.setSubject("Testing Subject");
			message.setText("New Password is : "
				+value);

			Transport.send(message);
			PrintWriter pw=response.getWriter();
			//pw.println("mail sent please login with the new password sent");
			response.sendRedirect("login.jsp?error6=mail sent please login with the new password sent");
			
			
			
			

		}
		catch (MessagingException e) {
			throw new RuntimeException(e);
			
		}
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
			PreparedStatement st1=cn.prepareStatement("update users set password=? where email=?");
			st1.setString(2,request.getParameter("mail"));
			st1.setString(1, value);
			st1.executeUpdate();
		}
		catch(Exception e)
		{
			
		}
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}


