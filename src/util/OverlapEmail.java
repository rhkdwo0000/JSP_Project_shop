package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAODTO.MemberDAO;

@WebServlet("/OverlapEmail")
public class OverlapEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("j_email");
		
		

		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(overlap(email));
	}
	
	public String overlap(String email) {
		String overlapResult;
		MemberDAO dao = new MemberDAO();
		boolean result = dao.emailCheck(email);
		if(result) {
			overlapResult ="noEmail";
		}else {
			overlapResult ="yesEmail";
		}
		
		return overlapResult;
	}
	
	

}
