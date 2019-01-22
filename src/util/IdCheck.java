package util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAODTO.MemberDAO;
import DAODTO.MemberDTO;

	/**
	 * Servlet implementation class IdCheck
	 */
	@WebServlet("/IdCheck")
	public class IdCheck extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*인코딩설정*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		/*AJAX객체이용해서페이지넘김없이요소아이디.value가져옴*/
		String id = request.getParameter("j_id");
		
		
		/* 1. 가져온값으로 메소드실행*/
		/* 2. 메소드반환값으로 다시JSP페이지로넘겨줌 (스트링형태로꼭넘겨줘야함) */
		/* 3. JSP페이지 넘겨주기전에, 다시인코딩해줘야함 */
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(idCheck(id));
		}
		
		public String idCheck(String id) {
			String overlap;
			MemberDAO dao = new MemberDAO();
			String tempId = dao.idCheck(id);
			if(tempId.equals("") ) {
				overlap = "no";
			}else {
				overlap = "yes";
			}
			return overlap;
		}
	
	}
