package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAODTO.ReviewDAO;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/ReviewDeleteServlet")
public class ReviewDeleteServlet extends HttpServlet {
	/*private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(deleteReview(num));
	}

	public String deleteReview(int num) {
		ReviewDAO dao = new ReviewDAO();
		if(dao.deleteReview(num)==1) {
			return "1";
		}else {
			return "2";
		}
	}
}
