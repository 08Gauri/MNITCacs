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
 * Servlet implementation class asd1
 */
@WebServlet("/asd1")
public class asd1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public asd1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection cnn=	DriverManager.getConnection("jdbc:mysql://localhost/dbms?user=root&password=password");
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String msg=request.getParameter("msg");
			String society=request.getParameter("society");
			String contact=request.getParameter("contact");
			PreparedStatement st1=cnn.prepareStatement("select socid from society where sname=?");
			st1.setString(1, society);
			ResultSet rs1=st1.executeQuery();
			rs1.next();
			String socid=rs1.getString(1);
			PreparedStatement st2=cnn.prepareStatement("insert into sponsers values(?,?,?,?,?)");
			st2.setString(1,email);
			st2.setString(2,name);
			st2.setString(3,contact);
			st2.setString(4,msg);
			st2.setString(5,socid);
			st2.executeUpdate();
		final String username = "2016ucp1438@mnit.ac.in"; // enter your mail id
		final String password = "Sanjaykalpana06";// enter ur password
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
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
				InternetAddress.parse(request.getParameter("email")));// whome u have to send mails that person id
			message.setSubject("SponserShip Mail MNIT-CACS");
			message.setText("Thank You for showing interest in our event. we will be contacting you soon");

			Transport.send(message);
			PrintWriter pw=response.getWriter();
			//pw.println("mail sent please login with the new password sent");
			response.sendRedirect("index.jsp");	
			cnn.close();

		}
		catch (MessagingException e) {
			throw new RuntimeException(e);
			
		}
		
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
