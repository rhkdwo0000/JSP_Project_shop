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
import DAODTO.MemberDTO;

/**
 * Servlet implementation class SendTemporaryPassword
 */
@WebServlet("/SendTemporaryPassword")
public class SendTemporaryPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
			String trueAndFalse;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html);charset=UTF-8");
			String temporary = request.getParameter("k_temporary");
			String title = request.getParameter("k_title");
			String content = request.getParameter("k_content");
			String from = request.getParameter("k_from");
			String id = request.getParameter("k_id");
			String name = request.getParameter("k_name");
			String email = request.getParameter("k_email");
			
			
			/*response값 보내기전 인코딩 해줘야함*/
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(update(temporary,title,content,from,id,name,email));
		
	}
	
	public String update(String temporary, String title, String content, String from , String id , String name , String email) {
		
			Properties p = new Properties(); // 정보담을객체
			p.put("mail.smtp.host","smtp.naver.com");			/* 호스트 :: 네이버 */
			p.put("mail.smtp.port", "465");						/* 포트 :: 456 */
			p.put("mail.smtp.starttls.enable", "true");			/* starttls.enable(?) :: true */
			p.put("mail.smtp.auth", "true");					/* auth :: true */
			p.put("mail.smtp.debug", "true");	
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
		
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setEmail(email);
			boolean result = dao.forgotPassword(dto); 
			
			if( result == false ){ 
					trueAndFalse = "비밀번호 찾기가 실패 되었습니다.";
				/* 검색결과값이있을때, */
			}else if(result == true){
					/* 3항목모두 맞았을때 dao 접근임시비밀번호로 컬럼값변경 */
					dto.setPw(temporary);
					dao.temporary(dto);
					trueAndFalse = "임시비밀번호가 전송되었습니다.";
					
					try{
						Authenticator auth = new SMTPAuthenticatior();
						Session ses = Session.getInstance(p, auth);
						
						ses.setDebug(true);
						MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
						
						msg.setSubject(title); //  제목
						StringBuffer buffer = new StringBuffer();
						
						buffer.append("내용 : ");
						buffer.append(content+"<br>");   
						buffer.append("임시비밀번호 : ");
						buffer.append(temporary+"<br>");   
						Address fromAddr = new InternetAddress(from);
						msg.setFrom(fromAddr); 
						
						Address toAddr = new InternetAddress(email);
						msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
						
						msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
						Transport.send(msg); // 전송
						result = true;
						
					} catch(Exception e){
						e.printStackTrace();
				}
			}
				
			
		return trueAndFalse;
	}

}
