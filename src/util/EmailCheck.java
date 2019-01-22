package util;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAODTO.MemberDAO;

/**
 * Servlet implementation class EmailCheck
 */
@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String k_code = request.getParameter("k_code");
		String to = request.getParameter("j_email");
		String from = request.getParameter("from");
		String title = request.getParameter("title");
		System.out.println("넘어왔니??");
		
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(code(k_code,to,from ,title));
		
	}
	
	
	
	
	
	
	
	

	public String code(String k_code , String to , String from ,String title) {
		
		Properties p = new Properties(); // 정보를 담을 객체
		  
		p.put("mail.smtp.host","smtp.naver.com");			/* 호스트 :: 네이버 */
		p.put("mail.smtp.port", "465");						/* 포트 :: 456 */
		p.put("mail.smtp.starttls.enable", "true");			/* starttls.enable(?) :: true */
		p.put("mail.smtp.auth", "true");					/* auth :: true */
		p.put("mail.smtp.debug", "true");	
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		 
		
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(p, auth);
		      
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
		 
		    msg.setSubject(title); //  제목
		   
		    StringBuffer buffer = new StringBuffer();
		    
		    buffer.append("코드 : ");
		    buffer.append(k_code+"<br>");   
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); 
		    
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
		    Transport.send(msg); // 전송
		    
		    return k_code;
		    
		} catch(Exception e){
		    e.printStackTrace();
		}
		
		
		
		
		return null;
	}
	
	
	
}
